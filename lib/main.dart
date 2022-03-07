import 'package:flutter/material.dart';
import 'package:holedo/screens/profile-pages/home-pages/home.dart';
import 'package:holedo/screens/profile-pages/profile-overview/profile-overview.dart';
import 'package:holedo/screens/profile-pages/references/references.dart';
import 'package:holedo/screens/profile-pages/timeline/timeline.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
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
