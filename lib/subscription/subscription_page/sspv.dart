// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// import 'package:collection/collection.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart' as http;
// import 'package:in_app_purchase/in_app_purchase.dart';
// import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
// import 'package:in_app_purchase_android/in_app_purchase_android.dart';
// import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
// import 'package:loader_overlay/loader_overlay.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../main.dart';
// import '../../../../service/api_service/api_service.dart';
// import '../../../../service/api_service/status_enum.dart';
// import '../../../../utils/app_toast/show_toast.dart';
// import '../../../../utils/inapp_utils/consumable_store.dart';
// import '../../../../utils/shared_pre/shared_pre.dart';
// import '../../dashboard/provider/parent_dashboard_provider.dart';
// import '../modal/children_list_model.dart';
// import '../modal/get_subscription_modal.dart';
// import '../modal/in_app_purchase_modal.dart';
//
// class SubscriptionProvider extends ChangeNotifier {
//   final InAppPurchase _iapConnection = InAppPurchase.instance;
//
//   List<ProductDetails>? productDetailsGloble;
//   List<GetSubscriptionData> getSubscriptionDataList = [];
//   List<ChildrenListAll> childrenAllListData = [];
//
//   // Selected child IDs for multiple selection
//   List<String> selectedChildIds = [];
//
//   // Method to toggle child selection
//   void toggleChildSelection(String childId) {
//     if (selectedChildIds.contains(childId)) {
//       selectedChildIds.remove(childId);
//     } else {
//       selectedChildIds.add(childId);
//     }
//
//     // Clear subscription selection when child selection changes
//     selectedSubscriptionId = null;
//
//     print("Selected children count: ${selectedChildIds.length}");
//     print("Available plans for ${selectedChildIds.length} children: ${filteredSubscriptionPlans.length}");
//
//     notifyListeners();
//   }
//
//   // Method to clear all selections
//   void clearChildSelections() {
//     selectedChildIds.clear();
//     notifyListeners();
//   }
//
//   // Method to select all children
//   void selectAllChildren() {
//     selectedChildIds = childrenAllListData.map((child) => child.id ?? "").where((id) => id.isNotEmpty).toList();
//     notifyListeners();
//   }
//
//   // Method to get selected children data
//   List<ChildrenListAll> getSelectedChildren() {
//     return childrenAllListData.where((child) => selectedChildIds.contains(child.id)).toList();
//   }
//
//   // Getter to filter subscription plans based on selected children count
//   List<GetSubscriptionData> get filteredSubscriptionPlans {
//     final selectedCount = selectedChildIds.length;
//
//     // If no children selected, return empty list or all plans (based on your preference)
//     if (selectedCount == 0) {
//       return []; // Return empty list when no children selected
//     }
//
//     // Filter plans where maxChildren matches the selected children count
//     return getSubscriptionDataList.where((plan) {
//       return plan.maxChildren == selectedCount;
//     }).toList();
//   }
//
//   // Loaded flag to avoid repeated API calls from Stateless widget
//   bool subscriptionsLoaded = false;
//   Future<void> ensureSubscriptionsLoaded(BuildContext context) async {
//     final dashboardProvider = Provider.of<ParentDashboardProvider>(context, listen: false);
//
//     if (subscriptionsLoaded) return;
//     await getSubscriptionListApi(context,dashboardProvider.selectedChildID);
//   }
//
//   String? endingDate;
//   bool _userInitiatedPurchase = false; // Track explicit Subscribe action
//   bool _iapSetup = false; // one-time setup guard
//   bool _acceptEvents = false; // start processing only after user action
//   bool _userInitiatedRestore = false; // track explicit restore
//   // Track processed transactions to avoid duplicates
//   final Set<String> _processedTransactionIds = <String>{};
//   // Track which transactions already saved to backend
//   final Set<String> _backendSavedTransactionIds = <String>{};
//
//
//   Future<void> setupInAppPurchase(BuildContext context) async {
//     if (_iapSetup) return;
//     try {
//       await ensureSubscriptionsLoaded(context);
//       childrensListApi(context);
//
//       // Drain any pending iOS transactions before listening to avoid past events firing first.
//       if (Platform.isIOS) {
//         try {
//           final transactions = await SKPaymentQueueWrapper().transactions();
//           for (final t in transactions) {
//             await SKPaymentQueueWrapper().finishTransaction(t);
//           }
//         } catch (e) {
//           print('Drain pending iOS transactions error: $e');
//         }
//       }
//
//       _acceptEvents = false; // do not process past events by default
//       inAppPurchaseListetion();
//       await initStoreInfo();
//       _iapSetup = true;
//     } catch (e) {
//       print('setupInAppPurchase error: $e');
//     }
//   }
//
//   Future<void> clearOldTransactions() async {
//     final transactions = await SKPaymentQueueWrapper().transactions();
//     for (var t in transactions) {
//       await SKPaymentQueueWrapper().finishTransaction(t);
//     }
//     print("✅ Cleared old transactions");
//   }
//
//   // Explicit restore button flow
//   Future<void> restorePurchases() async {
//     try {
//       _userInitiatedRestore = true;
//       _acceptEvents = true; // accept restore callbacks
//       if (Platform.isIOS) {
//         // Do not finish here; let StoreKit deliver restored transactions
//         await _inAppPurchase.restorePurchases();
//       } else {
//         await _inAppPurchase.restorePurchases();
//       }
//     } catch (e) {
//       print('restorePurchases error: $e');
//       _userInitiatedRestore = false;
//       _acceptEvents = false;
//     }
//   }
//
//   // Utility requested: remove all unfinished transactions and restart listeners
//   Future<void> clearAllUnfinishedTransactionsAndRestart(BuildContext context) async {
//     try {
//       if (Platform.isIOS) {
//         final transactions = await SKPaymentQueueWrapper().transactions();
//         for (final t in transactions) {
//           await SKPaymentQueueWrapper().finishTransaction(t);
//         }
//       }
//       // Reset flags and listeners
//       _processedTransactionIds.clear();
//       _userInitiatedPurchase = false;
//       _userInitiatedRestore = false;
//       _acceptEvents = false;
//       _iapSetup = false;
//       // Re-setup
//       await setupInAppPurchase(context);
//       print('🔁 Cleared unfinished transactions and restarted IAP listeners');
//     } catch (e) {
//       print('clearAllUnfinishedTransactionsAndRestart error: $e');
//     }
//   }
//
//
//   Future<void> purchaseSubscription(ProductDetails productDetails) async {
//     _userInitiatedPurchase = true; // mark user intent
//     _acceptEvents = true; // accept callbacks for this flow
//
//     print("data--> ${productDetails.id}");
//     print("data--> ${productDetails.title}");
//
//     final PurchaseParam purchaseParam;
//     try {
//       // Initiate purchase flow for the specified subscription
//
//       if (Platform.isIOS) {
//         purchaseParam = PurchaseParam(
//           productDetails: productDetails,
//         );
//         // final transactions = await SKPaymentQueueWrapper().transactions();
//         // for (var transaction in transactions) {
//         //   await SKPaymentQueueWrapper().finishTransaction(transaction);
//         // }
//         await _iapConnection.buyNonConsumable(purchaseParam: purchaseParam);
//       } else {
//         print('product status 1');
//         purchaseParam = GooglePlayPurchaseParam(productDetails: productDetails);
//         print('product status 2');
//         try {
//           await _iapConnection.buyNonConsumable(
//             purchaseParam: purchaseParam,
//           );
//         } catch (e) {
//           print('e _iapConnection.buyNonConsumable ---> ${e}');
//         }
//       }
//     } catch (e) {
//       _userInitiatedPurchase = false;
//
//       print("Error purchaseSubscription ${e.toString()}");
//       // Handle purchase error
//     }
//   }
//
//   ///  IN App purcher start
//   final InAppPurchase _inAppPurchase = InAppPurchase.instance;
//   late StreamSubscription<List<PurchaseDetails>> _subscription;
//   List<ProductDetails> _products = <ProductDetails>[];
//   List<String> _consumables = <String>[];
//   bool _isAvailable = false;
//   bool _purchasePending = false;
//   bool _loading = true;
//   String? _queryProductError;
//   final bool _kAutoConsume = Platform.isIOS || true;
//
//   List<String> _kProductIds = [];
//
//   inAppPurchaseListetion() {
//     try {
//       final Stream<List<PurchaseDetails>> purchaseUpdated =
//           _inAppPurchase.purchaseStream;
//       _subscription =
//           purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
//         print('purchaseDetailsList---? ${purchaseDetailsList.length}');
//         _listenToPurchaseUpdated(purchaseDetailsList);
//       }, onDone: () {
//         _subscription.cancel();
//       }, onError: (Object error) {
//         print('Error inAppPurchaseListetion--> ${error.toString()}');
//       });
//     } catch (e) {
//       print('Error inAppPurchaseListetion--> ${e.toString()}');
//     }
//   }
//
//   Future<void> initStoreInfo() async {
//     final bool isAvailable = await _inAppPurchase.isAvailable();
//     if (!isAvailable) {
//       print("isAvailable 1--> ${isAvailable}");
//       _isAvailable = isAvailable;
//       _products = <ProductDetails>[];
//       notifyListeners();
//       return;
//     }
//
//     if (Platform.isIOS) {
//       print("isAvailable--> ${isAvailable}");
//       final InAppPurchaseStoreKitPlatformAddition  iosPlatformAddition = _inAppPurchase.getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
//       print("iosPlatformAddition--> ${iosPlatformAddition}");
//       await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
//     }
//
//     const Set<String> kIds = <String>{'com.bolbani.kids.monthly_plan'};
//
//     final ProductDetailsResponse productDetailResponse =
//         await _inAppPurchase.queryProductDetails(_kProductIds.toSet());
//     if (productDetailResponse.error != null) {
//       print('Error fetching products: ${productDetailResponse.error}');
//       _queryProductError = productDetailResponse.error!.message;
//       _isAvailable = isAvailable;
//       _products = productDetailResponse.productDetails;
//       // _purchases = <PurchaseDetails>[];
//       // _notFoundIds = productDetailResponse.notFoundIDs;
//       _consumables = <String>[];
//       _purchasePending = false;
//       _loading = false;
//       notifyListeners();
//       return;
//     }
//
//     if (productDetailResponse.productDetails.isEmpty) {
//       print('No products found');
//       _queryProductError = null;
//       _isAvailable = isAvailable;
//       _products = productDetailResponse.productDetails;
//       // _purchases = <PurchaseDetails>[];
//       // _notFoundIds = productDetailResponse.notFoundIDs;
//       _consumables = <String>[];
//       _purchasePending = false;
//       _loading = false;
//       notifyListeners();
//       return;
//     }
//     List<ProductDetails> products = productDetailResponse.productDetails;
//     final List<String> consumables = await ConsumableStore.load();
//     _isAvailable = isAvailable;
//     _products = productDetailResponse.productDetails;
//     // _notFoundIds = productDetailResponse.notFoundIDs;
//     _consumables = consumables;
//     _purchasePending = false;
//     _loading = false;
//     print('products---> ${products[0].id}');
//     print('products length---> ${products.length}');
//     productDetailsGloble = products;
//     notifyListeners();
//   }
//
//   Future<void> _listenToPurchaseUpdated(
//       List<PurchaseDetails> purchaseDetailsList) async {
//     print("In ap status start =>");
//     try {
//       // Ignore events until a user action (purchase/restore) occurs.
//       if (!_acceptEvents) {
//         print('⚠️ Ignoring purchase updates because acceptEvents=false');
//         return;
//       }
//
//       // var context = NavigationService.instance.navigationKey.currentContext!;
//       var context = navigatorKey.currentContext;
//       for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
//         print("In ap status 1 => ${purchaseDetails.status}");
//
//         print("==== Transaction Debug ====");
//         print("status: ${purchaseDetails.status}");
//         print("productID: ${purchaseDetails.productID}");
//         print("purchaseID: ${purchaseDetails.purchaseID}");
//         print("transactionDate: ${purchaseDetails.transactionDate}");
//         print("pendingCompletePurchase: ${purchaseDetails.pendingCompletePurchase}");
//         print("userInitiatedPurchase: $_userInitiatedPurchase");
//         print("==== END ====");
//
//         // De-dupe by transaction id (if present)
//         final String? txId = purchaseDetails.purchaseID;
//         if (txId != null && _processedTransactionIds.contains(txId)) {
//           print('🔁 Duplicate transaction ignored: $txId');
//           continue;
//         }
//
//         if (purchaseDetails.status == PurchaseStatus.canceled) {
//           print("In ap status 2 => ${purchaseDetails.status}");
//
//           context?.loaderOverlay.hide();
//           _userInitiatedPurchase = false; // reset on cancel
//           _userInitiatedRestore = false;
//           _acceptEvents = false;
//           notifyListeners();
//         }
//
//         if (purchaseDetails.status == PurchaseStatus.pending) {
//           context?.loaderOverlay.show();
//
//           print("In ap status 3 => ${purchaseDetails.status}");
//           //    showPendingUI();
//           // isButton(false);
//         } else {
//           if (purchaseDetails.status == PurchaseStatus.error) {
//             print("In ap status 4 => ${purchaseDetails.status}");
//
//             context?.loaderOverlay.hide();
//             _userInitiatedPurchase = false; // reset on error
//             _userInitiatedRestore = false;
//             _acceptEvents = false;
//             notifyListeners();
//             //handleError(purchaseDetails.error!);
//           }
//           // ✅ FIX: Handle both purchased AND restored when user initiated purchase
//           else if (purchaseDetails.status == PurchaseStatus.purchased ||
//               (purchaseDetails.status == PurchaseStatus.restored && _userInitiatedPurchase)) {
//
//             final bool restoredAsPurchase = purchaseDetails.status == PurchaseStatus.restored && _userInitiatedPurchase;
//             print("🎉 ${restoredAsPurchase ? 'RESTORED (treating as purchase)' : 'PURCHASE'} ${purchaseDetails.productID}");
//             print("Purchase ${purchaseDetails.transactionDate}");
//             print("Purchase ${purchaseDetails.purchaseID}");
//             print("Purchase ${purchaseDetails.verificationData.localVerificationData}");
//             print("Purchase ${purchaseDetails.verificationData.serverVerificationData}");
//
//             // Helper to perform backend save exactly once
//             Future<void> _saveToBackendOnce() async {
//               final String? tx = purchaseDetails.purchaseID;
//               if (tx == null) {
//                 print('⚠️ Cannot save – missing transaction id');
//                 return;
//               }
//               if (_backendSavedTransactionIds.contains(tx)) {
//                 print('🔁 Backend already saved for $tx – skipping');
//                 return;
//               }
//               // Ensure at least one child id present; fallback to dashboard selected child if user forgot to select
//               if (selectedChildIds.isEmpty) {
//                 try {
//                   final dashboardProvider = Provider.of<ParentDashboardProvider>(context!, listen: false);
//                   if (dashboardProvider.selectedChildID != null && dashboardProvider.selectedChildID!.isNotEmpty) {
//                     selectedChildIds = [dashboardProvider.selectedChildID!];
//                     print('ℹ️ Added fallback childId ${dashboardProvider.selectedChildID} for saving.');
//                   } else {
//                     print('❌ No child selected and no fallback childId available – abort save.');
//                     return;
//                   }
//                 } catch (e) {
//                   print('❌ Could not fetch fallback childId: $e');
//                   return;
//                 }
//               }
//               try {
//                 print('📡 Calling saveSubscriptionDataApi for tx=$tx product=${purchaseDetails.productID}...');
//                 saveSubscriptionDataApi(
//                   context!,
//                   purchaseDetails.transactionDate,
//                   purchaseDetails.purchaseID,
//                   purchaseDetails.productID,
//                   SharedPre.getStringValue(SharedPre.uid),
//                 );
//                 _backendSavedTransactionIds.add(tx);
//               } catch (e) {
//                 print('❌ saveSubscriptionDataApi threw: $e');
//               }
//             }
//
//             if (Platform.isIOS) {
//               // iOS: validate receipt FIRST, then complete, then save
//               inAppPurchaseApi(
//                 receiptData: purchaseDetails.verificationData.serverVerificationData,
//                 subScription: purchaseDetails.productID,
//               ).then((bool valid) async {
//                 if (valid) {
//                   print('✅ Receipt validated for ${purchaseDetails.productID} (tx ${purchaseDetails.purchaseID}).');
//                   unawaited(deliverProduct(purchaseDetails));
//                 } else {
//                   print('❌ Receipt validation failed – will not save backend.');
//                   showToast(message: 'Payment failed, try Restore purchases');
//                 }
//
//                 if (purchaseDetails.pendingCompletePurchase) {
//                   try {
//                     await _inAppPurchase.completePurchase(purchaseDetails);
//                     print('🧾 completePurchase done (iOS)');
//                   } catch (e) {
//                     print('❌ completePurchase error (iOS): $e');
//                   }
//                 }
//
//                 if (valid) {
//                   await _saveToBackendOnce();
//                   showToast(message: 'Plan Purchase Successfully.');
//                 }
//
//                 // Reset flags post handling
//                 _userInitiatedPurchase = false;
//                 if (purchaseDetails.purchaseID != null) {
//                   _processedTransactionIds.add(purchaseDetails.purchaseID!);
//                 }
//                 _acceptEvents = false;
//               });
//             } else {
//               // Android: (Optional TODO: add server validation) then save after completion
//               if (purchaseDetails.pendingCompletePurchase) {
//                 try {
//                   await _inAppPurchase.completePurchase(purchaseDetails);
//                   print('🧾 completePurchase done (Android)');
//                 } catch (e) {
//                   print('❌ completePurchase error (Android): $e');
//                 }
//               }
//               await _saveToBackendOnce();
//               showToast(message: 'Plan Purchase Successfully.');
//               _userInitiatedPurchase = false;
//               if (purchaseDetails.purchaseID != null) {
//                 _processedTransactionIds.add(purchaseDetails.purchaseID!);
//               }
//               _acceptEvents = false;
//             }
//             continue; // proceed next purchaseDetails
//           }
//           // ✅ Handle ONLY explicit restore action (not during purchase)
//           else if (purchaseDetails.status == PurchaseStatus.restored && _userInitiatedRestore) {
//             print("🌀 EXPLICIT RESTORE triggered for ${purchaseDetails.productID}");
//             context?.loaderOverlay.hide();
//
//             try {
//               bool restored = true;
//               if (Platform.isIOS) {
//                 restored = await inAppPurchaseApi(
//                   receiptData: purchaseDetails.verificationData.serverVerificationData,
//                   subScription: purchaseDetails.productID,
//                 );
//               }
//
//               if (restored) {
//                 print('✅ Restore validated for ${purchaseDetails.productID} (tx ${purchaseDetails.purchaseID}).');
//                 unawaited(deliverProduct(purchaseDetails));
//                 if (purchaseDetails.pendingCompletePurchase) {
//                   try { await _inAppPurchase.completePurchase(purchaseDetails); } catch (e) { print('❌ completePurchase restore error: $e'); }
//                 }
//                 // Save after restore validation
//                 final String? tx = purchaseDetails.purchaseID;
//                 if (tx != null && !_backendSavedTransactionIds.contains(tx)) {
//                   await Future<void>.delayed(const Duration(milliseconds: 50));
//                   try { await saveSubscriptionDataApi(
//                     context!,
//                     purchaseDetails.transactionDate,
//                     purchaseDetails.purchaseID,
//                     purchaseDetails.productID,
//                     SharedPre.getStringValue(SharedPre.uid),
//                   );
//                     _backendSavedTransactionIds.add(tx);
//                   } catch (e) { print('❌ save after restore error: $e'); }
//                 } else { print('🔁 Restore save skipped (already saved or tx null)'); }
//                 showToast(message: 'Subscription restored.');
//               } else {
//                 showToast(message: 'No active subscription found for restore.');
//               }
//             } catch (e) {
//               print('❌ Error during restore: $e');
//               showToast(message: 'Restore failed.');
//             }
//             if (purchaseDetails.purchaseID != null) _processedTransactionIds.add(purchaseDetails.purchaseID!);
//             _userInitiatedRestore = false;
//             _acceptEvents = false;
//             continue;
//           }
//
//
//
//           if (Platform.isAndroid) {
//             print("Purchase Complete 1");
//             final InAppPurchaseAndroidPlatformAddition androidAddition =
//                 _inAppPurchase.getPlatformAddition<InAppPurchaseAndroidPlatformAddition>();
//             await androidAddition.consumePurchase(purchaseDetails);
//           }
//           if (purchaseDetails.pendingCompletePurchase) {
//             print("Purchase Complete");
//
//             await _inAppPurchase.completePurchase(purchaseDetails);
//           }
//         }
//       }
//     } catch (e) {
//       print("Error ${e}");
//     }
//   }
//
//   Future<void> deliverProduct(PurchaseDetails purchaseDetails) async {
//     // IMPORTANT!! Always verify purchase details before delivering the product.
//     await ConsumableStore.save(purchaseDetails.purchaseID!);
//     final List<String> consumables = await ConsumableStore.load();
//     _purchasePending = false;
//     _consumables = consumables;
//   }
//
//   Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
//     print(purchaseDetails.verificationData.serverVerificationData);
//
//     // inAppPurchaseApi(
//     //     receiptData: purchaseDetails.verificationData.serverVerificationData
//     //         .toString())
//     //     .then((value) {
//     //   isButtonLoading.value[indexButtonClick] = false;
//     //   update();
//     //   //   isButton(false);
//     // });
//     return Future<bool>.value(true);
//   }
//
//   onIosPay(String id) async {
//     _userInitiatedPurchase = true; // mark user intent for iOS flow
//
//     // isButton(true);
//
//     // isButtonLoading.value[indexButtonClick] = true;
//
//     print("pordcut =>${id}");
//     print("pordcut length =>${_products.length}");
//     ProductDetails productDetailst =
//         _products.firstWhere((element) => element.id == id);
//
//     print("producyt =>${productDetailst.id}");
//     print("producyt =>${productDetailst.rawPrice}");
//
//     // ProductDetails productDetailst = ProductDetails(
//     //     id: 'premium_plan399',
//     //     title: '',
//     //     description: '',
//     //     price: '\$399',
//     //     rawPrice: 399.0,
//     //     currencyCode: '\$');
//     try {
//       PurchaseParam purchaseParam;
//       purchaseParam = PurchaseParam(
//         productDetails: productDetailst,
//       );
//
//       // Finish any pending transactions before starting a new purchase
//       // final transactions = await SKPaymentQueueWrapper().transactions();
//       // for (var transaction in transactions) {
//       //   await SKPaymentQueueWrapper().finishTransaction(transaction);
//       // }
//
//       _inAppPurchase.buyNonConsumable(
//           purchaseParam: purchaseParam);
//     } catch (e) {
//
//       _userInitiatedPurchase = false;
//       _acceptEvents = false;
//       print("Error: $e");
//
//       // isButton(false);
//       //  isButtonLoading.value[indexButtonClick] = false;
//       //  update();
//     }
//   }
//
//   /// Validates an iOS in-app purchase receipt with Apple's servers.
//   /// Returns `true` if the user currently has any active subscription (monthly or yearly).
//   Future<bool> inAppPurchaseApi({
//     required String receiptData,
//     required String subScription,
//   }) async {
//     const String liveUrl = 'https://buy.itunes.apple.com/verifyReceipt';
//     const String sandboxUrl = 'https://sandbox.itunes.apple.com/verifyReceipt';
//     const String sharedSecret = '';
//
//     print('📡 Calling Apple receipt verification API...');
//
//     Map<String, dynamic> buildBody(String data) => {
//       'receipt-data': data,
//       'password': sharedSecret,
//       'exclude-old-transactions': false,
//     };
//
//     Future<Map<String, dynamic>> postTo(String url, Map<String, dynamic> body) async {
//       final response = await http.post(
//         Uri.parse(url),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(body),
//       );
//       return jsonDecode(response.body) as Map<String, dynamic>;
//     }
//
//     Map<String, dynamic> result;
//     Map<String, dynamic> body = buildBody(receiptData);
//
//     try {
//       // 1️⃣ LIVE first
//       result = await postTo(liveUrl, body);
//       print('🍏 Apple LIVE response: $result');
//
//       // 2️⃣ Sandbox if needed
//       if (result['status'] == 21007) {
//         print('🔄 Sandbox receipt detected. Retrying on sandbox...');
//         result = await postTo(sandboxUrl, body);
//         print('🍏 Apple SANDBOX response: $result');
//       }
//
//       // 3️⃣ Refresh if malformed
//       if (result['status'] == 21002 && Platform.isIOS) {
//         print('🧾 21002 malformed receipt. Refreshing...');
//         try {
//           final InAppPurchaseStoreKitPlatformAddition iosAddition =
//           _inAppPurchase.getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
//           final PurchaseVerificationData? refreshed =
//           await iosAddition.refreshPurchaseVerificationData();
//           final String? refreshedData = refreshed?.serverVerificationData;
//
//           if (refreshedData != null && refreshedData.isNotEmpty) {
//             body = buildBody(refreshedData);
//             result = await postTo(liveUrl, body);
//             if (result['status'] == 21007) {
//               result = await postTo(sandboxUrl, body);
//             }
//             print('🍏 Apple response after refresh: $result');
//           } else {
//             print('⚠️ Failed to refresh iOS receipt — no data returned');
//           }
//         } catch (e) {
//           print('❌ Refresh receipt error: $e');
//         }
//       }
//
//       if (result['status'] != 0) {
//         print('❌ Receipt validation failed with status: ${result['status']}');
//         return false;
//       }
//
//       // ✅ Check if any subscription is still active
//       if (_hasActiveSubscription(result)) {
//         print('✅ Active subscription found.');
//         return true;
//       } else {
//         print('❌ No active subscriptions in receipt.');
//         return false;
//       }
//     } catch (e, s) {
//       print('❌ Exception during in-app purchase validation: $e');
//       print(s);
//       return false;
//     }
//   }
//
//   /// Returns true if any item in latest_receipt_info has expires_date_ms in the future.
//   bool _hasActiveSubscription(Map<String, dynamic> receipt) {
//     final List<dynamic>? latestInfo = receipt['latest_receipt_info'];
//     if (latestInfo == null || latestInfo.isEmpty) return false;
//
//     final now = DateTime.now().toUtc();
//     DateTime? latestExpiry;
//     Map<String, dynamic>? latestItem;
//
//     for (final item in latestInfo) {
//       final expiresMs = item['expires_date_ms'];
//       if (expiresMs != null) {
//         final expiry = DateTime.fromMillisecondsSinceEpoch(int.parse(expiresMs), isUtc: true);
//         if (latestExpiry == null || expiry.isAfter(latestExpiry)) {
//           latestExpiry = expiry;
//           latestItem = item;
//         }
//       }
//     }
//
//     if (latestExpiry != null && latestExpiry.isAfter(now)) {
//       print('⏰ Latest subscription: ${latestItem?['product_id']} '
//           'expires at $latestExpiry (now: $now)');
//       return true;
//     }
//     return false;
//   }
//
//
//   bool isLoading = false;
//
//   void setLoading(bool loading) {
//     isLoading = loading;
//     notifyListeners();
//   }
//
//   getSubscriptionListApi(BuildContext context,String childId) async {
//     _kProductIds.clear();
//     try {
//       context.loaderOverlay.show();
//       final GetSubscriptionModel response = await AppApi.getSubscriptionListApi();
//       if (response.apiStatus == Status.success) {
//         getSubscriptionDataList = response.getSubscriptionData ?? [];
//         subscriptionsLoaded = true;
//       }
//       for (int i = 0; i < getSubscriptionDataList.length; i++) {
//         print("id ---> ${getSubscriptionDataList[i].subscriptionAppleId}");
//         _kProductIds.add(getSubscriptionDataList[i].subscriptionAppleId ?? '');
//       }
//       notifyListeners();
//     } catch (e) {
//       print('getSubscriptionList Api api error---> ${e}');
//       throw e;
//     } finally {
//       context.loaderOverlay.hide();
//     }
//   }
//
//   childrensListApi(BuildContext context,) async {
//     childrenAllListData.clear();
//     try {
//       context.loaderOverlay.show();
//       final ChildrenListModel response = await AppApi.childrensListApi();
//       if (response.apiStatus == Status.success) {
//         childrenAllListData = response.childrenListData?.children ?? [];
//         subscriptionsLoaded = true;
//       }
//       notifyListeners();
//     } catch (e) {
//       print('getSubscriptionList Api api error---> ${e}');
//       throw e;
//     } finally {
//       context.loaderOverlay.hide();
//     }
//   }
//
//
//
//   saveSubscriptionDataApi(BuildContext context,String? purchaseTime,String? orderId,String productId,String parentId) async {
//
//       // Unified robust parsing of purchaseTime (milliseconds, seconds, or ISO / formatted string)
//       DateTime? parsedDate;
//       if (purchaseTime != null && purchaseTime.trim().isNotEmpty) {
//         final raw = purchaseTime.trim();
//         print('🕒 Raw purchaseTime received: "$raw"');
//         final numeric = RegExp(r'^\d+$').hasMatch(raw);
//         try {
//           if (numeric) {
//             // Detect ms vs s
//             if (raw.length >= 13) {
//               parsedDate = DateTime.fromMillisecondsSinceEpoch(int.parse(raw), isUtc: true);
//             } else if (raw.length == 10) {
//               parsedDate = DateTime.fromMillisecondsSinceEpoch(int.parse(raw) * 1000, isUtc: true);
//             } else {
//               // Fallback assume ms
//               parsedDate = DateTime.fromMillisecondsSinceEpoch(int.parse(raw), isUtc: true);
//             }
//           } else {
//             // Normalize space separated date to ISO by inserting 'T'
//             final isoCandidate = raw.contains('T') ? raw : raw.replaceFirst(' ', 'T');
//             parsedDate = DateTime.tryParse(isoCandidate)?.toUtc();
//             if (parsedDate == null) {
//               print('⚠️ Could not parse non-numeric purchaseTime, using now() as fallback');
//             }
//           }
//         } catch (e) {
//           print('⚠️ purchaseTime parse error: $e');
//         }
//       }
//       parsedDate ??= DateTime.now().toUtc();
//       final normalizedPurchaseIso = parsedDate.toIso8601String();
//       print('🕒 Normalized purchaseTime ISO: $normalizedPurchaseIso');
//
//     try {
//       final Map<String, dynamic> body = <String, dynamic>{
//         "purchaseTime": normalizedPurchaseIso,
//         "orderId":orderId,
//         "productId": productId,
//         "userId": parentId,
//       };
//
//       // Handle single child vs multiple children
//       if (selectedChildIds.length == 1) {
//         body["childId"] = selectedChildIds.first;
//       } else if (selectedChildIds.length > 1) {
//         body["childIds"] = selectedChildIds;
//       } else {
//         print("Warning: No children selected for subscription");
//         return;
//       }
//
//       final response = await AppApi.subscriptionPurchaseApi(body);
//       if (response.status == Status.success) {
//
//         print("Data saved -- ${orderId}");
//         print("Data saved -- ${productId}");
//
//         Navigator.pop(context);
//       } else {
//         print("Data not saved");
//       }
//     } catch (e) {
//       print('signupAPI api error ${e}');
//       throw e;
//     } finally {
//     }
//   }
//
//   /// Selection state
//   String? selectedSubscriptionId;
//   void selectSubscription(String? id) {
//     if (selectedSubscriptionId == id) {
//       // toggle off if same selected again (optional). Remove this line if persistent selection desired
//       selectedSubscriptionId = id; // keep selection (no toggle off)
//     } else {
//       selectedSubscriptionId = id;
//     }
//     notifyListeners();
//   }
//   ProductDetails? get selectedProductDetails => selectedSubscriptionId == null ? null : getApiSubscription(selectedSubscriptionId!);
//
//   ProductDetails? getApiSubscription(String id) {
//     return productDetailsGloble?.firstWhereOrNull((element) => element.id .contains(id));
//   }
// }
//
// class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
//   @override
//   bool shouldContinueTransaction(
//       SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
//     return true;
//   }
//
//   @override
//   bool shouldShowPriceConsent() {
//     return false;
//   }
// }
