import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/color_resources.dart';

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
      home: TestingScreen(),
    );
  }
}

class TestingScreen extends StatelessWidget {
  const TestingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Cr.green1,
        child: Center(
            // child: Container(
            //   width: 299,
            //   height: 300,
            //   color: Cr.whiteColor,
            // ),
            ),
      ),
    );
  }
}
