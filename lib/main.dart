import 'package:flutter/material.dart';
import 'package:holedo/screens/profile-pages/home-pages/home.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false,
      // builder: (context, widget) => ResponsiveWrapper.builder(
      //   BouncingScrollWrapper.builder(context, widget!),
      //
      //   maxWidth: double.infinity,
      //   minWidth: 450,
      //   defaultScale: true,
      //   breakpoints: [
      //     const ResponsiveBreakpoint.resize(450, name: MOBILE),
      //     const ResponsiveBreakpoint.resize(800, name: TABLET),
      //     const ResponsiveBreakpoint.resize(1000, name: TABLET),
      //     const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
      //     const ResponsiveBreakpoint.resize(2460, name: '4K'),
      //   ],
      //   // background: Container(color: Colors.white)
      // ),
      initialRoute: '/',
      routes: const {
        // 'timeline': (context) => const Timeline(),
        // 'references': (context) => const References(),
      },
      theme: ThemeData(),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Home(),
    );
  }
}
