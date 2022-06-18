import 'package:flutter/material.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';
import 'package:holedo/presentation/ui/components/custom_checkbox_with_title.dart';
import 'package:holedo/presentation/ui/components/edit_icon_buttton.dart';
import 'package:holedo/presentation/ui/components/text_with_background.dart';
import 'package:holedo/presentation/ui/pages/components/profile_reference_component.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:provider/provider.dart';

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
          Di.SBHETS,
          AreasOfExpertiseComponents(),
          Di.SBHETS,
          ProfileReferenceComponent(),
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
      padding: EdgeInsets.symmetric(horizontal: Di.PSD),
      decoration: Styles.boxDecoration.copyWith(color: Cr.whiteColor),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Areas of expertise",
              style: h2Regular,
            ),
          ),

          Stack(
            children: [
              Column(
                children: [
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
                ],
              ),
              Provider.of<ProfileProvider>(context).isProfileEditable
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 560,
                            height: 174,
                            color: Cr.accentBlue2.withOpacity(.8),
                            padding: EdgeInsets.all(Di.PSD),
                          ),
                        ],
                      ),
                    )
                  : Di.ESB,
              Provider.of<ProfileProvider>(context).isProfileEditable
                  ? EditIconButton(onPressed: () {})
                  : Di.ESB,
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
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Di.PSD),
      decoration: Styles.boxDecoration.copyWith(
        color: Cr.whiteColor,
        // gradient: LinearGradient(
        //   colors: [
        //     Cr.transparent,
        //     Cr.whiteColor,
        //   ],
        // ),
      ),
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
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Di.PSD),
                child: Text(
                  """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
\n\nNemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.""",
                  maxLines: isMobile ? 6 : null,
                  style: bodyLarge.copyWith(color: Cr.darkGrey1),
                ),
              ),
              Provider.of<ProfileProvider>(context).isProfileEditable
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 50),
                          Container(
                            width: 560,
                            height: 385,
                            color: Cr.accentBlue2.withOpacity(.8),
                            padding: EdgeInsets.all(Di.PSD),
                          ),
                        ],
                      ),
                    )
                  : Di.ESB,
              Provider.of<ProfileProvider>(context).isProfileEditable
                  ? EditIconButton(onPressed: () {})
                  : Di.ESB,
            ],
          ),
          Di.SBHD,
          Divider(
            thickness: .7,
            color: Cr.darkGrey2,
            height: 0,
          ),
        ],
      ),
    );
  }
}
