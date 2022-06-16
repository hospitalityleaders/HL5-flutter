import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:holedo/presentation/ui/pages/components/connection_component.dart';
import 'package:holedo/presentation/ui/pages/components/profile_completion_component.dart';
import 'package:holedo/presentation/ui/pages/components/rights_component.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/ui/components/container_with_icon.dart';

class TimelineSection extends StatelessWidget {
  const TimelineSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Di.getScreenSize(context).width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Di.SBHOTL,
          Container(
            width: 550,
            color: Cr.whiteColor,
            padding: EdgeInsets.all(Di.PSD),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ContainerWithIcon(
                            iconData: FontAwesomeIcons.buildingColumns,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Di.SBHEL,
              ],
            ),
          ),
          Di.SBWEL,
          SizedBox(
            width: 360,
            child: Column(
              children: [
                ProfileCompletionComponent(),
                Di.SBHEL,
                ConnectionsComponent(),
                RightsComponent(),
              ],
            ),
          ),
          Di.SBWEL,
        ],
      ),
    );
  }
}
