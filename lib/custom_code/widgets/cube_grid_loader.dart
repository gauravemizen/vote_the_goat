// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_spinkit/flutter_spinkit.dart';

class CubeGridLoader extends StatelessWidget {
  final double size; // controls the loader size
  final double? width; // optional, for FlutterFlow compatibility
  final double? height; // optional, for FlutterFlow compatibility

  const CubeGridLoader({
    Key? key,
    this.size = 40,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width ?? size,
        height: height ?? size,
        child: SpinKitCubeGrid(
          color: const Color(0xFFFD7325), // fixed loader color
          size: size,
        ),
      ),
    );
  }
}
