import 'package:flutter/material.dart';
import 'package:holedo/presentation/utill/dimensions.dart';

class ProfileImageBanner extends StatelessWidget {
  const ProfileImageBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Di.getScreenSize(context).width,
      height: 490,
      child: Image.asset(
        "assets/images/t6.png",
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
