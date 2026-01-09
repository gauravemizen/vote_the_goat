library;






///1
// ---------persisted ios issue---------//


// 4 done by umar
import '../../backend/api_requests/api_calls.dart';
import '../../nav/nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/components/conectivilty/conectivilty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '/custom_code/actions/index.dart' as actions;

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  static String routeName = 'splash';
  static String routePath = '/splash';

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  bool _navigationCompleted = false;

  @override
  void initState() {
    print('token is >> ${FFAppState().authToken}');
    super.initState();
    _initializeVideo();
    _handleNavigation();
  }

  void _initializeVideo() async {
    print('token is >> ${FFAppState().authToken}');

    try {
      _videoController = VideoPlayerController.asset(
        // 'assets/videos/Splash_Video.mp4',
        'assets/videos/s1.mp4',
      );

      await _videoController!.initialize();

      if (mounted) {
        setState(() {
          _isVideoInitialized = true;
        });


        // Remove native splash now that video is ready
        FlutterNativeSplash.remove();

        // Add listener for video completion
        _videoController!.addListener(_videoListener);

        // Set video to not loop and play once
        _videoController!.setLooping(false);
        _videoController!.play();
      }
    } catch (e) {
      print('❌ [Splash] Error initializing video: $e');
      if (mounted) {
        setState(() {
          _isVideoInitialized = true; // Show fallback
        });

        // Remove native splash even on error
        FlutterNativeSplash.remove();

        // If video fails, proceed with navigation after a short delay
        _handleVideoCompletion();
      }
    }
  }

  void _videoListener() {
    if (_videoController != null && _videoController!.value.isInitialized) {
      // Check if video has finished playing
      if (_videoController!.value.position >= _videoController!.value.duration) {
        _handleVideoCompletion();
      }
    }
  }

  void _handleVideoCompletion() {
    if (_navigationCompleted) return;

    print('🎬 [Splash] Video completed or failed - proceeding with navigation');
    // Small delay to ensure smooth transition
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted && !_navigationCompleted) {
        _proceedToNextScreen();
      }
    });
  }

  void _handleNavigation() {
    // Set up a maximum timeout to prevent getting stuck
    Future.delayed(const Duration(seconds: 8), () {
      if (!_navigationCompleted && mounted) {
        print('⏰ [Splash] Timeout reached - forcing navigation');
        _proceedToNextScreen();
      }
    });
  }

  void _proceedToNextScreen() async {
    if (_navigationCompleted) return;
    _navigationCompleted = true;

    print('🔵 [Splash] Starting navigation logic...');

    try {
      // ---------------------------------------------------------
      // 🔥 FIX FOR iOS REINSTALL LOGIN ISSUE
      // ---------------------------------------------------------
      if (FFAppState().isFirstInstall) {
        print('🧹 [Splash] First install detected. Clearing persisted values...');
        
        print('this one is called');

        // Clear ALL persisted values here
        FFAppState().authToken = '';
        // Add any additional persisted vars you want to clear
        // FFAppState().userId = '';
        // FFAppState().profileData = null;

        // Mark as no longer first install
        FFAppState().isFirstInstall = false;

        // Redirect to login
        if (mounted) {
          context.goNamed(LogInWidget.routeName);
        }
        return; // stop here
      }
      // ---------------------------------------------------------

      // Check connectivity
      final isConnected = await actions.connect();
      print('🌐 [Splash] Connectivity: $isConnected');

      if (!isConnected) {
        print('🚫 [Splash] No internet connection.');
        if (mounted) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (dialogContext) => const Dialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              child: ConectiviltyWidget(),
            ),
          );
        }
        return;
      }

      // Ensure minimum splash duration (reduced since video handles timing)
      await Future.delayed(const Duration(milliseconds: 1000));

      if (!mounted) return;

      // Check authentication
      final authToken = FFAppState().authToken;
      print('🔑 [Splash] Token: "$authToken"');

      if (authToken.isEmpty) {
        print('🔐 [Splash] No token. Going to login.');
        context.goNamed(LogInWidget.routeName);
        return;
      }

      // Validate profile
      print('🔍 [Splash] Validating profile...');
      final profileRes = await DashboardGroup.getProfileCall.call(
        authToken: authToken,
      );

      if (!mounted) return;

      if (profileRes.succeeded) {
        final isAttempt = getJsonField(
          profileRes.jsonBody,
          r'$.data.is_attempt',
        );
        print('🎯 [Splash] is_attempt: $isAttempt');

        if (isAttempt == 0) {
          context.goNamed(HomeOnboardingWidget.routeName);
        } else {
          context.goNamed(NavWidget.routeName);
        }
      } else {
        print('❌ [Splash] Profile validation failed.');
        context.goNamed(LogInWidget.routeName);
      }
    } catch (e) {
      print('❌ [Splash] Error: $e');
      if (mounted) {
        context.goNamed(LogInWidget.routeName);
      }
    }
  }

  @override
  void dispose() {
    _videoController?.removeListener(_videoListener);
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: _isVideoInitialized && _videoController != null
            ? Center(

                child: AspectRatio(
                  aspectRatio: _videoController!.value.aspectRatio,
                  child: VideoPlayer(_videoController!),
                ),
              )
            : Container(
                // Show black screen while video loads - matches native splash
                color: Colors.black,
                width: double.infinity,
                height: double.infinity,
              ),
      ),
    );
  }
}
