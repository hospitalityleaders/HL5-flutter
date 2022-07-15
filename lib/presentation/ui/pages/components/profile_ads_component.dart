import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileAdsComponent extends StatelessWidget {
  const ProfileAdsComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration.copyWith(color: Cr.whiteColor),
      padding: const EdgeInsets.all(Di.PSD),
      child: Column(
        children: [
          const Text('test'),
          Image.asset(
            "assets/images/profileAdsBanner.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
