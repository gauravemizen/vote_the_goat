import 'package:flutter/material.dart';
import '/subscription/ad_service.dart';

mixin PageTimerMixin<T extends StatefulWidget> on State<T> {
  String get pageName;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AdService().startPageTimer(pageName);
    });
  }

  @override
  void dispose() {
    AdService().stopInterstitialTimer();
    super.dispose();
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Restart timer when widget updates
    AdService().startPageTimer(pageName);
  }
}
