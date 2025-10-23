import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'subscription_page_widget.dart' show SubscriptionPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:io';

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

  // Product IDs - must match store configuration
  static const String explorerPlanId = 'explorer_monthly';
  static const String masterPlanId = 'master_monthly';
  static const String extraVoteFreeId = 'extra_vote_free';
  static const String extraVoteExplorerId = 'extra_vote_explorer';

  // User subscription state
  String currentPlan = 'free'; // 'free', 'explorer', 'master'
  int extraVotes = 0;
  bool isVisible = true;

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
    debugLogWidgetClass(this);
  }

  Future<void> _initializeInAppPurchase() async {
    try {
      _isAvailable = await _inAppPurchase.isAvailable();
      print('In-app purchase available: $_isAvailable');

      if (_isAvailable) {
        // Listen to purchase updates
        _subscription = _inAppPurchase.purchaseStream.listen(
          _handlePurchaseUpdates,
          onDone: () => print('Purchase stream done'),
          onError: (error) => print('Purchase stream error: $error'),
        );

        await _loadProductDetails();
        await restorePurchases();
      }

      await _loadUserSubscriptionState();
    } catch (e) {
      print('Initialize in-app purchase error: $e');
      await _loadUserSubscriptionState();
    }
  }

  Future<void> _notifyAdSystemOfPlanChange() async {
    try {
      final appState = FFAppState();
      await appState.updateSubscriptionState(currentPlan);

      debugPrint('[SubscriptionPageModel] Notified ad system of plan change: $currentPlan');
    } catch (e) {
      debugPrint('[SubscriptionPageModel] Error notifying ad system: $e');
    }
  }

  Future<void> updateAdSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      bool shouldShowAds = currentPlan == 'free';
      await prefs.setBool('show_ads', shouldShowAds);

      // Update global ad state
      FFAppState().update(() {
        FFAppState().showAds = shouldShowAds;
        FFAppState().isAdFree = !shouldShowAds;
      });

      print('Ad settings updated: showAds=$shouldShowAds, plan=$currentPlan');
    } catch (e) {
      print('Error updating ad settings: $e');
    }
  }
  Future<void> updateExtraVoteSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('extra_votes', extraVotes);
      await prefs.setBool('unlimited_votes', currentPlan == 'master');

      // Update global extra vote state
      FFAppState().update(() {
        FFAppState().extraVotes = extraVotes;
        FFAppState().hasUnlimitedVotes = (currentPlan == 'master');
      });

      print('Extra vote settings updated: votes=$extraVotes, unlimited=${currentPlan == 'master'}');
    } catch (e) {
      print('Error updating extra vote settings: $e');
    }
  }
  @override
  Future<void> _saveUserSubscriptionState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('current_plan', currentPlan);
      await prefs.setInt('extra_votes', extraVotes);

      // Update ad and extra vote settings
      await updateAdSettings();
      await updateExtraVoteSettings();

      print('Saved user state: Plan=$currentPlan, Votes=$extraVotes');
      _notifyStateChanged();
    } catch (e) {
      print('Save user subscription state error: $e');
    }
  }


  @override
  Future<void> _loadUserSubscriptionState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      currentPlan = prefs.getString('current_plan') ?? 'free';
      extraVotes = prefs.getInt('extra_votes') ?? 0;

      // Load and apply ad settings
      await updateAdSettings();
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
      return true; // Unlimited for master plan
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

      // Debug: Print all found products
      for (var product in _products) {
        print('Product: ${product.id} - ${product.title} - ${product.price}');
      }

      _notifyStateChanged();
    } catch (e) {
      print('Load product details error: $e');
    }
  }

  Future<void> loadUserSubscriptionState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      currentPlan = prefs.getString('current_plan') ?? 'free';
      extraVotes = prefs.getInt('extra_votes') ?? 0;
      print('Loaded user state: Plan=$currentPlan, Votes=$extraVotes');
      _notifyStateChanged();
    } catch (e) {
      print('Load user subscription state error: $e');
    }
  }

  Future<void> saveUserSubscriptionState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('current_plan', currentPlan);
      await prefs.setInt('extra_votes', extraVotes);
      print('Saved user state: Plan=$currentPlan, Votes=$extraVotes');
      _notifyStateChanged();
    } catch (e) {
      print('Save user subscription state error: $e');
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

  void _notifyStateChanged() {
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

    // Fallback prices if products not loaded yet
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
    String productId = currentPlan == 'explorer' ? extraVoteExplorerId : extraVoteFreeId;
    return getFormattedPrice(productId);
  }

  bool canPurchasePlan(String productId) {
    // Can't purchase if already loading
    if (_isLoading) return false;

    // Can't purchase if store not available
    if (!_isAvailable) return false;

    // Users can always switch plans - no restrictions
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

    // Prevent purchasing the same plan
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

      final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);

      // For subscriptions, use buyNonConsumable
      bool result = await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
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

      String productId = currentPlan == 'explorer' ? extraVoteExplorerId : extraVoteFreeId;
      final ProductDetails? product = getProductDetails(productId);
      if (product == null) {
        _showErrorMessage('Extra vote product not found');
        _isLoading = false;
        _purchasingProductId = null;
        _notifyStateChanged();
        return false;
      }

      final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
      bool result = await _inAppPurchase.buyConsumable(purchaseParam: purchaseParam);
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
      print('Purchase update: ${purchaseDetails.productID} - ${purchaseDetails.status}');

      if (purchaseDetails.status == PurchaseStatus.purchased) {
        _processPurchase(purchaseDetails);
      } else if (purchaseDetails.status == PurchaseStatus.error) {
        _showErrorMessage('Purchase failed: ${purchaseDetails.error?.message ?? 'Unknown error'}');
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

  @override
  void _processPurchase(PurchaseDetails purchaseDetails) {
    String previousPlan = currentPlan;

    switch (purchaseDetails.productID) {
      case explorerPlanId:
        _cancelPreviousPlan(previousPlan);
        currentPlan = 'explorer';
        _showSuccessMessage('Explorer plan activated! Ads removed.');
        break;
      case masterPlanId:
        _cancelPreviousPlan(previousPlan);
        currentPlan = 'master';
        _showSuccessMessage('Master plan activated! Unlimited extra votes and no ads.');
        break;
      case extraVoteFreeId:
      case extraVoteExplorerId:
        extraVotes++;
        _showSuccessMessage('Extra vote purchased successfully!');
        break;
    }

    _saveUserSubscriptionState();
    _notifyAdSystemOfPlanChange(); // Add this line
  }

  void _processPurchaseRestore(PurchaseDetails purchaseDetails) {
    print('Restoring purchase: ${purchaseDetails.productID}');

    switch (purchaseDetails.productID) {
      case explorerPlanId:
        if (currentPlan != 'explorer' && currentPlan != 'master') {
          currentPlan = 'explorer';
          print('Explorer plan restored');
          _showSuccessMessage('Explorer plan restored!');
          _saveUserSubscriptionState();
        }
        break;
      case masterPlanId:
        if (currentPlan != 'master') {
          currentPlan = 'master';
          print('Master plan restored');
          _showSuccessMessage('Master plan restored!');
          _saveUserSubscriptionState();
        }
        break;
    }
  }

  void _cancelPreviousPlan(String previousPlan) {
    if (previousPlan != 'free') {
      print('Switching from $previousPlan plan');
      // Previous plan is automatically cancelled when new plan is activated
      // Store platforms handle this automatically for subscription switching
    }
  }

  void _showSuccessMessage(String message) {
    print('Success: $message');
    // You can implement your preferred way to show success messages
    // For example: ScaffoldMessenger.of(context).showSnackBar(...)
  }

  void _showErrorMessage(String message) {
    print('Error: $message');
    // You can implement your preferred way to show error messages
    // For example: ScaffoldMessenger.of(context).showSnackBar(...)
  }

  bool canUseExtraVote() {
    return currentPlan == 'master' || extraVotes > 0;
  }

  void useExtraVote() {
    if (currentPlan == 'master') {
      // Unlimited for master plan
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
      gradientButtonCustomModel?.toWidgetClassDebugData(),
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
