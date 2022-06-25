import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(.7),
      child: const SpinKitChasingDots(
        color: Color(0xffFB8500),
        size: 50.0,
      ),
    );
  }
}
