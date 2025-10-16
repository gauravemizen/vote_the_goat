// Automatic FlutterFlow imports


import '../../eligible_players/eligible_player/eligible_player_widget.dart';
import '../../homepage/home_page/home_page_widget.dart';
import '../../play_with_friends/play_with_friends/play_with_friends_widget.dart';
import '../../player_bio/player_bio/player_bio_widget.dart';
import '../../ranking_pages/ranking_page/ranking_page_widget.dart';
import '../../ranking_pages/your_final_ranking/your_final_ranking_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets
// import 'package:dot_curved_bottom_nav/dot_curved_bottom_nav.dart';

// Dummy pages for each tab — replace with actual FlutterFlow pages
class TabHome extends StatelessWidget {
  const TabHome({super.key});
  @override
  Widget build(BuildContext context) => const HomePageWidget();
}

class TabNotifications extends StatelessWidget {
  const TabNotifications({super.key});
  @override
  Widget build(BuildContext context) =>
      const EligiblePlayerWidget();
}

class TabExplore extends StatelessWidget {
  const TabExplore({super.key});
  @override
  Widget build(BuildContext context) =>
     const RankingPageWidget();
}

class TabAccount extends StatelessWidget {
  const TabAccount({super.key});
  @override
  Widget build(BuildContext context) =>const YourFinalRankingWidget();

}

class TabProfile extends StatelessWidget {
  const TabProfile({super.key});
  @override
  Widget build(BuildContext context) =>
   const PlayWithFriendsWidget();
}

class CurvedNavWithPages extends StatefulWidget {
  const CurvedNavWithPages({
    super.key,
    this.width,
    this.height,
    this.initialTab = 0, // Default to 0 (TabHome)

  });

  final double? width;
  final double? height;
  final int initialTab;



  static String routeName = 'curvedNav'; // Define route name
  static String routePath = '/curvedNav'; // Define route path

  @override
  State<CurvedNavWithPages> createState() => _CurvedNavWithPagesState();
}

class _CurvedNavWithPagesState extends State<CurvedNavWithPages> {
  int _currentPage = 0;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialTab; // Set initial tab from widget parameter
  }
  @override
  void didUpdateWidget(CurvedNavWithPages oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update current page when initialTab changes
    if (widget.initialTab != oldWidget.initialTab) {
      setState(() {
        _currentPage = widget.initialTab;
      });
    }
  }
  void changeTab(int index) {
    setState(() {
      _currentPage = index;
    });
  }


  /// Add your actual pages here
  List<Widget> get _pages => const [
        TabHome(),
        TabNotifications(),
        TabExplore(),
        TabAccount(),
        TabProfile(),
      ];

  @override




///

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Color getInactiveColor(int index) {
      return isDarkMode ? const Color(0xff7E6C5D) : const Color(0xff69260D);
    }

    return Scaffold(
      extendBody: true,
      body: SizedBox(
        width: widget.width ?? MediaQuery.of(context).size.width,
        height: widget.height ?? MediaQuery.of(context).size.height,
        child: _pages[_currentPage],
      ),
      bottomNavigationBar: DotCurvedBottomNav(
        scrollController: _scrollController,
        hideOnScroll: true,
        indicatorColor: Colors.transparent,
        backgroundColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.ease,
        selectedIndex: _currentPage,
        indicatorSize: 6,
        borderRadius: 25,
        height: 70,
        onTap: (index) {
          setState(() => _currentPage = index);
        },
        items: [
          _buildNavItem(Icons.home, 'Home', 0, getInactiveColor),
          _buildNavItem(Icons.format_list_bulleted_rounded, 'Eligible Players', 1, getInactiveColor),
          _buildNavItem(Icons.star_border_rounded, 'Your Ranking', 2, getInactiveColor),
          _buildNavItem(Icons.star_border_rounded, 'Global Ranking', 3, getInactiveColor),
          _buildNavItem(Icons.groups, 'Play With Friends', 4, getInactiveColor),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index, Color Function(int) getInactiveColor) {
    final isSelected = _currentPage == index;
    final color = isSelected ? Colors.white : getInactiveColor(index);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: 4),
        Text(overflow: TextOverflow.ellipsis,
          label,
          style: TextStyle(

            fontSize: 9,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }

}
