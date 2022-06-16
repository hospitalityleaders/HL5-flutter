import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/custom_checkbox_with_title.dart';
import 'package:holedo/presentation/ui/components/text_with_background.dart';
import 'package:holedo/presentation/ui/pages/components/profile_reference_component.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileOverviewFirstColumn extends StatelessWidget {
  const ProfileOverviewFirstColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileSummaryComponent(),
          Di.SBHEL,
          ProfileReferenceComponent(),
          Di.SBHEL,
          AreasOfExpertiseComponents(),
        ],
      ),
    );
  }
}

class AreasOfExpertiseComponents extends StatelessWidget {
  const AreasOfExpertiseComponents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Areas of expertise",
              style: h2Regular,
            ),
          ),
          Divider(
            thickness: .7,
            color: Cr.darkGrey2,
          ),
          Row(
            children: [
              Di.SBWS,
              CustomCheckboxWithTitle(title: "Business management"),
              Di.SBWS,
              CustomCheckboxWithTitle(title: "Leadership"),
            ],
          ),

          Row(
            children: [
              Di.SBWS,
              CustomCheckboxWithTitle(title: "Leadership"),
              Di.SBWS,
              CustomCheckboxWithTitle(title: "Growth Hacking"),
              Di.SBWS,
              CustomCheckboxWithTitle(title: "Finance"),
            ],
          ),
          Row(
            children: [
              Di.SBWD,
              CustomCheckboxWithTitle(title: "Business management"),
              Di.SBWS,
              CustomCheckboxWithTitle(title: "Leadership"),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Di.SBWS,
              CustomCheckboxWithTitle(title: "Finance"),
              Di.SBWS,
              CustomCheckboxWithTitle(title: "Acquisitions"),
              Di.SBWS,
              TextWithBackground(
                text: " + Show all",
                textColor: Cr.accentBlue1,
                backgroundColor: Cr.accentBlue3,
              ),
            ],
          ),
          // CustomCheckboxWithTitle(title: "Growth Hacking"),
          // CustomCheckboxWithTitle(title: "Finance"),
          // CustomCheckboxWithTitle(title: "Acquisitions"),
          // CustomCheckboxWithTitle(title: "Recruitment"),
          // CustomCheckboxWithTitle(title: "Hotel groups"),
          // CustomCheckboxWithTitle(title: "Consulting"),
          // CustomCheckboxWithTitle(title: "Public speaking"),

          // Training

          Di.SBHD,
        ],
      ),
    );
  }
}

class ProfileSummaryComponent extends StatelessWidget {
  const ProfileSummaryComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Di.PSD),
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Profile summary",
              style: h2Regular,
            ),
          ),

          // Di.SBHD,
          Divider(thickness: 1),
          Di.SBHD,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Di.PSD),
            child: Text(
              """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
\n\nNemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.""",
              style: bodyLarge.copyWith(color: Cr.darkGrey1),
            ),
          ),
          Di.SBHD,
        ],
      ),
    );
  }
}
