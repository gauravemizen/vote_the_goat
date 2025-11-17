// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/widgets/index.dart' as custom_widgets;
// import 'package:flutter/material.dart';
//
// import 'nav_model.dart';
// export 'nav_model.dart';
//
// class NavWidget extends StatefulWidget {
//   const NavWidget({super.key});

//
//   static String routeName = 'nav';
//   static String routePath = '/nav';
//
//   @override
//   State<NavWidget> createState() => _NavWidgetState();
// }
//
// class _NavWidgetState extends State<NavWidget> with RouteAware {
//   late NavModel _model;
//
//   final scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => NavModel());
//
//
//   }
//
//   @override
//   void dispose() {
//     routeObserver.unsubscribe(this);
//
//     _model.dispose();
//
//     super.dispose();
//   }
//
//   @override
//   void didUpdateWidget(NavWidget oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _model.widget = widget;
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final route = DebugModalRoute.of(context);
//     if (route != null) {
//       routeObserver.subscribe(this, route);
//     }
//     debugLogGlobalProperty(context);
//   }
//
//   @override
//   void didPopNext() {
//     if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
//       setState(() => _model.isRouteVisible = true);
//       debugLogWidgetClass(_model);
//     }
//   }
//
//   @override
//   void didPush() {
//     if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
//       setState(() => _model.isRouteVisible = true);
//       debugLogWidgetClass(_model);
//     }
//   }
//
//   @override
//   void didPop() {
//     _model.isRouteVisible = false;
//   }
//
//   @override
//   void didPushNext() {
//     _model.isRouteVisible = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     DebugFlutterFlowModelContext.maybeOf(context)
//         ?.parentModelCallback
//         ?.call(_model);
//
//     return GestureDetector(
//       onTap: () {
//         FocusScope.of(context).unfocus();
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Scaffold(bottomNavigationBar:  const Align(
//         alignment: AlignmentDirectional(0.0, 0.0),
//         child: custom_widgets.CurvedNavWithPages(
//           width: double.infinity,
//           // height: 100.0,
//         ),
//       ),
//         key: scaffoldKey,
//         backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
//       ),
//     );
//   }
// }

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';

import 'nav_model.dart';
export 'nav_model.dart';

class NavWidget extends StatefulWidget {
  const NavWidget({
    super.key,
    this.initialTab = 0, // Add initialTab parameter
  });

  final int initialTab; // Parameter to specify initial tab

  static String routeName = 'nav';
  static String routePath = '/nav';

  @override
  State<NavWidget> createState() => _NavWidgetState();
}

class _NavWidgetState extends State<NavWidget> with RouteAware {
  late NavModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavModel());
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _model.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(NavWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _model.widget = widget;
  }
  //
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final route = DebugModalRoute.of(context);
  //   if (route != null) {
  //     routeObserver.subscribe(this, route);
  //   }
  //   debugLogGlobalProperty(context);
  // }
  int initialTab = 0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Read query parameters to get initialTab
    final params = GoRouterState.of(context).uri.queryParameters;
    if (params.containsKey('initialTab')) {
      final newInitialTab = int.tryParse(params['initialTab'] ?? '0') ?? 0;
      if (newInitialTab != initialTab) {
        setState(() {
          initialTab = newInitialTab;
        });
      }
    }

    final route = DebugModalRoute.of(context);
    if (route != null) {
      routeObserver.subscribe(this, route);
    }
    debugLogGlobalProperty(context);
  }

  @override
  void didPopNext() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPush() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPop() {
    _model.isRouteVisible = false;
  }

  @override
  void didPushNext() {
    _model.isRouteVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    DebugFlutterFlowModelContext.maybeOf(context)
        ?.parentModelCallback
        ?.call(_model);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          bottomNavigationBar: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: custom_widgets.CurvedNavWithPages(
              width: double.infinity,
              initialTab: initialTab, // Pass initialTab to CurvedNavWithPages
            ),
          ),
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        ),
      ),
    );
  }
}