import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/ui/pages/components/connection_component.dart';
import 'package:holedo/profile/presentation/ui/pages/components/profile_completion_component.dart';
import 'package:holedo/profile/presentation/ui/pages/components/rights_component.dart';
import 'package:holedo/profile/presentation/ui/pages/components/timeline_component.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';

class ProfileOverviewThirdColumn extends StatefulWidget {
  const ProfileOverviewThirdColumn({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileOverviewThirdColumn> createState() =>
      _ProfileOverviewThirdColumnState();
}

class _ProfileOverviewThirdColumnState
    extends State<ProfileOverviewThirdColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Provider.of<ProfileProvider>(context).isMyProfile) ...[
          ProfileCompletionComponent(),
          Di.SBHEL,
        ],
        ConnectionsComponent(),
        Di.SBHEL,
        TimelineComponent(),
        Di.SBHL,
        RightsComponent(),
      ],
    );
  }
}

class ProfileAdsComponent extends StatelessWidget {
  const ProfileAdsComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = Get.put(HoledoDatabase()).getModel().settings!;
    final script = RegExp(r'<script>([\s\S]*)<\/script');
    debugPrint('set2: ${settings.ads.toString()}');
    final profileAd = settings.ads!['profile_right_side'];

    // final match = script.firstMatch(profileAd as String);
    //final future = FlutterWebviewPlugin().evalJavascript(match![1]!);
    // future.then((String? result) {
    //  debugPrint('eval $result');
    // setState(() {
    //_history.add('eval: $result');
    //});
    //  });
    //debugPrint('set22: ${future.toString()} ${match[1]!.toString()}');
    return Container(
      width: 365,
      height: 280,
      decoration: boxDecoration.copyWith(color: Cr.whiteColor),
      padding: const EdgeInsets.all(Di.PSD),
      child: Center(
        child: (profileAd != null)
            ? Html(
                data: profileAd,
              )
            : Image.asset(
                "assets/images/profileAdsBanner.png",
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
