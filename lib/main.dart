import 'package:flutter/material.dart';
import 'package:holedo/screens/news/categories/news_signal.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: NewsSingleScreen(),
    );
  }
}
