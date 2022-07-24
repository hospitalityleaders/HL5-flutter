import 'package:flutter/material.dart';
import 'package:holedo/profile/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      home: SImpelScreen(),
    );
  }
}

class SImpelScreen extends StatelessWidget {
  const SImpelScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TestingScreen(
        screenSize: Di.getScreenSize(context),
      ),
    );
  }
}

class TestingScreen extends StatefulWidget {
  const TestingScreen({
    Key? key,
    required this.screenSize,
  }) : super(key: key);
  final Size screenSize;
  @override
  State<TestingScreen> createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen>
    with TickerProviderStateMixin {
  final double sliderOpenSize = 265;
  late final AnimationController _animationDrawerController;
  late Animation<double> _animation;
  late Animation<double> _drawerAnimation;
  bool isDrawerOpened = false;
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

  Future<void> toggle() async {
    _animationDrawerController.isCompleted
        ? _animationDrawerController.reverse()
        : _animationDrawerController.forward();
    if (isDrawerOpened) await Future.delayed(Duration(milliseconds: 300));
    setState(() {
      isDrawerOpened = !isDrawerOpened;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cr.accentBlue3,
      body: Column(
        children: [
          SizedBox(
            width: Di.getScreenSize(context).width,
            height: Di.getScreenSize(context).height * .7,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                AnimatedBuilder(
                  animation: _animationDrawerController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(-_animation.value, 0),
                      child: Row(
                        children: [
                          Container(
                            width: widget.screenSize.width,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Cr.green1, Cr.red1])),
                          ),
                          Container(
                            width: sliderOpenSize,
                            color: Cr.accentBlue1,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Di.SBCH(100),
          CustomElevatedButton(
            onPressed: () {
              toggle();
            },
          )
        ],
      ),
    );
  }
}
