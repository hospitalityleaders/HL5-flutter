import 'package:flutter/material.dart';
import 'package:holedo/profile/presentation/ui/flutter_slider_drawer/helper/slider_shadow.dart';
import 'package:holedo/profile/presentation/ui/flutter_slider_drawer/helper/utils.dart';
import 'package:holedo/profile/presentation/ui/flutter_slider_drawer/mobile_slide_menu.dart';
import 'package:holedo/profile/presentation/ui/flutter_slider_drawer/slider_bar.dart';
import 'package:holedo/profile/presentation/ui/flutter_slider_drawer/slider_direction.dart';
import 'package:holedo/profile/presentation/ui/pages/mobile_view_section/mobile_profile_overview_section.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';

export 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
export 'package:holedo/layouts/cards/holedo_cards.dart';
export 'package:holedo/layouts/pages/category_page.dart';
export 'package:holedo/layouts/pages/home_page.dart';
export 'package:holedo/layouts/pages/jobs_page.dart';
export 'package:holedo/layouts/pages/jobsfront_page.dart';
export 'package:holedo/layouts/pages/login_page.dart';
export 'package:holedo/layouts/pages/news_page.dart';
export 'package:holedo/layouts/pages/newsfront_page.dart';
export 'package:holedo/layouts/pages/profile_page.dart';
export 'package:holedo/layouts/pages/recruitment_page.dart';
export 'package:holedo/layouts/pages/search_page.dart';

class SliderDrawer extends StatefulWidget {
  final Widget? slider;
  final Widget child;
  final int animationDuration;
  final double sliderOpenSize;
  final double sliderCloseSize;
  final Widget? appBar;
  final Color splashColor;
  final SliderShadow? sliderShadow;
  final SlideDirection slideDirection;
  final Size screenSize;

  const SliderDrawer({
    Key? key,
    this.slider,
    required this.child,
    this.animationDuration = 400,
    this.sliderOpenSize = 265,
    this.splashColor = Colors.transparent,
    this.sliderCloseSize = 0,
    this.slideDirection = SlideDirection.RIGHT_TO_LEFT,
    this.sliderShadow,
    this.appBar,
    required this.screenSize,
  }) : super(key: key);

  @override
  SliderDrawerState createState() => SliderDrawerState();
}

class SliderDrawerState extends State<SliderDrawer>
    with TickerProviderStateMixin {
  final double _percent = 0.0;

  // AnimationController? _animationDrawerController;
  final double sliderOpenSize = 265;
  late final AnimationController _animationDrawerController;
  late Animation<double> _animation;
  late Animation<double> _drawerAnimation;
  bool _isDrawerOpened = false;

  bool get isDrawerOpen => _animationDrawerController.isCompleted;

  AnimationController? get animationController => _animationDrawerController;

  Future<void> toggle() async {
    _animationDrawerController.isCompleted
        ? _animationDrawerController.reverse()
        : _animationDrawerController.forward();
    if (_isDrawerOpened) await Future.delayed(Duration(milliseconds: 300));
    setState(() {
      _isDrawerOpened = !_isDrawerOpened;
    });
  }

  void openSlider() {
    _animationDrawerController.forward();
    setState(() {
      _isDrawerOpened = true;
    });
  }

  Future<void> closeSlider() async {
    _animationDrawerController.reverse();
    await Future.delayed(Duration(milliseconds: 300));
    setState(() {
      _isDrawerOpened = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _animationDrawerController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _drawerAnimation = Tween<double>(
      begin: widget.screenSize.width,
      end: widget.screenSize.width - sliderOpenSize,
    ).animate(
      CurvedAnimation(
        parent: _animationDrawerController,
        curve: Curves.decelerate,
        reverseCurve: Curves.decelerate,
      ),
    );
    _animation = Tween<double>(
      begin: 0,
      // begin: widget.sliderCloseSize,
      // end: widget.sliderOpenSize,
      end: (sliderOpenSize),
    ).animate(
      CurvedAnimation(
        parent: _animationDrawerController,
        curve: Curves.decelerate,
        reverseCurve: Curves.decelerate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _animationDrawerController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_drawerAnimation.value, 0),
              child: SizedBox(
                height: widget.screenSize.height,
                child: SliderBar(
                  slideDirection: widget.slideDirection,
                  sliderMenu: MobileSlideMenu(onCloseTap: closeSlider),
                  sliderMenuOpenSize: widget.sliderOpenSize,
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _animationDrawerController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(-_animation.value, 0),
              child: Stack(
                children: [
                  child!,
                  if (_isDrawerOpened)
                    Container(
                      color: Cr.darkBlue5.withAlpha(230),
                    )
                ],
              ),
            );
          },
          child: Column(
            children: <Widget>[
              ProfileMobileAppbar(
                onMenuTap: () => toggle(),
                onSearch: (onSearch) {},
              ),
              Expanded(child: widget.child),
            ],
          ),
        ),
      ],
    );
  }

  // AnimatedBuilder(
  //       animation: _animationDrawerController,
  //       builder: (_, child) {
  //         return Transform.translate(
  //           offset: getOffsetValues(
  //             widget.slideDirection,
  //             _animation.value,
  //           ),
  //           child: child!,
  //         );
  //       },
  //       child: Column(
  //         children: <Widget>[
  //           ProfileMobileAppbar(
  //             onMenuTap: () => toggle(),
  //             onSearch: (onSearch) {},
  //           ),
  //           Expanded(child: widget.child),
  //         ],
  //       ),
  //     ),

  @override
  void dispose() {
    super.dispose();
    _animationDrawerController.dispose();
  }

  void openOrClose() {
    if (_percent > 0.3) {
      openSlider();
    } else {
      closeSlider();
    }
  }
}

class _Shadow extends StatelessWidget {
  const _Shadow({
    Key? key,
    required AnimationController? animationDrawerController,
    required this.animation,
    required this.sliderShadow,
    required this.slideDirection,
    required this.sliderOpenSize,
  })  : _animationDrawerController = animationDrawerController,
        super(key: key);

  final AnimationController? _animationDrawerController;
  final Animation<double> animation;
  final SliderShadow sliderShadow;
  final SlideDirection slideDirection;
  final double sliderOpenSize;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationDrawerController!,
      builder: (_, child) {
        return Transform.translate(
          offset: getOffsetValueForShadow(
            slideDirection,
            animation.value,
            sliderOpenSize,
          ),
          child: child,
        );
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: sliderShadow.shadowColor,
              blurRadius: sliderShadow.shadowBlurRadius,
              // soften the shadow
              spreadRadius: sliderShadow.shadowSpreadRadius,
              //extend the shadow
              offset: const Offset(
                15.0, // Move to right 15  horizontally
                15.0, // Move to bottom 15 Vertically
              ),
            )
          ],
        ),
      ),
    );
  }
}
