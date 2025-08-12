import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'gradient_button_model.dart';
export 'gradient_button_model.dart';

class GradientButtonWidget extends StatefulWidget {
  const GradientButtonWidget({super.key});

  @override
  State<GradientButtonWidget> createState() => _GradientButtonWidgetState();
}

class _GradientButtonWidgetState extends State<GradientButtonWidget> {
  late GradientButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GradientButtonModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
      child: Container(
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
        child: FFButtonWidget(
          onPressed: () {
            print('Button pressed ...');
          },
          text: 'Start',
          options: FFButtonOptions(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: Color(0x00CD2B2B),
            textStyle: FlutterFlowTheme.of(context).titleLarge.override(
                  font: GoogleFonts.poppins(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).titleLarge.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                ),
            elevation: 0.0,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
