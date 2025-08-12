import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'button_small_model.dart';
export 'button_small_model.dart';

class ButtonSmallWidget extends StatefulWidget {
  const ButtonSmallWidget({
    super.key,
    this.text,
    int? navigationType,
    this.height,
    this.width,
    int? fontSize,
    Color? textColor,
  })  : this.navigationType = navigationType ?? 1,
        this.fontSize = fontSize ?? 16,
        this.textColor = textColor ?? Colors.white;

  final String? text;

  /// for managing condition base navigation
  final int navigationType;

  final int? height;
  final int? width;
  final int fontSize;
  final Color textColor;

  @override
  State<ButtonSmallWidget> createState() => _ButtonSmallWidgetState();
}

class _ButtonSmallWidgetState extends State<ButtonSmallWidget> {
  late ButtonSmallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonSmallModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width?.toDouble(),
      height: widget.height?.toDouble(),
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
                color: widget.textColor,
                fontSize: widget.fontSize.toDouble(),
                letterSpacing: 0.0,
                fontWeight: FlutterFlowTheme.of(context).titleLarge.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
              ),
        ),
      ),
    );
  }
}
