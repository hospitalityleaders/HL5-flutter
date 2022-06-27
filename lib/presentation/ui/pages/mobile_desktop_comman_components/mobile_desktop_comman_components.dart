import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/pages/components/profile_image_banner.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_write_reference_dialog_widget.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/show_custom_dialog.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ContactCardMenuCommon extends StatelessWidget {
  const ContactCardMenuCommon({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMobile ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
      children: [
        CustomOutlinedButton(
          text: "Contact card",
          icon: SvgPicture.asset(
            "assets/svgicons/card-account-phone.svg",
            height: 12,
            color: Cr.darkGrey1,
          ),
        ),
        isMobile ? Di.SBWS : Di.ESB,
        CustomOutlinedButton(
          icon: Icon(
            Icons.menu,
            size: 12,
            color: Cr.darkGrey1,
          ),
          textWidget: Icon(
            Icons.arrow_drop_down_outlined,
            size: 12,
            color: Cr.darkGrey1,
          ),
        ),
      ],
    );
  }
}

class SendConnectionRequestComman extends StatelessWidget {
  const SendConnectionRequestComman({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      width: 285,
      height: 55,
      text: "SEND CONNECTION REQUEST",
      icon: Icon(
        Icons.person_add,
      ),
    );
  }
}

class StatsComman extends StatelessWidget {
  const StatsComman({
    Key? key,
    this.isMobile = false,
    required this.userProfileData,
  }) : super(key: key);

  final bool isMobile;
  final User? userProfileData;

// membership_grade_leader_points

  @override
  Widget build(BuildContext context) {
    final int membershipGradeLeaderPoints =
        userProfileData?.membershipGradeLeaderPoints ?? 0;
    return SizedBox(
      height: 55,
      width: isMobile ? 400 : 470,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "250+",
                style: h2Regular.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
              Text(
                "CONNECTIONS",
                style: dividerTextSmall.copyWith(
                  color: Cr.grey1,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                membershipGradeLeaderPoints >= 1000
                    ? (membershipGradeLeaderPoints / 1000).toString() + "K"
                    : membershipGradeLeaderPoints.toString(),
                style: h2Regular.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
              Text(
                "Leader Points".toUpperCase(),
                style: dividerTextSmall.copyWith(
                  color: Cr.grey1,
                ),
              ),
            ],
          ),
          isMobile ? Di.ESB : Image.asset("assets/images/badge.png"),
          Column(
            children: [
              Text(
                "3",
                style: h2Regular.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
              Text(
                "REFERENCES",
                style: dividerTextSmall.copyWith(
                  color: Cr.grey1,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "312",
                style: h2Regular.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
              Text(
                "RECOMMENDATIONS",
                style: dividerTextSmall.copyWith(
                  color: Cr.grey1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WriteReferenceRecommandButtonComman extends StatelessWidget {
  const WriteReferenceRecommandButtonComman({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);
  final User userProfileData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomElevatedButton(
          onPressed: () {
            showCustomDialog(
              context,
              ProfileWriteReferenceDialogWidget(
                userProfileData: userProfileData,
              ),
            );
          },
          width: 140,
          height: 35,
          backgroundColor: Cr.accentBlue3,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check,
                color: Cr.accentBlue1,
                size: 12,
              ),
              Di.SBWES,
              Text(
                "Write reference",
                style: bodySmallRegular.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
            ],
          ),
        ),
        Di.SBWES,
        CustomElevatedButton(
          width: 140,
          height: 35,
          backgroundColor: Cr.accentBlue3,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // thumb-up.svg.    "assets/svgicons/thumb-up.svg",
              SvgPicture.asset(
                "assets/svgicons/thumb-up.svg",
                color: Cr.accentBlue1,
                width: 12,
              ),

              Di.SBWES,
              Text(
                "Recommend",
                style: bodySmallRegular.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
            ],
          ),
          borderColor: Cr.accentBlue2,
        ),
      ],
    );
  }
}
