import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'confirm_dilogue_model.dart';
export 'confirm_dilogue_model.dart';

class ConfirmDilogueWidget extends StatefulWidget {
  const ConfirmDilogueWidget({super.key});

  @override
  State<ConfirmDilogueWidget> createState() => _ConfirmDilogueWidgetState();
}

class _ConfirmDilogueWidgetState extends State<ConfirmDilogueWidget> {
  late ConfirmDilogueModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmDilogueModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FFButtonWidget(
      onPressed: () {
        print('Button pressed ...');
      },
      text: 'YES',
      options: FFButtonOptions(
        height: 40.0,
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        color: FlutterFlowTheme.of(context).primary,
        textStyle: FlutterFlowTheme.of(context).headlineLarge.override(
              font: GoogleFonts.poppins(
                fontWeight:
                    FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
              ),
              color: Colors.white,
              fontSize: 16.0,
              letterSpacing: 0.0,
              fontWeight: FlutterFlowTheme.of(context).headlineLarge.fontWeight,
              fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
            ),
        elevation: 0.0,
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(40.0),
      ),
    );
  }
}
