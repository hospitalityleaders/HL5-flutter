import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holedo/controller/menu_controller.dart';
import 'package:holedo/controller/auth_controller.dart';
import 'package:holedo/screens/Authentication/login.dart';
import 'package:holedo/screens/news/NewsSingle/news_single_logged_in.dart';
import 'package:holedo/screens/news/categories/news_signal.dart';
import 'package:holedo/screens/news/update/update_news.dart';
import 'package:holedo/screens/profile-pages/profile/profile-page.dart';

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
void main() async {
  await Get.put(AuthController()).initStorage();
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
          //LogIn.route: (context) => LogIn(),
          // 'timeline': (context) => const Timeline(),
          // 'references': (context) => const References(),
          ProfilePage.route: (context) => ProfilePage(),
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
  MenuController controller = Get.put(MenuController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Get.find<AuthController>().restoreModel().isLogined
          ? UpdateNews()
          : LogIn(),
    );
  }
}
