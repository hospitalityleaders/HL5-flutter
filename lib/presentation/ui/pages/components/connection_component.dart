import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/text_with_background.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ConnectionsComponent extends StatelessWidget {
  const ConnectionsComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Di.SBHETS,
          ListTile(
            title: Text(
              "Connections",
              style: h2Regular,
            ),
          ),
          Divider(
            thickness: 1,
            height: 0,
          ),
          Di.SBHS,
          Center(
            child: Container(
              height: 100,
              width: 324,
              color: Cr.greyColor,
              child: Image.asset(
                "assets/images/profileConnectionBanner.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Di.SBHD,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
            child: Text(
              "You and Noberto have 25 shared connections.",
              style: bodySmallRegular.copyWith(color: Cr.darkGrey1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
            child: Text(
              "View mutual connections",
              style: bodySmallRegular.copyWith(color: Cr.accentBlue1),
            ),
          ),
          Di.DD,
          Di.SBHS,
          Center(
            child: SizedBox(
              width: 320,
              height: 35,
              child: TextWithBackground(
                text: "Grow your network",
                iconData: Icons.person_add,
                backgroundColor: Cr.accentBlue3,
              ),
            ),
          ),
          Di.SBHD,
        ],
      ),
    );
  }
}
