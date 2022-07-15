import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/presentation/ui/pages/components/connection_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_completion_component.dart';
import 'package:holedo/presentation/ui/pages/components/rights_component.dart';
import 'package:holedo/presentation/ui/pages/components/timeline_component.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileOverviewThirdColumn extends StatefulWidget {
  const ProfileOverviewThirdColumn({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);
  final User userProfileData;

  @override
  State<ProfileOverviewThirdColumn> createState() =>
      _ProfileOverviewThirdColumnState();
}

class _ProfileOverviewThirdColumnState
    extends State<ProfileOverviewThirdColumn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: const [
          ProfileCompletionComponent(),
          Di.SBHEL,
          ConnectionsComponent(),
          Di.SBHEL,
          TimelineComponent(),
          Di.SBHL,
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
    final settings = Get.put(HoledoDatabase()).getModel().settings!;
    final script = RegExp(r'<script>([\s\S]*)<\/script');
    print('set2: ${settings.ads.toString()}');
    final profileAd = settings.ads!['profile_right_side'];

    final match = script.firstMatch(profileAd as String);
    final future = FlutterWebviewPlugin().evalJavascript(match![1]!.toString());
    future.then((String? result) {
      print('eval $result');
      // setState(() {
      //_history.add('eval: $result');
      //});
    });
    print('set22: ${future.toString()} ${match[1]!.toString()}');
    return Container(
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
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
