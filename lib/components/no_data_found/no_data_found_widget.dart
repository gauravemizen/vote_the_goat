import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'no_data_found_model.dart';
export 'no_data_found_model.dart';

/// create a  no data found text widget component
///
class NoDataFoundWidget extends StatefulWidget {
  const NoDataFoundWidget({super.key});

  @override
  State<NoDataFoundWidget> createState() => _NoDataFoundWidgetState();
}

class _NoDataFoundWidgetState extends State<NoDataFoundWidget> {
  late NoDataFoundModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDataFoundModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: Lottie.asset(
            'assets/jsons/Empty.json',
            width: 200.0,
            height: 200.0,
            fit: BoxFit.contain,
            animate: true,
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: Text(
              'No Data Found',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    font: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).customColor3,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleLarge.fontStyle,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
