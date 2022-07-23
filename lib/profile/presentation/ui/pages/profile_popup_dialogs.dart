import 'package:flutter/material.dart';
import 'package:holedo/profile/presentation/ui/pages/components/connection_component.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
          child: SizedBox(
            width: 364,
            child: ConnectionsComponent(),
          ),
        ),
      ),
    );
  }
}
