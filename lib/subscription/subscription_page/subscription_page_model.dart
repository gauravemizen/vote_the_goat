import 'dart:io';
import 'dart:convert';

import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'subscription_page_widget.dart' show SubscriptionPageWidget;
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:flutter/foundation.dart';
import '/backend/api_requests/api_calls.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SubscriptionPageModel extends FlutterFlowModel<SubscriptionPageWidget> {
  // State fields for stateful widgets in this page
  late GradientButtonCustomModel gradientButtonCustomModel;

  // In-app purchase related fields
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  bool _isAvailable = false;
  List<ProductDetails> _products = [];
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  bool _isLoading = false;
  String? _purchasingProductId;

  // Add duplicate transaction filtering
  final Set<String> _processedTransactions = {};

  // Product IDs - must match store configuration
  static const String explorerPlanId = 'explorer_monthly';
  static const String masterPlanId = 'master_monthly';
  static const String extraVoteFreeId = 'extra_vote_free';
  static const String extraVoteExplorerId = 'extra_vote_explorer';

  // User subscription state
  String currentPlan = 'free'; // 'free', 'explorer', 'master'
  int extraVotes = 0;
  bool isVisible = true;

  bool isSubscriptionLoading = true;

  // State callback for UI updates
  VoidCallback? onStateChanged;

  final Map<String, DebugDataField> debugGeneratorVariables = {};
  final Map<String, DebugDataField> debugBackendQueries = {};
  final Map<String, FlutterFlowModel> widgetBuilderComponents = {};

  @override
  void initState(BuildContext context) {
    gradientButtonCustomModel =
        createModel(context, () => GradientButtonCustomModel());
    _initializeInAppPurchase();
  }

  // Updated initialization to check subscription status
  Future<void> _initializeInAppPurchase() async {
    try {
      _isAvailable = await _inAppPurchase.isAvailable();
      print('In-app purchase available: $_isAvailable');

      if (_isAvailable) {
        _subscription = _inAppPurchase.purchaseStream.listen(
          _handlePurchaseUpdates,
          onDone: () => print('Purchase stream done'),
          onError: (error) => print('Purchase stream error: $error'),
        );

        await _loadProductDetails();
      }

      // First load local state
      await _loadUserSubscriptionState();

      // Then check server status to ensure it's up to date
      await checkCurrentSubscriptionStatus();
    } catch (e) {
      print('Initialize in-app purchase error: $e');
      await _loadUserSubscriptionState();
    }
  }

  Future<void> checkCurrentSubscriptionStatus() async {
    try {
      isSubscriptionLoading = true;
      _notifyStateChanged();

      print('=== CHECKING SUBSCRIPTION STATUS FROM SERVER ===');

      final authToken = FFAppState().authToken;
      if (authToken == null || authToken.isEmpty) {
        print("No auth token → FREE plan");
        currentPlan = "free";
        extraVotes = 0;
        await _saveUserSubscriptionState();

        // Set loading to false
        isSubscriptionLoading = false;
        _notifyStateChanged();
        return;
      }

      final response = await DashboardGroup.subscriptionListCall.call(
        authToken: authToken,
      );

      if (!response.succeeded || response.jsonBody == null) {
        print("API failed → loading local state");
        await _loadUserSubscriptionState();

        // Set loading to false
        isSubscriptionLoading = false;
        _notifyStateChanged();
        return;
      }

      final rawData = response.jsonBody["data"];
      print("Subscription Data: $rawData");

      // Convert API into a list ALWAYS
      final List<dynamic> subscriptions = [];

      if (rawData == null) {
        print("No active subscription → FREE PLAN");
        currentPlan = "free";
        extraVotes = 0;
        await _saveUserSubscriptionState();

        // Set loading to false
        isSubscriptionLoading = false;
        _notifyStateChanged();
        return;
      } else if (rawData is Map<String, dynamic>) {
        subscriptions.add(rawData);
      } else if (rawData is List) {
        subscriptions.addAll(rawData);
      }

      print("Parsed subscriptions: $subscriptions");

      String newPlan = "free";
      int newVotes = 0;

      for (final sub in subscriptions) {
        final status = (sub["status"] ?? "").toString().toLowerCase();
        final planId = (sub["plan_name"] ?? sub["product_id"] ?? "")
            .toString()
            .toLowerCase();

        // if (status == "active") {

        if (status == "active" || status == "cancelled") {
          final endsAt = DateTime.tryParse(sub["ends_at"] ?? "");
          final expired = endsAt != null && endsAt.isBefore(DateTime.now());

          if (!expired) {
            if (planId == "explorer_monthly") newPlan = "explorer";
            if (planId == "master_monthly") newPlan = "master";
            if (planId.contains("extra_vote")) newVotes++;
          }
        }
      }

      print("Final Plan From Server: $newPlan | Votes: $newVotes");

      currentPlan = newPlan;
      extraVotes = newVotes;

      await _saveUserSubscriptionState();

      // Set loading to false at the end
      isSubscriptionLoading = false;
      _notifyStateChanged();
    } catch (e) {
      print("ERROR checking subscription: $e");
      await _loadUserSubscriptionState();

      // Set loading to false on error
      isSubscriptionLoading = false;
      _notifyStateChanged();
    }
  }

  ///

  ///

  Future<void> _notifyAdSystemOfPlanChange() async {
    try {
      final appState = FFAppState();
      await appState.updateSubscriptionState(currentPlan);

      debugPrint(
          '[SubscriptionPageModel] Notified ad system of plan change: $currentPlan');
    } catch (e) {
      debugPrint('[SubscriptionPageModel] Error notifying ad system: $e');
    }
  }

  Future<void> updateExtraVoteSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('extra_votes', extraVotes);
      await prefs.setBool('unlimited_votes', currentPlan == 'master');

      FFAppState().update(() {
        FFAppState().extraVotes = extraVotes;
        FFAppState().hasUnlimitedVotes = (currentPlan == 'master');
      });

      print(
          'Extra vote settings updated: votes=$extraVotes, unlimited=${currentPlan == 'master'}');
    } catch (e) {
      print('Error updating extra vote settings: $e');
    }
  }

  // Future<void> _saveUserSubscriptionState() async {
  //   try {
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('current_plan', currentPlan);
  //     await prefs.setInt('extra_votes', extraVotes);
  //
  //     await updateExtraVoteSettings();
  //
  //     print('Saved user state: Plan=$currentPlan, Votes=$extraVotes');
  //     _notifyStateChanged();
  //   } catch (e) {
  //     print('Save user subscription state error: $e');
  //   }
  // }

  Future<void> _saveUserSubscriptionState() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Save locally
      await prefs.setString('current_plan', currentPlan);
      await prefs.setInt('extra_votes', extraVotes);

      // Update app-wide state so UI reflects changes
      FFAppState().update(() {
        FFAppState().currentPlan = currentPlan;
        FFAppState().extraVotes = extraVotes;
        FFAppState().hasUnlimitedVotes = (currentPlan == "master");
      });

      await updateExtraVoteSettings();

      print('Saved user state: Plan=$currentPlan, Votes=$extraVotes');

      // Notify UI
      _notifyStateChanged();
    } catch (e) {
      print('Save user subscription state error: $e');
    }
  }

  Future<void> _loadUserSubscriptionState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      currentPlan = prefs.getString('current_plan') ?? 'free';
      extraVotes = prefs.getInt('extra_votes') ?? 0;

      await updateExtraVoteSettings();

      print('Loaded user state: Plan=$currentPlan, Votes=$extraVotes');
      _notifyStateChanged();
    } catch (e) {
      print('Load user subscription state error: $e');
    }
  }

  bool shouldShowAds() {
    return currentPlan == 'free';
  }

  String getExtraVoteStatus() {
    if (currentPlan == 'master') {
      return 'Unlimited Extra Votes';
    } else if (extraVotes > 0) {
      return '$extraVotes Extra Vote${extraVotes > 1 ? 's' : ''} Available';
    } else {
      return 'No Extra Votes';
    }
  }

  bool useExtraVoteIfAvailable() {
    if (currentPlan == 'master') {
      return true;
    } else if (extraVotes > 0) {
      extraVotes--;
      _saveUserSubscriptionState();
      return true;
    }
    return false;
  }

  Future<void> _loadProductDetails() async {
    try {
      const Set<String> productIds = {
        explorerPlanId,
        masterPlanId,
        extraVoteFreeId,
        extraVoteExplorerId,
      };

      final ProductDetailsResponse response =
          await _inAppPurchase.queryProductDetails(productIds);

      if (response.notFoundIDs.isNotEmpty) {
        print('Products not found: ${response.notFoundIDs}');
      }

      _products = response.productDetails;
      print('Found ${_products.length} products');

      for (var product in _products) {
        print('Product: ${product.id} - ${product.title} - ${product.price}');
      }

      _notifyStateChanged();
    } catch (e) {
      print('Load product details error: $e');
    }
  }

  Future<void> restorePurchases() async {
    try {
      print('Restoring purchases...');
      await _inAppPurchase.restorePurchases();
      print('Restore purchases completed');
    } catch (e) {
      print('Restore purchases error: $e');
    }
  }

  // void _notifyStateChanged() {
  //   if (onStateChanged != null) {
  //     onStateChanged!();
  //   }
  // }

  void _notifyStateChanged() {
    FFAppState().update(() {
      FFAppState().currentPlan = currentPlan;
      FFAppState().extraVotes = extraVotes;
      FFAppState().hasUnlimitedVotes = (currentPlan == "master");
    });

    if (onStateChanged != null) {
      onStateChanged!();
    }
  }

  ProductDetails? getProductDetails(String productId) {
    try {
      return _products.firstWhere((product) => product.id == productId);
    } catch (e) {
      print('Product not found: $productId');
      return null;
    }
  }

  String getFormattedPrice(String productId) {
    final product = getProductDetails(productId);
    if (product != null) {
      return product.price;
    }

    switch (productId) {
      case explorerPlanId:
        return '\$1.99';
      case masterPlanId:
        return '\$6.99';
      case extraVoteFreeId:
        return '\$5.99';
      case extraVoteExplorerId:
        return '\$3.99';
      default:
        return 'N/A';
    }
  }

  String getExtraVotePrice() {
    String productId =
        currentPlan == 'explorer' ? extraVoteExplorerId : extraVoteFreeId;
    return getFormattedPrice(productId);
  }

  bool canPurchasePlan(String productId) {
    if (_isLoading) return false;
    if (!_isAvailable) return false;
    return true;
  }

  String getPlanButtonText(String productId) {
    if (!_isAvailable) return 'Store Not Available';

    if (isPurchasing(productId)) return 'Processing...';

    switch (productId) {
      case explorerPlanId:
        if (currentPlan == 'explorer') return 'Current Plan';
        if (currentPlan == 'master') return 'Switch to Explorer';
        return 'Upgrade to Explorer';
      case masterPlanId:
        if (currentPlan == 'master') return 'Current Plan';
        return 'Upgrade to Master';
      default:
        return 'Select Plan';
    }
  }

  Future<bool> purchaseSubscription(String productId) async {
    if (!_isAvailable) {
      _showErrorMessage('Store not available');
      return false;
    }

    if (isPlanActive(productId)) {
      _showErrorMessage('You already have this plan active');
      return false;
    }

    try {
      _isLoading = true;
      _purchasingProductId = productId;
      _notifyStateChanged();

      final ProductDetails? product = getProductDetails(productId);
      if (product == null) {
        _showErrorMessage('Product not found');
        _isLoading = false;
        _purchasingProductId = null;
        _notifyStateChanged();
        return false;
      }

      final PurchaseParam purchaseParam =
          PurchaseParam(productDetails: product);
      bool result =
          await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
      print('Purchase initiated: $result');

      return result;
    } catch (e) {
      print('Purchase subscription error: $e');
      _showErrorMessage('Purchase failed: ${e.toString()}');
      _isLoading = false;
      _purchasingProductId = null;
      _notifyStateChanged();
      return false;
    }
  }

  bool isPlanActive(String productId) {
    switch (productId) {
      case explorerPlanId:
        return currentPlan == 'explorer';
      case masterPlanId:
        return currentPlan == 'master';
      default:
        return false;
    }
  }

  Future<bool> purchaseExtraVote() async {
    if (!_isAvailable || _isLoading) {
      _showErrorMessage('Unable to purchase at this time');
      return false;
    }

    try {
      _isLoading = true;
      _purchasingProductId = 'extra_vote';
      _notifyStateChanged();

      String productId =
          currentPlan == 'explorer' ? extraVoteExplorerId : extraVoteFreeId;
      final ProductDetails? product = getProductDetails(productId);
      if (product == null) {
        _showErrorMessage('Extra vote product not found');
        _isLoading = false;
        _purchasingProductId = null;
        _notifyStateChanged();
        return false;
      }

      final PurchaseParam purchaseParam =
          PurchaseParam(productDetails: product);
      bool result =
          await _inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
      print('Extra vote purchase initiated: $result');

      return result;
    } catch (e) {
      print('Extra vote purchase error: $e');
      _showErrorMessage('Extra vote purchase failed');
      _isLoading = false;
      _purchasingProductId = null;
      _notifyStateChanged();
      return false;
    }
  }

  void _handlePurchaseUpdates(List<PurchaseDetails> purchaseDetailsList) {
    for (final purchaseDetails in purchaseDetailsList) {
      print(
          'Purchase update: ${purchaseDetails.productID} - ${purchaseDetails.status}');

      if (purchaseDetails.status == PurchaseStatus.purchased) {
        _processPurchase(purchaseDetails);
      } else if (purchaseDetails.status == PurchaseStatus.error) {
        _showErrorMessage(
            'Purchase failed: ${purchaseDetails.error?.message ?? 'Unknown error'}');
      } else if (purchaseDetails.status == PurchaseStatus.canceled) {
        _showErrorMessage('Purchase was cancelled');
      } else if (purchaseDetails.status == PurchaseStatus.restored) {
        _processPurchaseRestore(purchaseDetails);
      }

      if (purchaseDetails.pendingCompletePurchase) {
        _inAppPurchase.completePurchase(purchaseDetails);
      }
    }
    _isLoading = false;
    _purchasingProductId = null;
    _notifyStateChanged();
  }

  void _processPurchase(PurchaseDetails purchaseDetails) {
    String? transactionId = purchaseDetails.purchaseID;
    if (transactionId == null ||
        _processedTransactions.contains(transactionId)) {
      print(
          'Skipping duplicate purchase callback for transaction: $transactionId');
      return;
    }
    _processedTransactions.add(transactionId);

    String? originalTransactionId = purchaseDetails.purchaseID;
    if (purchaseDetails.purchaseID != originalTransactionId) {
      print('Auto-renewal detected for ${purchaseDetails.productID}');
    }

    if (kDebugMode) {
      print('=== PROCESSING PURCHASE ===');
      print('Product ID: ${purchaseDetails.productID}');
      print('Purchase ID: ${purchaseDetails.purchaseID}');
      print('Transaction Date: ${purchaseDetails.transactionDate}');
      print('Status: ${purchaseDetails.status}');
    }

    String previousPlan = currentPlan;

    switch (purchaseDetails.productID) {
      case explorerPlanId:
        if (kDebugMode) {
          print('Processing Explorer Plan purchase');
          print('Previous plan: $previousPlan');
        }
        currentPlan = 'explorer';
        _cancelPreviousPlan(previousPlan);
        _showSuccessMessage(
            'Explorer Plan activated! Enjoy ad-free experience.');
        _callUserSubscriptionAPI(purchaseDetails, 'explorer_monthly',
            'Explorer Plan', '1.99', '1 month');
        break;

      case masterPlanId:
        if (kDebugMode) {
          print('Processing Master Plan purchase');
          print('Previous plan: $previousPlan');
        }
        currentPlan = 'master';
        _cancelPreviousPlan(previousPlan);
        _showSuccessMessage(
            'Master Plan activated! Unlimited votes and ad-free experience.');
        _callUserSubscriptionAPI(purchaseDetails, 'master_monthly',
            'Master Plan', '6.99', '1 month');
        break;

      case extraVoteFreeId:
      case extraVoteExplorerId:
        if (kDebugMode) {
          print('Processing Extra Vote purchase');
          print('Product ID: ${purchaseDetails.productID}');
          print('Current extra votes before: $extraVotes');
        }
        extraVotes += 1;
        String planName = purchaseDetails.productID == extraVoteExplorerId
            ? 'Extra Vote Explorer'
            : 'Extra Vote Free';
        String price =
            purchaseDetails.productID == extraVoteExplorerId ? '3.99' : '5.99';
        _showSuccessMessage('1 Extra vote added to your account!');
        _callUserSubscriptionAPI(purchaseDetails, purchaseDetails.productID,
            planName, price, 'one-time');
        if (kDebugMode) {
          print('Current extra votes after: $extraVotes');
        }
        break;
    }

    _saveUserSubscriptionState();
    _notifyAdSystemOfPlanChange();
  }

  void _processPurchaseRestore(PurchaseDetails purchaseDetails) {
    String? transactionId = purchaseDetails.purchaseID;
    if (transactionId == null ||
        _processedTransactions.contains(transactionId)) {
      print(
          'Skipping duplicate restore callback for transaction: $transactionId');
      return;
    }
    _processedTransactions.add(transactionId);

    print('=== PROCESSING RESTORE ===');
    print('Restoring purchase: ${purchaseDetails.productID}');

    switch (purchaseDetails.productID) {
      case explorerPlanId:
        if (currentPlan != 'explorer' && currentPlan != 'master') {
          print('Validating Explorer plan restore...');
          _showSuccessMessage('Validating Explorer plan...');
          _validateExistingSubscription(
              purchaseDetails, 'explorer_monthly', 'Explorer Plan');
        }
        break;
      case masterPlanId:
        if (currentPlan != 'master') {
          print('Validating Master plan restore...');
          _showSuccessMessage('Validating Master plan...');
          _validateExistingSubscription(
              purchaseDetails, 'master_monthly', 'Master Plan');
        }
        break;
    }
  }

  Future<void> _validateExistingSubscription(
      PurchaseDetails purchaseDetails, String planId, String planName) async {
    try {
      if (kDebugMode) {
        print('=== VALIDATING EXISTING SUBSCRIPTION ===');
        print('Plan ID: $planId');
        print('Plan Name: $planName');
      }

      String? authToken = FFAppState().authToken;
      if (authToken == null || authToken.isEmpty) {
        if (kDebugMode) {
          print('ERROR: Auth token is null or empty');
        }
        _showErrorMessage("Please login again to restore your subscription.");
        return;
      }

      String transactionId = purchaseDetails.purchaseID ?? '';
      String receipt = purchaseDetails.verificationData.serverVerificationData;
      String platform = Platform.isAndroid ? 'android' : 'ios';
      String purchaseTime = purchaseDetails.transactionDate ??
          DateTime.now().millisecondsSinceEpoch.toString();
      String productId = purchaseDetails.productID;

      int? purchaseTimeInt;
      if (purchaseTime.isNotEmpty) {
        purchaseTimeInt =
            int.tryParse(purchaseTime) ?? DateTime.now().millisecondsSinceEpoch;
      }

      final response = await DashboardGroup.userSubscriptionCall.call(
        planId: planId,
        planName: '$planName (Restored)',
        price: '0.00',
        transactionId: transactionId,
        purchaseToken: receipt,
        platform: platform,
        purchaseTime: purchaseTimeInt,
        productId: productId,
        autoRenewing: true,
        isAcknowledged: true,
        platformVersion: platform,
        rawResponse: '{}',
        authToken: authToken,
      );

      if (kDebugMode) {
        print('=== VALIDATION API RESPONSE ===');
        print('Success: ${response.succeeded}');
        print('Status Code: ${response.statusCode}');
      }

      if (response.succeeded) {
        final subscription = response.jsonBody["data"];
        final expiresAt = DateTime.tryParse(subscription["ends_at"] ?? "");

        if (expiresAt != null && expiresAt.isBefore(DateTime.now())) {
          currentPlan = 'free';
          print('Restored subscription is expired → switching to free');
          _showSuccessMessage(
              'Subscription has expired. You are now on the free plan.');
          await _saveUserSubscriptionState();
          return;
        }

        if (planId == 'explorer_monthly') {
          currentPlan = 'explorer';
          _showSuccessMessage('Explorer plan restored successfully!');
        } else if (planId == 'master_monthly') {
          currentPlan = 'master';
          _showSuccessMessage('Master plan restored successfully!');
        }

        await _saveUserSubscriptionState();

        if (kDebugMode) {
          print('Subscription validation successful');
        }
      } else {
        currentPlan = 'free';
        _showErrorMessage(
            'Could not validate subscription. Please contact support.');
        await _saveUserSubscriptionState();

        if (kDebugMode) {
          print('Subscription validation failed: ${response.exceptionMessage}');
        }
      }
    } catch (e) {
      currentPlan = 'free';
      _showErrorMessage(
          'Error validating subscription. Please try again later.');
      await _saveUserSubscriptionState();

      if (kDebugMode) {
        print('ERROR in _validateExistingSubscription: $e');
      }
    }
  }

  Future<void> _callUserSubscriptionAPI(PurchaseDetails purchaseDetails,
      String planId, String planName, String price, String duration) async {
    try {
      if (kDebugMode) {
        print('=== CALLING USER SUBSCRIPTION API ===');
        print('Plan ID: $planId');
        print('Plan Name: $planName');
        print('Price: $price');
        print('Duration: $duration');
      }

      String? authToken = FFAppState().authToken;
      if (authToken == null || authToken.isEmpty) {
        if (kDebugMode) {
          print('ERROR: Auth token is null or empty');
        }
        return;
      }

      String transactionId = purchaseDetails.purchaseID ?? '';
      String purchaseToken =
          purchaseDetails.verificationData.serverVerificationData;
      String receipt = purchaseDetails.verificationData.serverVerificationData;
      String platform = Platform.isAndroid ? 'android' : 'ios';
      String purchaseTime = purchaseDetails.transactionDate ??
          DateTime.now().millisecondsSinceEpoch.toString();
      String productId = purchaseDetails.productID;

      String platformVersion = Platform.isAndroid ? 'android' : 'ios';
      String autoRenewing = 'true';
      String isAcknowledged = 'true';
      String rawResponse = '{}';

      if (kDebugMode) {
        print('API Call Parameters:');
        print('Auth Token: ${authToken.substring(0, 10)}...');
        print('Transaction ID: $transactionId');
        print('Purchase Token: ${receipt.substring(0, 20)}...');
        print('Platform: $platform');
        print('Purchase Time: $purchaseTime');
        print('Product ID: $productId');
      }

      int? purchaseTimeInt;
      if (purchaseTime.isNotEmpty) {
        purchaseTimeInt =
            int.tryParse(purchaseTime) ?? DateTime.now().millisecondsSinceEpoch;
      }

      bool autoRenewingBool = autoRenewing.toLowerCase() == 'true';
      bool isAcknowledgedBool = isAcknowledged.toLowerCase() == 'true';

      final response = await DashboardGroup.userSubscriptionCall.call(
        planId: planId,
        planName: planName,
        price: price,
        transactionId: transactionId,
        purchaseToken: receipt,
        platform: platform,
        purchaseTime: purchaseTimeInt,
        productId: productId,
        autoRenewing: autoRenewingBool,
        isAcknowledged: isAcknowledgedBool,
        platformVersion: platformVersion,
        rawResponse: rawResponse,
        authToken: authToken,
      );

      if (kDebugMode) {
        print('=== API RESPONSE ===');
        print('Success: ${response.succeeded}');
        print('Status Code: ${response.statusCode}');
        print('Response Body: ${response.bodyText}');

        if (response.succeeded) {
          final subscriptionData = DashboardGroup.userSubscriptionCall
              .subscriptionData(response.jsonBody);
          print('Subscription Data: $subscriptionData');
        } else {
          print('API Error: ${response.statusCode}');
        }
      }

      if (response.succeeded) {
        if (kDebugMode) {
          print('Subscription API call successful');
        }
      } else {
        if (kDebugMode) {
          print('Subscription API call failed: ${response.exceptionMessage}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('ERROR in _callUserSubscriptionAPI: $e');
        print('Stack trace: ${StackTrace.current}');
      }
    }
  }

  void _cancelPreviousPlan(String previousPlan) {
    if (previousPlan != 'free') {
      print('Switching from $previousPlan plan');
    }
  }

  void _showSuccessMessage(String message) {
    print('Success: $message');
  }

  void _showErrorMessage(String message) {
    print('Error: $message');
  }

  bool canUseExtraVote() {
    return currentPlan == 'master' || extraVotes > 0;
  }

  void useExtraVote() {
    if (currentPlan == 'master') {
      return;
    } else if (extraVotes > 0) {
      extraVotes--;
      _saveUserSubscriptionState();
    }
  }

  bool get isAdFree => currentPlan != 'free';

  bool get isLoading => _isLoading;

  String? get purchasingProductId => _purchasingProductId;

  bool isPurchasing(String productId) {
    return _isLoading && _purchasingProductId == productId;
  }

  String getPlanDisplayName(String plan) {
    switch (plan) {
      case 'explorer':
        return 'Explorer';
      case 'master':
        return 'Master';
      default:
        return 'Free';
    }
  }

  @override
  void dispose() {
    if (_isAvailable) {
      _subscription.cancel();
    }
    gradientButtonCustomModel.dispose();
  }

  @override
  WidgetClassDebugData toWidgetClassDebugData() => WidgetClassDebugData(
        generatorVariables: debugGeneratorVariables,
        backendQueries: debugBackendQueries,
        componentStates: {
          'gradientButtonCustomModel (gradientButtonCustom)':
              gradientButtonCustomModel.toWidgetClassDebugData(),
          ...widgetBuilderComponents.map(
            (key, value) => MapEntry(
              key,
              value.toWidgetClassDebugData(),
            ),
          ),
        }.withoutNulls,
        link:
            'https://app.flutterflow.io/project/vote-for-goatbackup-wupd2r/tab=uiBuilder&page=SubscriptionPage',
        searchReference:
            'reference=OhBTdWJzY3JpcHRpb25QYWdlUAFaEFN1YnNjcmlwdGlvblBhZ2U=',
        widgetClassName: 'SubscriptionPage',
      );
}
