import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/subscription/ad_service.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class SmartAdBannerWidget extends StatefulWidget {
  final double? height;
  final bool showLoadingPlaceholder;

  const SmartAdBannerWidget({
    super.key,
    this.height = 60.0,
    this.showLoadingPlaceholder = true,
  });

  @override
  State<SmartAdBannerWidget> createState() => _SmartAdBannerWidgetState();
}

class _SmartAdBannerWidgetState extends State<SmartAdBannerWidget> {
  bool _shouldShowAds = true;
  bool _isLoading = true;
  bool _isAdLoaded = false;
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _initializeAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  Future<void> _initializeAd() async {
    try {
      _shouldShowAds = await AdService().shouldShowAds();
      debugPrint('[SmartAdBanner] Should show ads: $_shouldShowAds');

      if (_shouldShowAds && mounted) {
        await _loadBannerAd();
      }

      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('[SmartAdBanner] Error initializing ad: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
          _isAdLoaded = false;
        });
      }
    }
  }

  Future<void> _loadBannerAd() async {
    try {
      debugPrint('[SmartAdBanner] Loading banner ad...');

      _bannerAd = BannerAd(
        adUnitId: AdService().getBannerAdUnitId(),
        size: AdSize.banner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            debugPrint('[SmartAdBanner] Banner ad loaded successfully');
            if (mounted) {
              setState(() {
                _isAdLoaded = true;
              });
            }
          },
          onAdFailedToLoad: (ad, error) {
            debugPrint('[SmartAdBanner] Banner ad failed to load: $error');
            ad.dispose();
            if (mounted) {
              setState(() {
                _isAdLoaded = false;
              });
            }
          },
        ),
      );

      await _bannerAd!.load();
    } catch (e) {
      debugPrint('[SmartAdBanner] Error loading banner ad: $e');
      if (mounted) {
        setState(() {
          _isAdLoaded = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FFAppState>(
      builder: (context, appState, child) {
        // Don't show anything for premium users
        if (!appState.showAds) {
          return const SizedBox.shrink();
        }

        // Show loading placeholder while loading
        if (_isLoading && widget.showLoadingPlaceholder) {
          return Container(
            height: widget.height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 1.0,
              ),
            ),
            child: Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        // Show ad container if loaded
        if (_isAdLoaded && _bannerAd != null) {
          return Container(
            height: widget.height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: FlutterFlowTheme.of(context).alternate,
                width: 1.0,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: AdWidget(ad: _bannerAd!),
            ),
          );
        }

        // Don't show anything if ad failed to load
        return const SizedBox.shrink();
      },
    );
  }
}
