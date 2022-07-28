import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cr.blackColorWithOpacity(.7),
      child: const SpinKitChasingDots(
        color: Color(0xffFB8500),
      ),
    );
  }
}
