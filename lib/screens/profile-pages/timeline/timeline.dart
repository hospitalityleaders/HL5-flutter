import 'package:flutter/material.dart';

class Timeline extends StatefulWidget {

  const Timeline({Key? key}) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: Text('hello'),),);
  }
}
