import 'package:flutter/material.dart';

Size getTextSize(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  );
  return textPainter.size;
}
