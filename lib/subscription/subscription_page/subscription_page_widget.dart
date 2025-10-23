import '/components/gradient_button_custom/gradient_button_custom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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

  @override
  void didPopNext() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isVisible = true);
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPush() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isVisible = true);
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPop() {
    _model.isVisible = false;
  }

  @override
  void didPushNext() {
    _model.isVisible = false;
  }

  Widget _buildPlanCard({
    required String title,
    required String subtitle,
    required String price,
    required bool isRecommended,
    required bool isCurrentPlan,
    String? productId,
  }) {
    bool canPurchase = productId != null ? _model.canPurchasePlan(productId) : false;
    bool isPurchasing = productId != null ? _model.isPurchasing(productId) : false;
    String buttonText = productId != null ? _model.getPlanButtonText(productId) : 'Current Plan';

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10.0,
                  color: Color(0x1A000000),
                  offset: Offset(0.0, 4.0),
                ),
              ],
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: isCurrentPlan
                    ? Color(0xFF4CAF50)
                    : (isRecommended ? Color(0xFFEB6027) : Color(0xFFE0E0E0)),
                width: isCurrentPlan ? 3.0 : (isRecommended ? 2.0 : 1.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
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
                                SizedBox(width: 8.0),
                                Container(
                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4CAF50),
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
                          SizedBox(height: 4.0),
                          Text(
                            price,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                              font: GoogleFonts.poppins(),
                              color: Color(0xFFEB6027),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 12.0),

                  // Plan Description
                  Text(
                    subtitle,
                    style: FlutterFlowTheme.of(context)
                        .bodyMedium
                        .override(
                      font: GoogleFonts.poppins(),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      letterSpacing: 0.0,
                    ),
                  ),

                  SizedBox(height: 16.0),

                  // Action Button
                  if (title != 'Free')
                    Container(
                      width: double.infinity,
                      child: FFButtonWidget(
                        onPressed: (canPurchase && !isPurchasing && !isCurrentPlan) ? () async {
                          if (productId != null) {
                            await _model.purchaseSubscription(productId);
                          }
                        } : null,
                        text: buttonText,
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          color: isCurrentPlan
                              ? Color(0xFF4CAF50)
                              : (canPurchase && !isCurrentPlan ? Color(0xFFEB6027) : Colors.grey[400]),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
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
                    Container(
                      width: double.infinity,
                      child: FFButtonWidget(
                        onPressed: null,
                        text: isCurrentPlan ? 'Current Plan' : 'Free Plan',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 48.0,
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                          color: isCurrentPlan ? Color(0xFF4CAF50) : Colors.grey[300],
                          textStyle: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                            font: GoogleFonts.poppins(),
                            color: isCurrentPlan ? Colors.white : Colors.grey[600],
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
          if (isRecommended && !isCurrentPlan)
            Positioned(
              top: -2,
              right: 20,
              child: Container(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 6.0, 12.0, 6.0),
                decoration: BoxDecoration(
                  color: Color(0xFFEB6027),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                  ),
                ),
                child: Text(
                  'RECOMMENDED',
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
            ),
        ],
      ),
    );
  }

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
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
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
                              color: FlutterFlowTheme.of(context).backBtnClr,
                              boxShadow: [
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
                                    ? Color(0x4DFFFFFF)
                                    : Color(0x33000000),
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
                                color: FlutterFlowTheme.of(context).tertiary,
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
                            padding: EdgeInsetsDirectional.fromSTEB(
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
                                  color: FlutterFlowTheme.of(context).backBtnClr,
                                  boxShadow: [
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
                                        ? Color(0x4DFFFFFF)
                                        : Color(0x33000000),
                                    width: 1.0,
                                  ),
                                ),
                                child: Icon(
                                  Icons.restore,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Subtitle
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'Three plans. Three ways to live the challenge.\nWhether you\'re exploring the game, mastering every move, or just playing for the thrill, there\'s a plan designed for you.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                            font: GoogleFonts.poppins(),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),

                      // Current Plan Status
                      if (_model.currentPlan != 'free')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                            decoration: BoxDecoration(
                              color: Color(0xFF4CAF50).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Color(0xFF4CAF50)),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF4CAF50),
                                  size: 20.0,
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  'Active: ${_model.getPlanDisplayName(_model.currentPlan)} Plan',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                    font: GoogleFonts.poppins(),
                                    color: Color(0xFF4CAF50),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                                if (_model.currentPlan != 'master')
                                  Text(
                                    'Extra Votes: ${_model.extraVotes}',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      font: GoogleFonts.poppins(),
                                      color: Color(0xFF4CAF50),
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),

                      // Free Plan
                      _buildPlanCard(
                        title: 'Free',
                        subtitle: 'Ads included • Extra-Vote at ${_model.getFormattedPrice(SubscriptionPageModel.extraVoteFreeId)}',
                        price: '\$0/month',
                        isRecommended: false,
                        isCurrentPlan: _model.currentPlan == 'free',
                      ),

                      // Explorer Plan
                      _buildPlanCard(
                        title: 'Explorer',
                        subtitle: 'No Ads • Extra-Vote at ${_model.getFormattedPrice(SubscriptionPageModel.extraVoteExplorerId)} (save \$2 vs Free users)',
                        price: '${_model.getFormattedPrice(SubscriptionPageModel.explorerPlanId)}/month',
                        isRecommended: true,
                        isCurrentPlan: _model.currentPlan == 'explorer',
                        productId: SubscriptionPageModel.explorerPlanId,
                      ),

                      // Master Plan
                      _buildPlanCard(
                        title: 'Master',
                        subtitle: 'No Ads • Unlimited Extra-Votes',
                        price: '${_model.getFormattedPrice(SubscriptionPageModel.masterPlanId)}/month',
                        isRecommended: false,
                        isCurrentPlan: _model.currentPlan == 'master',
                        productId: SubscriptionPageModel.masterPlanId,
                      ),

                      // Extra Vote Purchase Button
                      if (_model.currentPlan != 'master')
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            child: FFButtonWidget(
                              onPressed: (_model.isLoading || _model.isPurchasing('extra_vote')) ? null : () async {
                                await _model.purchaseExtraVote();
                              },
                              text: (_model.isLoading || _model.isPurchasing('extra_vote'))
                                  ? 'Processing...'
                                  : 'Buy Extra Vote (${_model.getExtraVotePrice()})',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                color: Colors.transparent,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                  font: GoogleFonts.poppins(),
                                  color: Color(0xFFEB6027),
                                  letterSpacing: 0.0,
                                ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Color(0xFFEB6027),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              showLoadingIndicator: _model.isPurchasing('extra_vote'),
                            ),
                          ),
                        ),

                      // Terms and Privacy
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 30.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'By making a purchase, you agree to the ',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                  font: GoogleFonts.poppins(),
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms of Service ',
                                style: FlutterFlowTheme.of(context)
                                    .bodySmall
                                    .override(
                                  font: GoogleFonts.poppins(),
                                  color: Color(0xFFEB6027),
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                ),
                              ),
                              TextSpan(
                                text: 'and ',
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
                                  color: Color(0xFFEB6027),
                                  fontSize: 10.0,
                                  letterSpacing: 0.0,
                                ),
                              ),
                              TextSpan(
                                text: '. Subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period.',
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
