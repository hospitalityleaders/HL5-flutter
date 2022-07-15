import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/components/contact_card_dialog_widget.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/components/custom_outlined_button.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_send_connection_request_dialog.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/profile_write_referenece_dialog.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/show_custom_dialog.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ContactCardMenuCommon extends StatelessWidget {
  const ContactCardMenuCommon({
    Key? key,
    this.isMobile = false,
    this.onPressed,
  }) : super(key: key);
  final bool isMobile;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMobile ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
      children: [
        CustomOutlinedButton(
          onPressed: () {
            showCustomDialog(
              context,
              const ContactCardDialogWidget(),
            );
          },
          text: "Contact card",
          icon: SvgPicture.asset(
            "assets/svgicons/card-account-phone.svg",
            height: 12,
            color: Cr.darkGrey1,
          ),
        ),
        if (isMobile) Di.SBWS else Di.ESB,
        CustomOutlinedButton(
          onPressed: onPressed ??
              () {
                // ProfileCardSubMenu
              },
          icon: const Icon(
            Icons.menu,
            size: 12,
            color: Cr.darkGrey1,
          ),
          textWidget: const Icon(
            Icons.arrow_drop_down_outlined,
            size: 12,
            color: Cr.darkGrey1,
          ),
        ),
      ],
    );
  }
}

class SendConnectionRequestButton extends StatelessWidget {
  const SendConnectionRequestButton({
    Key? key,
    this.width,
  }) : super(key: key);
  final double? width;
  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        showCustomDialog(
          context,
          const ProfileSendConnectionRequestDialog(),
        );
      },
      width: width ?? 285,
      height: 55,
      text: "SEND CONNECTION REQUEST",
      icon: const Icon(
        Icons.person_add,
        color: Cr.whiteColor,
      ),
    );
  }
}

class ProfileCardSubMenu extends StatelessWidget {
  const ProfileCardSubMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        SizedBox(
          child: ProfileCardListTile(
            // removePadding: true,
            iconData: Icons.email,
            text: 'Share profile',
          ),
        ),
        ProfileCardListTile(
          // removePadding: true,
          iconData: Icons.close,
          text: 'Cancel connecttion',
        ),
      ],
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
  final User userProfileData;

// membership_grade_leader_points

  @override
  Widget build(BuildContext context) {
    final int membershipGradeLeaderPoints =
        userProfileData.membershipGradeLeaderPoints ?? 0;

    final statsTextStyle = isMobile
        ? bodyExtraSmall.copyWith(
            color: Cr.grey1,
          )
        : dividerTextSmall.copyWith(
            color: Cr.grey1,
          );

    return SizedBox(
      height: 55,
      width: isMobile ? 400 : 470,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                userProfileData.approvedConnections != null
                    ? userProfileData.approvedConnections!.length.toString() +
                        (userProfileData.approvedConnections!.length > 250
                            ? "+"
                            : "")
                    : "0",
                style: h2Regular.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
              Text(
                "CONNECTIONS",
                style: statsTextStyle,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                membershipGradeLeaderPoints >= 1000
                    ? "${membershipGradeLeaderPoints / 1000}K"
                    : membershipGradeLeaderPoints.toString(),
                style: h2Regular.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
              Text(
                "Leader Points".toUpperCase(),
                style: statsTextStyle,
              ),
            ],
          ),
          if (isMobile) Di.ESB else Image.asset("assets/images/badge.png"),
          Column(
            children: [
              Text(
                userProfileData.receivedReferences != null
                    ? userProfileData.receivedReferences!.length.toString()
                    : "",
                style: h2Regular.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
              Text(
                "REFERENCES",
                style: statsTextStyle,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                userProfileData.recommendations != null
                    ? userProfileData.recommendations!.length.toString()
                    : "0",
                style: h2Regular.copyWith(
                  color: Cr.accentBlue1,
                ),
              ),
              Text(
                "RECOMMENDATIONS",
                style: statsTextStyle,
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
    this.width,
    this.isMobile = false,
  }) : super(key: key);
  final User userProfileData;
  final double? width;
  final bool isMobile;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isMobile ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
      children: [
        CustomElevatedButton(
          onPressed: () {
            showCustomDialog(
              context,
              const ProfileWriteReferenceDialog(),
            );
          },
          width: width ?? 140,
          height: 35,
          backgroundColor: Cr.accentBlue3,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
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
          onPressed: () {},
          width: width ?? 140,
          height: 35,
          backgroundColor: Cr.accentBlue3,
          borderColor: Cr.accentBlue2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
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
        ),
      ],
    );
  }
}
