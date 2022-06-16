import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/pages/components/connection_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_completion_component.dart';
import 'package:holedo/presentation/ui/pages/components/rights_component.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileOverviewThirdColumn extends StatelessWidget {
  const ProfileOverviewThirdColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Column(
        children: [
          ProfileCompletionComponent(),
          Di.SBHEL,
          ConnectionsComponent(),
          Di.SBHEL,
          ProfileAdsComponent(),
          // Di.SBHS,
          RightsComponent(),
        ],
      ),
    );
  }
}

class ProfileAdsComponent extends StatelessWidget {
  const ProfileAdsComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      padding: const EdgeInsets.all(Di.PSD),
      child: Center(
        child: Image.asset(
          "assets/images/profileAdsBanner.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
