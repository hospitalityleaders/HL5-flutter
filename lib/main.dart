import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holedo/controller/menu_controller.dart';
import 'package:holedo/routes/routes.dart';
import 'package:seo_renderer/helpers/renderer_state.dart';
import 'package:seo_renderer/helpers/robot_detector_vm.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    Flurorouter.setupRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RobotDetector(
      child: GetMaterialApp(
        title: 'Holedo',
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/Home',
        onGenerateRoute: Flurorouter.router.generator,
        navigatorObservers: [seoRouteObserver],
      ),
    );
  }

  MenuController _menuController = Get.put(MenuController());
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
      };
}
