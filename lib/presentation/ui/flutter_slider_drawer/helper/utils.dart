import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/flutter_slider_drawer/slider_direction.dart';

class Utils {
  ///
  /// This method get Offset base on [sliderOpen] type
  ///
  static Offset getOffsetValues(SlideDirection direction, double value) {
    switch (direction) {
      case SlideDirection.LEFT_TO_RIGHT:
        return Offset(value, 0);
      case SlideDirection.RIGHT_TO_LEFT:
        return Offset(-value, 0);
      case SlideDirection.TOP_TO_BOTTOM:
        return Offset(0, value);
      default:
        return Offset(value, 0);
    }
  }

  static Offset getOffsetValueForShadow(
      SlideDirection direction, double value, double slideOpenWidth) {
    switch (direction) {
      case SlideDirection.LEFT_TO_RIGHT:
        return Offset(value - (slideOpenWidth > 50 ? 20 : 10), 0);
      case SlideDirection.RIGHT_TO_LEFT:
        return Offset(-value - 5, 0);
      case SlideDirection.TOP_TO_BOTTOM:
        return Offset(0, value - (slideOpenWidth > 50 ? 15 : 5));
      default:
        return Offset(value - 30.0, 0);
    }
  }
}
