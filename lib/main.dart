import 'package:flutter/material.dart';
import 'package:holedo/screens/profile-pages/home-pages/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
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
