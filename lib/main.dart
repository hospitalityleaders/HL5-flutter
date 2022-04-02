import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:holedo/screens/news/NewsSingle/jobs_no_jobs.dart';
import 'package:holedo/screens/news/NewsSingle/news_single_logged_in.dart';
import 'package:holedo/screens/news/categories/news_signal.dart';
import 'package:holedo/screens/news/update/update_news.dart';
import 'package:holedo/screens/profile-pages/home-pages/home.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:seo_renderer/helpers/renderer_state.dart';
import 'package:seo_renderer/helpers/robot_detector_vm.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
      };
}

void main() {
  runApp(
    RobotDetector(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: double.infinity,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.resize(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.resize(2460, name: '4K'),
          ],
          // background: Container(color: Colors.white)
        ),
        initialRoute: '/',
        routes: {
          // 'timeline': (context) => const Timeline(),
          // 'references': (context) => const References(),
          Home.route: (context) => Home(),
          UpdateNews.route: (context) => UpdateNews(),
          NewsSingleScreen.route: (context) => NewsSingleScreen(),
          NewsSingleLoggedInScreen.route: (context) =>
              NewsSingleLoggedInScreen(),
        },
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(),
        navigatorObservers: [seoRouteObserver],
        home: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: UpdateNews(),
    );
  }
}
