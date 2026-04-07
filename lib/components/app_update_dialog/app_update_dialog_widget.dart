import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'app_update_dialog_model.dart';
export 'app_update_dialog_model.dart';

class AppUpdateDialogWidget extends StatefulWidget {
  const AppUpdateDialogWidget({
    Key? key,
    required this.forceUpdate,
    required this.updateUrl,
    required this.latestVersion,
    required this.releaseNotes,
    this.onUpdateLater,
  }) : super(key: key);

  final bool forceUpdate;
  final String updateUrl;
  final String latestVersion;
  final String releaseNotes;
  final VoidCallback? onUpdateLater;

  @override
  State<AppUpdateDialogWidget> createState() => _AppUpdateDialogWidgetState();
}

class _AppUpdateDialogWidgetState extends State<AppUpdateDialogWidget> {
  late AppUpdateDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppUpdateDialogModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  Future<void> _launchStore() async {
    try {
      final uri = Uri.parse(widget.updateUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Error launching store: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !widget.forceUpdate,
      child: AlertDialog(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Container(
          width: MediaQuery.sizeOf(context).width * 0.85,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.6,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // App Icon/Logo
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  Icons.system_update_alt,
                  color: Colors.white,
                  size: 40,
                ),
              ),

              SizedBox(height: 20),

              // Title
              Text(
                widget.forceUpdate ? 'Update Required' : 'Update Available',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 12),

              // Version info
              Text(
                'Version ${widget.latestVersion} is now available',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).secondaryText,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 16),

              // Release notes
              if (widget.releaseNotes.isNotEmpty) ...[
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    'What\'s New:',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent4,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    widget.releaseNotes,
                    style: FlutterFlowTheme.of(context).bodySmall.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],

              // Force update message
              if (widget.forceUpdate) ...[
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).error.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning_amber,
                        color: FlutterFlowTheme.of(context).error,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'This update is required to continue using the app.',
                          style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).error,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],

              // Buttons
              Row(
                children: [
                  // Later button (only for non-force updates)
                  if (!widget.forceUpdate) ...[
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () {
                          debugPrint('👋 User chose to update later');
                          // Call the callback to remove the overlay
                          // (no Navigator.pop — avoids GoRouter conflicts)
                          widget.onUpdateLater?.call();
                        },
                        text: 'Later',
                        options: FFButtonOptions(
                          height: 44,
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: Colors.transparent,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontWeight: FontWeight.w500,
                          ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                  ],

                  // Update button
                  Expanded(
                    flex: widget.forceUpdate ? 1 : 1,
                    child: FFButtonWidget(
                      onPressed: _launchStore,
                      text: 'Update Now',
                      options: FFButtonOptions(
                        height: 44,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
