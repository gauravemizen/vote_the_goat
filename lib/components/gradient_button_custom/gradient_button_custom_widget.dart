import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'gradient_button_custom_model.dart';
export 'gradient_button_custom_model.dart';

class GradientButtonCustomWidget extends StatefulWidget {
  const GradientButtonCustomWidget({
    super.key,
    this.text,
    int? navigationType,
  }) : this.navigationType = navigationType ?? 1;

  final String? text;

  /// for managing condition base navigation
  final int navigationType;

  @override
  State<GradientButtonCustomWidget> createState() =>
      _GradientButtonCustomWidgetState();
}

class _GradientButtonCustomWidgetState
    extends State<GradientButtonCustomWidget> {
  late GradientButtonCustomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GradientButtonCustomModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 47.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [FlutterFlowTheme.of(context).peach, Color(0xFFE09B6E)],
          stops: [0.0, 1.0],
          begin: AlignmentDirectional(0.0, -1.0),
          end: AlignmentDirectional(0, 1.0),
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Text(
          widget.text!,
          style: FlutterFlowTheme.of(context).titleLarge.override(
                font: GoogleFonts.poppins(
                  fontWeight:
                      FlutterFlowTheme.of(context).titleLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
                color: Colors.white,
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
              ),
        ),
      ),
    );
  }
}
