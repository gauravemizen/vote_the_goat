// // Automatic FlutterFlow imports
// import '../../eligible_players/eligible_player/eligible_player_widget.dart';
// import '../../homepage/home_page/home_page_widget.dart';
// import '../../player_bio/player_bio/player_bio_widget.dart';
// import '../../ranking_pages/ranking_page/ranking_page_widget.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import 'index.dart'; // Imports other custom widgets
// import 'package:flutter/material.dart';
// // Begin custom widget code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!
//
//
//
// import 'index.dart'; // Imports other custom widgets
//
// import 'index.dart'; // Imports other custom widgets
// // import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';
//
// // Dummy pages for each tab — replace with actual FlutterFlow pages
// class TabHome extends StatelessWidget {
//   const TabHome({super.key});
//   @override
//   Widget build(BuildContext context) => const HomePageWidget();
// }
//
// class TabNotifications extends StatelessWidget {
//   const TabNotifications({super.key});
//   @override
//   Widget build(BuildContext context) => const EligiblePlayerWidget();
// }
//
// class TabExplore extends StatelessWidget {
//   const TabExplore({super.key});
//   @override
//   Widget build(BuildContext context) => const RankingPageWidget();
// }
//
// class TabAccount extends StatelessWidget {
//   const TabAccount({super.key});
//   @override
//   Widget build(BuildContext context) => const RankingPageWidget();
// }
//
// class TabProfile extends StatelessWidget {
//   const TabProfile({super.key});
//   @override
//   Widget build(BuildContext context) => const PlayerBioWidget();
// }
//
// class CurvedNavWithPages extends StatefulWidget {
//   const CurvedNavWithPages({
//     super.key,
//     this.width,
//     this.height,
//   });
//
//   final double? width;
//   final double? height;
//
//   @override
//   State<CurvedNavWithPages> createState() => _CurvedNavWithPagesState();
// }
//
// class _CurvedNavWithPagesState extends State<CurvedNavWithPages> {
//   int _currentPage = 0;
//   final ScrollController _scrollController = ScrollController();
//
//   /// Add your actual pages here
//   List<Widget> get _pages => const [
//         TabHome(),
//         TabNotifications(),
//         TabExplore(),
//         TabAccount(),
//         TabProfile(),
//       ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body: SizedBox(
//         width: widget.width ?? MediaQuery.of(context).size.width,
//         height: widget.height ?? MediaQuery.of(context).size.height,
//         child: _pages[_currentPage],
//       ),
//       bottomNavigationBar: DotCurvedBottomNav(
//         scrollController: _scrollController,
//         hideOnScroll: true,
//         indicatorColor: Colors.transparent,
//         backgroundColor: Colors.black,
//         animationDuration: const Duration(milliseconds: 300),
//         animationCurve: Curves.ease,
//         selectedIndex: _currentPage,
//         indicatorSize: 5,
//         borderRadius: 25,
//         height: 70,
//         onTap: (index) {
//           setState(() => _currentPage = index);
//         },
//         items: [
//           Icon(
//             Icons.home_filled,
//             color: _currentPage == 0 ? Colors.blue : Colors.white,
//           ),
//           Icon(
//             Icons.menu,
//             color: _currentPage == 1 ? Colors.blue : Colors.white,
//           ),
//           Icon(
//             Icons.star_border,
//             color: _currentPage == 2 ? Colors.blue : Colors.white,
//           ),
//           Icon(
//             Icons.star_border_purple500_rounded,
//             color: _currentPage == 3 ? Colors.blue : Colors.white,
//           ),
//           Icon(
//             Icons.groups,
//             color: _currentPage == 4 ? Colors.blue : Colors.white,
//           ),
//         ],
//       ),
//     );
//   }
// }
