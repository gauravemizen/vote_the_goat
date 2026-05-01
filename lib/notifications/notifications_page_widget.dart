import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_state.dart';

class NotificationsPageWidget extends StatefulWidget {
  const NotificationsPageWidget({super.key});

  static String routeName = 'notificationsPage';
  static String routePath = '/notificationsPage';

  @override
  State<NotificationsPageWidget> createState() =>
      _NotificationsPageWidgetState();
}

class _NotificationsPageWidgetState extends State<NotificationsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> _notifications = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchNotifications();
  }

  Future<void> _fetchNotifications() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final response = await DashboardGroup.notificationsCall.call(
        authToken: FFAppState().authToken,
      );

      if (response.succeeded) {
        final list = DashboardGroup.notificationsCall
            .notificationsList(response.jsonBody);
        setState(() {
          _notifications = list ?? [];
          _isLoading = false;
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to load notifications';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Something went wrong. Please try again.';
        _isLoading = false;
      });
    }
  }

  IconData _getNotificationIcon(String? type, String? title) {
    // Check explicit type first
    switch (type?.toLowerCase()) {
      case 'contest':
        return Icons.emoji_events;
      case 'ranking':
        return Icons.trending_up;
      case 'friend':
        return Icons.person_add;
      case 'summary':
        return Icons.bar_chart;
      case 'player':
        return Icons.group_add;
      case 'result':
        return Icons.military_tech;
    }

    // Infer type from title if type is not available
    final titleLower = title?.toLowerCase() ?? '';
    if (titleLower.contains('contest')) return Icons.emoji_events;
    if (titleLower.contains('ranking')) return Icons.trending_up;
    if (titleLower.contains('friend') || titleLower.contains('team')) return Icons.person_add;
    if (titleLower.contains('summary') || titleLower.contains('report')) return Icons.bar_chart;
    if (titleLower.contains('player')) return Icons.group_add;
    if (titleLower.contains('result') || titleLower.contains('winner')) return Icons.military_tech;
    if (titleLower.contains('welcome')) return Icons.celebration;

    return Icons.notifications;
  }

  Future<void> _markAsRead(int notificationId, int index) async {
    try {
      final response = await DashboardGroup.markNotificationReadCall.call(
        notificationId: notificationId,
        authToken: FFAppState().authToken,
      );

      if (response.succeeded) {
        setState(() {
          _notifications[index] = {
            ..._notifications[index] as Map<String, dynamic>,
            'is_read': true,
          };
        });
      }
    } catch (_) {}
  }

  String _timeAgo(String? dateStr) {    if (dateStr == null || dateStr.isEmpty) return '';
    try {
      final date = DateTime.parse(dateStr);
      final now = DateTime.now();
      final diff = now.difference(date);

      if (diff.inSeconds < 60) return 'Just now';
      if (diff.inMinutes < 60) {
        final mins = diff.inMinutes;
        return '$mins ${mins == 1 ? 'min' : 'mins'} ago';
      }
      if (diff.inHours < 24) {
        final hours = diff.inHours;
        return '$hours ${hours == 1 ? 'hour' : 'hours'} ago';
      }
      if (diff.inDays < 7) {
        final days = diff.inDays;
        return '$days ${days == 1 ? 'day' : 'days'} ago';
      }
      if (diff.inDays < 30) {
        final weeks = (diff.inDays / 7).floor();
        return '$weeks ${weeks == 1 ? 'week' : 'weeks'} ago';
      }
      if (diff.inDays < 365) {
        final months = (diff.inDays / 30).floor();
        return '$months ${months == 1 ? 'month' : 'months'} ago';
      }
      final years = (diff.inDays / 365).floor();
      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } catch (_) {
      return dateStr;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).oposite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).backBtnClr,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDark ? Colors.transparent : const Color(0xD5999999),
              ),
            ),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: FlutterFlowTheme.of(context).tertiary,
              size: 18,
            ),
          ),
        ),
        title: Text(
          'Notifications',
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                font: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                ),
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
              ),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: custom_widgets.CubeGridLoader(
                  width: 40.0,
                  height: 40.0,
                  size: 40.0,
                ),
              ),
            )
          : _errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64,
                        color: FlutterFlowTheme.of(context)
                            .tertiary
                            .withValues(alpha: 0.5),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _errorMessage!,
                        style: FlutterFlowTheme.of(context).titleMedium.override(
                              font: GoogleFonts.poppins(),
                              letterSpacing: 0.0,
                            ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: _fetchNotifications,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEB6027),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'Retry',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : _notifications.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications_off_outlined,
                            size: 64,
                            color: FlutterFlowTheme.of(context)
                                .tertiary
                                .withValues(alpha: 0.5),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No notifications yet',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.poppins(),
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      color: const Color(0xFFEB6027),
                      onRefresh: _fetchNotifications,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        itemCount: _notifications.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final notification = _notifications[index];
                          final title =
                              getJsonField(notification, r'$.title')?.toString() ??
                                  'Notification';
                          final body =
                              getJsonField(notification, r'$.message')?.toString() ??
                                  '';
                          final type =
                              getJsonField(notification, r'$.type')?.toString();
                          final createdAt =
                              getJsonField(notification, r'$.created_at')
                                  ?.toString();
                          final isRead =
                              getJsonField(notification, r'$.is_read') == true ||
                                  getJsonField(notification, r'$.read_at') != null;
                          final notificationId =
                              getJsonField(notification, r'$.id');

                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              if (!isRead && notificationId != null) {
                                _markAsRead(notificationId as int, index);
                              }
                            },
                            child: Container(
                            decoration: BoxDecoration(
                              color: isRead
                                  ? (isDark
                                      ? Colors.white.withValues(alpha: 0.05)
                                      : Colors.black.withValues(alpha: 0.03))
                                  : (isDark
                                      ? const Color(0xFFEB6027)
                                          .withValues(alpha: 0.12)
                                      : const Color(0xFFEB6027)
                                          .withValues(alpha: 0.08)),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isRead
                                    ? FlutterFlowTheme.of(context).homeBoxBorder
                                    : const Color(0xFFEB6027)
                                        .withValues(alpha: 0.3),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .brownColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      _getNotificationIcon(type, title),
                                      color: isDark
                                          ? FlutterFlowTheme.of(context)
                                              .lightPeach
                                          : Colors.white,
                                      size: 22,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                title,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyLarge
                                                    .override(
                                                      font:
                                                          GoogleFonts.poppins(
                                                        fontWeight: isRead
                                                            ? FontWeight.w500
                                                            : FontWeight.w600,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight: isRead
                                                          ? FontWeight.w500
                                                          : FontWeight.w600,
                                                    ),
                                              ),
                                            ),
                                            if (!isRead)
                                              Container(
                                                width: 8,
                                                height: 8,
                                                decoration:
                                                    const BoxDecoration(
                                                  color: Color(0xFFEB6027),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                          ],
                                        ),
                                        if (body.isNotEmpty) ...[
                                          const SizedBox(height: 4),
                                          Text(
                                            body,
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  font: GoogleFonts.poppins(),
                                                  letterSpacing: 0.0,
                                                ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                        if (createdAt != null) ...[
                                          const SizedBox(height: 6),
                                          Text(
                                            _timeAgo(createdAt),
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  font: GoogleFonts.poppins(),
                                                  color:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .tertiary
                                                          .withValues(
                                                              alpha: 0.6),
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          );
                        },
                      ),
                    ),
    );
  }
}

