library;

import 'package:webview_flutter/webview_flutter.dart';

import '../../custom_code/widgets/cube_grid_loader.dart' as custom_widgets;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'subscription_page_model.dart';

export 'subscription_page_model.dart';

class SubscriptionPageWidget extends StatefulWidget {
  const SubscriptionPageWidget({super.key});

  static String routeName = 'SubscriptionPage';
  static String routePath = '/subscriptionPage';

  @override
  State<SubscriptionPageWidget> createState() => _SubscriptionPageWidgetState();
}

class _SubscriptionPageWidgetState extends State<SubscriptionPageWidget>
    with RouteAware {
  late SubscriptionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionPageModel());

    // Set up state change callback
    _model.onStateChanged = () {
      if (mounted) {
        setState(() {});
      }
    };
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _model.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SubscriptionPageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _model.widget = widget;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = DebugModalRoute.of(context);
    if (route != null) {
      routeObserver.subscribe(this, route);
    }
    debugLogGlobalProperty(context);
  }

  // @override
  // void didPopNext() {
  //   if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
  //     setState(() => _model.isVisible = true);
  //     debugLogWidgetClass(_model);
  //   }
  // }
  //
  // @override
  // void didPush() {
  //   if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
  //     setState(() => _model.isVisible = true);
  //     debugLogWidgetClass(_model);
  //   }
  // }

  @override
  void didPop() {
    _model.isVisible = false;
  }

  @override
  void didPushNext() {
    _model.isVisible = false;
  }

  Widget _buildSubscriptionDisclosure() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryText.withOpacity(0.3),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Subscription Information',
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  font: GoogleFonts.poppins(),
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 8.0),
          Text(
            '• Payment will be charged to your Apple ID account at confirmation of purchase\n'
            '• Subscription automatically renews unless canceled at least 24 hours before the end of the current period\n'
            '• Your account will be charged for renewal within 24 hours prior to the end of the current period\n'
            '• You can manage or cancel your subscription in your App Store account settings after purchase\n'
            '• Any unused portion of a free trial period will be forfeited when you purchase a subscription',
            style: FlutterFlowTheme.of(context).bodySmall.override(
                  font: GoogleFonts.poppins(),
                  fontSize: 11.0,
                  letterSpacing: 0.0,
                  // height: 1.5,
                ),
          ),
        ],
      ),
    );
  }

  ///
  Widget _buildPlanCard({
    required String title,
    required String subtitle,
    required String price,
    required String duration,
    required bool isRecommended,
    required bool isCurrentPlan,
    String? productId,
  }) {
    bool canPurchase =
        productId != null ? _model.canPurchasePlan(productId) : false;
    bool isPurchasing =
        productId != null ? _model.isPurchasing(productId) : false;
    String buttonText = productId != null
        ? _model.getPlanButtonText(productId)
        : 'Current Plan';

    // Get disclaimer text based on plan type
    String getDisclaimerText() {
      if (title == 'Basic') {
        return 'Free plan includes advertisements. Extra votes available for purchase.';
      } else {
        return 'Auto-renewable subscription. Payment charged to Apple ID at confirmation. '
            'Renews automatically unless cancelled 24 hours before period ends. '
            'Manage subscriptions in App Store settings.';
      }
    }

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10.0,
                  color: Color(0x1A000000),
                  offset: Offset(0.0, 4.0),
                ),
              ],
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: isCurrentPlan
                    ? const Color(0xFF4CAF50)
                    : (isRecommended
                        ? const Color(0xFFE0E0E0)
                        : const Color(0xFFE0E0E0)),
                width: isCurrentPlan ? 3.0 : (isRecommended ? 2.0 : 1.0),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Plan Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                title,
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.poppins(),
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              if (isCurrentPlan) ...[
                                const SizedBox(width: 8.0),
                                Container(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 4.0, 8.0, 4.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF4CAF50),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Text(
                                    'ACTIVE',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: GoogleFonts.poppins(),
                                          color: Colors.white,
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            price,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.poppins(),
                                  color: const Color(0xFFEB6027),
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 12.0),

                  // Plan Description
                  Text(
                    subtitle,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.poppins(),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),

                  // Duration/Renewal Info (for paid plans only)
                  if (duration.isNotEmpty) ...[
                    const SizedBox(height: 8.0),
                    Container(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          8.0, 6.0, 8.0, 6.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEB6027).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(
                          color: const Color(0xFFEB6027).withOpacity(0.3),
                          width: 1.0,
                        ),
                      ),
                      child: Text(
                        duration,
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              font: GoogleFonts.poppins(),
                              fontSize: 10.0,
                              letterSpacing: 0.0,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                  ],

                  // Apple Disclaimer Box
                  const SizedBox(height: 12.0),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        12.0, 10.0, 12.0, 10.0),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context)
                          .secondaryText
                          .withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context)
                            .secondaryText
                            .withOpacity(0.2),
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: 16.0,
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            getDisclaimerText(),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      font: GoogleFonts.poppins(),
                                      fontSize: 9.0,
                                      letterSpacing: 0.0,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16.0),

                  // Action Button
                  if (title != 'Basic')
                    SizedBox(
                      width: double.infinity,
                      child: FFButtonWidget(
                        onPressed: (canPurchase &&
                                !isPurchasing &&
                                !isCurrentPlan)
                            ? () async {
                                await _model.purchaseSubscription(productId);
                              }
                            : null,
                        text: buttonText,
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: isCurrentPlan
                              ? const Color(0xFF4CAF50)
                              : (canPurchase && !isCurrentPlan
                                  ? const Color(0xFFEB6027)
                                  : Colors.grey[400]),
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.poppins(),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                          elevation: isCurrentPlan ? 0.0 : 2.0,
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        showLoadingIndicator: isPurchasing,
                      ),
                    )
                  else
                    SizedBox(
                      width: double.infinity,
                      child: FFButtonWidget(
                        onPressed: null,
                        text: isCurrentPlan ? 'Current Plan' : 'Basic Plan',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: isCurrentPlan
                              ? const Color(0xFF4CAF50)
                              : Colors.grey[300],
                          textStyle:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    font: GoogleFonts.poppins(),
                                    color: isCurrentPlan
                                        ? Colors.white
                                        : Colors.grey[600],
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                          elevation: 0.0,
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///

  ///

  @override
  Widget build(BuildContext context) {
    DebugFlutterFlowModelContext.maybeOf(context)
        ?.parentModelCallback
        ?.call(_model);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).oposite,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                Theme.of(context).brightness == Brightness.dark
                    ? 'assets/images/commonBg.png'
                    : 'assets/images/plain_whiteBg.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  child: _model.isSubscriptionLoading
                      ? const Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: SizedBox(
                            width: 40.0,
                            height: 40.0,
                            child: custom_widgets.CubeGridLoader(
                              width: 40.0,
                              height: 40.0,
                              size: 40.0,
                            ),
                          ),
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // Header Row
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).backBtnClr,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 2.0),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: (Theme.of(context).brightness ==
                                              Brightness.dark)
                                          ? const Color(0x4DFFFFFF)
                                          : const Color(0x33000000),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.safePop();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Choose your Plan.',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.poppins(),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Text(
                                      'Play your way.',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.poppins(),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await _model.restorePurchases();
                                    },
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .backBtnClr,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color:
                                              (Theme.of(context).brightness ==
                                                      Brightness.dark)
                                                  ? const Color(0x4DFFFFFF)
                                                  : const Color(0x33000000),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.restore,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 20.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            // Subtitle
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Text(
                                'Three plans. Three ways to live the challenge.\nWhether you\'re exploring the game, mastering every move, or just playing for the thrill, there\'s a plan designed for you.',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),

                            // Current Plan Status
                            if (_model.currentPlan != 'free')
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 12.0, 16.0, 12.0),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF4CAF50)
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(
                                        color: const Color(0xFF4CAF50)),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.check_circle,
                                        color: Color(0xFF4CAF50),
                                        size: 20.0,
                                      ),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        'Active: ${_model.getPlanDisplayName(_model.currentPlan)} Plan',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.poppins(),
                                              color: const Color(0xFF4CAF50),
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      const Spacer(),
                                      if (_model.currentPlan != 'master')
                                        Text(
                                          'Extra Votes: ${_model.extraVotes}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(),
                                                color: const Color(0xFF4CAF50),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),

                            ///1
                            // Basic Plan (renamed from Free)
                            // _buildPlanCard(
                            //   title: 'Basic',
                            //   subtitle: 'Includes ads • Extra-Vote available as in-app purchase',
                            //   price: 'Free',
                            //   duration: '',
                            //   isRecommended: false,
                            //   isCurrentPlan: _model.currentPlan == 'free',
                            // ),
                            //
                            // // Explorer Plan
                            // _buildPlanCard(
                            //   title: 'Explorer',
                            //   subtitle: 'No Ads • Extra-Vote at discounted price (save \$2 vs Basic)',
                            //   price: '${_model.getFormattedPrice(SubscriptionPageModel.explorerPlanId)}/month',
                            //   duration: 'Renews monthly. Cancel anytime in App Store settings.',
                            //   isRecommended: true,
                            //   isCurrentPlan: _model.currentPlan == 'explorer',
                            //   productId: SubscriptionPageModel.explorerPlanId,
                            // ),
                            //
                            // // Master Plan
                            // _buildPlanCard(
                            //   title: 'Master',
                            //   subtitle: 'No Ads • Unlimited Extra-Votes',
                            //   price: '${_model.getFormattedPrice(SubscriptionPageModel.masterPlanId)}/month',
                            //   duration: 'Renews monthly. Cancel anytime in App Store settings.',
                            //   isRecommended: false,
                            //   isCurrentPlan: _model.currentPlan == 'master',
                            //   productId: SubscriptionPageModel.masterPlanId,
                            // ),

                            // Subscription Disclosure

                            ///2
                            ///
// Basic Plan
                            _buildPlanCard(
                              title: 'Basic',
                              subtitle:
                                  'Includes ads • Extra-Vote available for in-app purchase',
                              price: 'Free',
                              duration: '',
                              // No duration for free plan
                              isRecommended: false,
                              isCurrentPlan: _model.currentPlan == 'free',
                            ),

// Explorer Plan
                            _buildPlanCard(
                              title: 'Explorer',
                              subtitle:
                                  'No Ads • Extra-Vote at discounted price (save \$2 vs Basic)',
                              price:
                                  '${_model.getFormattedPrice(SubscriptionPageModel.explorerPlanId)}/month',
                              duration:
                                  'Renews monthly. Cancel anytime in App Store settings.',
                              isRecommended: true,
                              isCurrentPlan: _model.currentPlan == 'explorer',
                              productId: SubscriptionPageModel.explorerPlanId,
                            ),

// Master Plan
                            _buildPlanCard(
                              title: 'Master',
                              subtitle: 'No Ads • Unlimited Extra-Votes',
                              price:
                                  '${_model.getFormattedPrice(SubscriptionPageModel.masterPlanId)}/month',
                              duration:
                                  'Renews monthly. Cancel anytime in App Store settings.',
                              isRecommended: false,
                              isCurrentPlan: _model.currentPlan == 'master',
                              productId: SubscriptionPageModel.masterPlanId,
                            ),

                            _buildSubscriptionDisclosure(),

                            // Extra Vote Purchase Button
                            if (_model.currentPlan != 'master')
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: FFButtonWidget(
                                    onPressed: (_model.isLoading ||
                                            _model.isPurchasing('extra_vote'))
                                        ? null
                                        : () async {
                                            await _model.purchaseExtraVote();
                                          },
                                    text: (_model.isLoading ||
                                            _model.isPurchasing('extra_vote'))
                                        ? 'Processing...'
                                        : 'Buy Extra Vote (${_model.getExtraVotePrice()})',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50.0,
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Colors.transparent,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.poppins(),
                                            color: const Color(0xFFEB6027),
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: const BorderSide(
                                        color: Color(0xFFEB6027),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    showLoadingIndicator:
                                        _model.isPurchasing('extra_vote'),
                                  ),
                                ),
                              ),

                            // Terms and Privacy
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 30.0),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText
                                        .withOpacity(0.3),
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground
                                      .withOpacity(0.5),
                                ),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            'By making a purchase, you agree to our ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.poppins(),
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      TextSpan(
                                        text: 'Terms of Service',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.poppins(),
                                              color: const Color(0xFFEB6027),
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const WebViewScreen(
                                                  url:
                                                      'https://votethegoat.ezxdemo.com/page/terms-conditions',
                                                  title: 'Terms of Service',
                                                ),
                                              ),
                                            );
                                          },
                                      ),
                                      TextSpan(
                                        text: ' and ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.poppins(),
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      TextSpan(
                                        text: 'Privacy Policy',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.poppins(),
                                              color: const Color(0xFFEB6027),
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const WebViewScreen(
                                                  url:
                                                      'https://votethegoat.ezxdemo.com/page/privacy-policy',
                                                  title: 'Privacy Policy',
                                                ),
                                              ),
                                            );
                                          },
                                      ),
                                      TextSpan(
                                        text: '.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .override(
                                              font: GoogleFonts.poppins(),
                                              fontSize: 10.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebViewScreen({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;
  bool isLoading = true;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            if (mounted) {
              setState(() {
                isLoading = true;
              });
            }
          },
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          },
          onWebResourceError: (WebResourceError error) {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      controller
        ..setBackgroundColor(FlutterFlowTheme.of(context).primaryBackground)
        ..loadRequest(Uri.parse(widget.url));
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                font: GoogleFonts.poppins(),
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
        ),
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: FlutterFlowTheme.of(context).tertiary,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading)
            const Center(
              child: SpinKitCubeGrid(
                color: Color(0xFFEB6027),
                size: 50.0,
              ),
            ),
        ],
      ),
    );
  }
}
