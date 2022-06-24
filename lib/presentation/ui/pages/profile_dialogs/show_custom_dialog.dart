import 'package:flutter/material.dart';

Future<dynamic> showCustomDialog(BuildContext context, Widget child) {
  return showDialog(
    builder: (context) {
      return Dialog(
        child: child,
      );
    },
    context: context,
  );
}
