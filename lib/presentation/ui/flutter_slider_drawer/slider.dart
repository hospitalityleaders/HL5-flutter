import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/flutter_slider_drawer/helper/slider_shadow.dart';
import 'package:holedo/presentation/ui/flutter_slider_drawer/helper/utils.dart';
import 'package:holedo/presentation/ui/flutter_slider_drawer/mobile_slide_menu.dart';
import 'package:holedo/presentation/ui/flutter_slider_drawer/slider_bar.dart';
import 'package:holedo/presentation/ui/flutter_slider_drawer/slider_direction.dart';
import 'package:holedo/presentation/ui/pages/mobile_view_section/mobile_profile_overview_section.dart';
export 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
export 'package:holedo/layouts/cards/holedo_cards.dart';
export 'package:holedo/layouts/pages/home_page.dart';
export 'package:holedo/layouts/pages/recruitment_page.dart';
export 'package:holedo/layouts/pages/profile_page.dart';
export 'package:holedo/layouts/pages/category_page.dart';
export 'package:holedo/layouts/pages/search_page.dart';
export 'package:holedo/layouts/pages/login_page.dart';
export 'package:holedo/layouts/pages/newsfront_page.dart';
export 'package:holedo/layouts/pages/news_page.dart';
export 'package:holedo/layouts/pages/jobsfront_page.dart';
export 'package:holedo/layouts/pages/jobs_page.dart';

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
  const SliderDrawer(
      {Key? key,
      this.slider,
      required this.child,
      this.animationDuration = 400,
      this.sliderOpenSize = 265,
      this.splashColor = Colors.transparent,
      this.sliderCloseSize = 0,
      this.slideDirection = SlideDirection.RIGHT_TO_LEFT,
      this.sliderShadow,
      this.appBar})
      : super(key: key);

  @override
  SliderDrawerState createState() => SliderDrawerState();
}

class SliderDrawerState extends State<SliderDrawer>
    with TickerProviderStateMixin {
  double _percent = 0.0;

  AnimationController? _animationDrawerController;
  late Animation<double> _animation;

  bool get isDrawerOpen => _animationDrawerController!.isCompleted;

  AnimationController? get animationController => _animationDrawerController;

  void toggle() => _animationDrawerController!.isCompleted
      ? _animationDrawerController!.reverse()
      : _animationDrawerController!.forward();

  void openSlider() => _animationDrawerController!.forward();

  void closeSlider() => _animationDrawerController!.reverse();

  @override
  void initState() {
    super.initState();

    _animationDrawerController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.animationDuration));

    _animation =
        Tween<double>(begin: widget.sliderCloseSize, end: widget.sliderOpenSize)
            .animate(CurvedAnimation(
                parent: _animationDrawerController!,
                curve: Curves.decelerate,
                reverseCurve: Curves.decelerate));
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return Container(
          child: Stack(children: <Widget>[
        SliderBar(
          slideDirection: widget.slideDirection,
          sliderMenu: MobileSlideMenu(onCloseTap: closeSlider),
          sliderMenuOpenSize: widget.sliderOpenSize,
        ),

        if (widget.sliderShadow != null) ...[
          _Shadow(
            animationDrawerController: _animationDrawerController,
            slideDirection: widget.slideDirection,
            sliderOpenSize: widget.sliderOpenSize,
            animation: _animation,
            sliderShadow: widget.sliderShadow!,
          ),
        ],

        //Child
        AnimatedBuilder(
          animation: _animationDrawerController!,
          builder: (_, child) {
            return Transform.translate(
              offset: Utils.getOffsetValues(
                  widget.slideDirection, _animation.value),
              child: child,
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
      ]));
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationDrawerController!.dispose();
  }

  openOrClose() {
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
          offset: Utils.getOffsetValueForShadow(
              slideDirection, animation.value, sliderOpenSize),
          child: child,
        );
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(shape: BoxShape.rectangle, boxShadow: [
          BoxShadow(
            color: sliderShadow.shadowColor,
            blurRadius: sliderShadow.shadowBlurRadius,
            // soften the shadow
            spreadRadius: sliderShadow.shadowSpreadRadius,
            //extend the shadow
            offset: Offset(
              15.0, // Move to right 15  horizontally
              15.0, // Move to bottom 15 Vertically
            ),
          )
        ]),
      ),
    );
  }
}
