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
      // _videoController = VideoPlayerController.asset(
      //   'assets/videos/MicrosoftTeams-video.mp4',
      // );

      _videoController = VideoPlayerController.asset(
        'assets/videos/Splash4.mp4',
      );

      await _videoController!.initialize();

      if (mounted) {
        setState(() {
          _isVideoInitialized = true;
        });

        _videoController!.play();
      }
    } catch (e) {
      print('❌ [Splash] Error initializing video: $e');
      if (mounted) {
        setState(() {
          _isVideoInitialized = true; // Show fallback
        });
      }
    }
  }

  void _handleNavigation() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      print('🔵 [Splash] Starting navigation logic...');

      try {
        // ---------------------------------------------------------
        // 🔥 FIX FOR iOS REINSTALL LOGIN ISSUE
        // ---------------------------------------------------------
        if (FFAppState().isFirstInstall) {
          print('🧹 [Splash] First install detected. Clearing persisted values...');

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

        // Wait for minimum splash duration
        await Future.delayed(const Duration(milliseconds: 4000));

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
    });
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: _isVideoInitialized && _videoController != null
              ? AspectRatio(
            aspectRatio: _videoController!.value.aspectRatio,
            child: VideoPlayer(_videoController!),
          )
              : Center(
            child: Image.asset(
              'assets/images/splash_placeholder.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.black,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
