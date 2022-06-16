import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/components/custom_list_tile.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProfileCompletionComponent extends StatelessWidget {
  const ProfileCompletionComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Di.PSD),
      decoration: Styles.boxDecoration.copyWith(color: Cr.darkBlue5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "25",
                style: display1.copyWith(
                  color: Cr.whiteColor,
                ),
              ),
              Di.SBWETS,
              Padding(
                padding: const EdgeInsets.only(top: Di.PSES),
                child: Text(
                  "%",
                  style: h2Regular.copyWith(
                    color: Cr.whiteColor,
                    fontSize: Di.FSOL,
                  ),
                ),
              ),
            ],
          ),
          Di.SBHD,
          LinearPercentIndicator(
            lineHeight: 10.0,
            alignment: MainAxisAlignment.center,
            percent: 0.25,
            backgroundColor: Colors.black,
            barRadius: Radius.circular(20),
          ),
          Di.SBHD,
          SizedBox(
            width: 300,
            child: Text(
              "Your profile is only 25% complete. Improve it now. Here’s how.",
              textAlign: TextAlign.center,
              style: h2Regular.copyWith(
                color: Cr.whiteColor,
              ),
            ),
          ),
          Di.SBHD,
          CustomListTile(),
          CustomListTile(),
          CustomListTile(),
          CustomListTile(),
          CustomElevatedButton(
            width: 320,
            text: "Edit my profile",
            donotShowIcon: true,
          ),
          Di.SBHS,
        ],
      ),
    );
  }
}
