import 'package:flutter/material.dart';

class References extends StatefulWidget {
  final bool data;
  const References({Key? key, required this.data}) : super(key: key);

  @override
  _ReferencesState createState() => _ReferencesState();
}

class _ReferencesState extends State<References> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: Row(children: [],),);
  }
}
