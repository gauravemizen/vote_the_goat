// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/rendering.dart';

import 'curved_nav_painter.dart';

/// A beautiful and animated bottom navigation that may or may not be curved
/// and has a beautiful indicator around which the bottom nav is curved.
///
/// Update [selectedIndex] to change the selected item.
/// [selectedIndex] is required and must not be null.
class DotCurvedBottomNav extends StatefulWidget {
  /// Animation curve of hiding animation and dot indicator moving between
  /// indices.
  final Curve animationCurve;

  /// Animation Duration of hiding animation and dot indicator moving between
  /// indices.
  final Duration animationDuration;

  /// Background color of the bottom navigation
  final Color backgroundColor;

  /// Color fo the dot indicator shown on the currently selected item
  final Color indicatorColor;

  /// Configures height of bottom navigation. The limitations of [height] are
  /// enforced through assertions.
  final double height;

  /// Configures the size of indicator
  final double indicatorSize;

  /// Configures currently selected / highlighted index
  final int selectedIndex;

  /// Defines the appearance of the buttons that are displayed in the bottom
  /// navigation bar. This should have at least two items and five at most.
  final List<Widget> items;

  /// Callback function that is invoked whenever an Item is tapped on by the user
  final ValueChanged<int>? onTap;

  /// [scrollController] is used to listen to when the user is scrolling the page
  /// and hided the bottom navigation
  final ScrollController? scrollController;

  /// Used to configure the borderRadius of the [DotCurvedBottomNav]. Defaults to 25.
  final double borderRadius;
  final EdgeInsets margin;

  /// Used to configure the margin around [DotCurvedBottomNav]. Increase it to make
  /// [DotCurvedBottomNav] float.
  final bool hideOnScroll;

  DotCurvedBottomNav({
    super.key,
    required this.items,
    this.scrollController,
    this.hideOnScroll = false,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    this.backgroundColor = Colors.black,
    this.indicatorColor =     Colors.white,
    this.height = 75.0,
    this.indicatorSize = 5,
    this.selectedIndex = 0,
    this.onTap,
    this.borderRadius = 25,
    this.margin = const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
  })  : assert(items.isNotEmpty),
        assert(0 <= selectedIndex && selectedIndex < items.length),
        assert(0 <= height && height <= 75.0),
        assert(hideOnScroll ? scrollController != null : true,
            "You need to provide [scrollController] parameter to enable hide on scroll"),
        assert(borderRadius >= 0 && borderRadius <= 30);

  @override
  State<DotCurvedBottomNav> createState() => _DotCurvedBottomNavState();
}

class _DotCurvedBottomNavState extends State<DotCurvedBottomNav>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late double _pos;

  late final AnimationController _sliderController = AnimationController(
    vsync: this,
    duration: widget.animationDuration,
    reverseDuration: widget.animationDuration,
  );

  @override
  void dispose() {
    super.dispose();
    widget.scrollController?.removeListener(_scrollListener);
  }

  @override
  void didUpdateWidget(covariant DotCurvedBottomNav oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedIndex != widget.selectedIndex) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _buttonTap(widget.selectedIndex);
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    _pos = widget.selectedIndex.toDouble(); // Initialize with double value
    _animationController = AnimationController(
      vsync: this,
      value: widget.selectedIndex.toDouble(), // Set initial value as double
      lowerBound: 0,
      upperBound: (widget.items.length - 1).toDouble(), // Fix upper bound
    );
    _animationController
        .addListener(() => setState(() => _pos = _animationController.value));

    widget.scrollController?.addListener(_scrollListener);
  }


  @override
  Widget build(BuildContext context) {

    // double _calculateIndicatorOffset(BuildContext context) {
    //   final totalWidth = MediaQuery.of(context).size.width - widget.margin.horizontal;
    //   final perItemWidth = totalWidth / widget.items.length;
    //   return perItemWidth * _pos + (perItemWidth - 20) / 2; // 40 is the image width
    // }

    double calculateIndicatorOffset(BuildContext context) {
      final totalWidth = MediaQuery.of(context).size.width;
      final perItemWidth = totalWidth / widget.items.length;
      return perItemWidth * _pos + (perItemWidth - 24) / 2;
    }


    return AnimatedBuilder(
      animation: _sliderController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0,
              (widget.height + widget.margin.bottom) * _sliderController.value),
          child:


          SizedBox(
            width: MediaQuery.of(context).size.width,
        height: widget.height + widget.margin.vertical,
        child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
        // Background bar with full width (ignoring margin)
        Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
        height: widget.height,
        decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(widget.borderRadius),

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.borderRadius),
            topRight: Radius.circular(widget.borderRadius),
          ),
          color:


          Colors.transparent, // Canvas will draw background
        ),
        child: CustomPaint(
        painter: CurvedNavPainter(
        startingLoc: _pos,
        itemsLength: widget.items.length,
        // color: widget.backgroundColor,
        color: Theme.of(context).brightness == Brightness.dark? const Color(0xff282828) :const Color(0xffEB6027) ,
        indicatorColor: Colors.transparent, // we'll use image instead
        textDirection: TextDirection.LTR,
        indicatorSize: widget.indicatorSize,
        borderRadius: widget.borderRadius,
        ),
        ),
        ),
        ),

        // Image-based indicator
        Positioned(
        left: calculateIndicatorOffset(context),
        bottom: widget.height - 11, // adjust vertical position of image
        child: Image.asset(
          // 'assets/images/basketball.png',

          "assets/images/basketball.png",
          width: 24,
        height: 24,
        ),
        ),

        // Bottom Nav Buttons
        Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: SizedBox(
        height: widget.height,
        // padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        for (int i = 0; i < widget.items.length; i++)
        Expanded(
        child: GestureDetector(
        onTap: () => _buttonTap(i),
        child: widget.items[i],
        ),
        ),
        ],
        ),
        ),
        ),
        ],
        ),
        ),


        );
      },
    );
  }

  _scrollListener() {
    if (_sliderController.isAnimating || widget.hideOnScroll == false) {
      return;
    }

    if (widget.scrollController?.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (_sliderController.isCompleted) {
        _sliderController.reverse();
      }
    } else if (widget.scrollController?.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if ((_sliderController.isCompleted || !_sliderController.isAnimating)) {
        _sliderController.forward();
      }
    }
  }

  void _buttonTap(int index) {
    if (widget.onTap != null) {
      widget.onTap!(index);
    }
    _animationController.animateTo(index.toDouble(),
        duration: widget.animationDuration, curve: widget.animationCurve);
  }
}
