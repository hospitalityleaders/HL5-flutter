import 'package:flutter/material.dart';
import 'package:holedo/screens/profile-pages/home-pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}
