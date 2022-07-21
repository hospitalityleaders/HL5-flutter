import 'package:flutter/material.dart';

import 'package:holedo/profile/presentation/providers/profile_provider.dart';
import 'package:holedo/profile/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/profile/presentation/ui/components/person_avatar.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/responsive.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';
import 'package:provider/provider.dart';

class ProfileTabbar extends StatelessWidget {
  const ProfileTabbar({
    Key? key,
    required this.tabController,
    this.isMine = false,
    this.onTap,
  }) : super(key: key);

  final TabController tabController;
  final bool isMine;
  final void Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    // final isEditable = Provider.of<ProfileProvider>(context).isProfileEditable;
    final getUserProfileData =
        // Provider.of<ProfileProvider>(context)
        Provider.of<ProfileProvider>(context).userProfileData!;
    final bool isTab = isTablet(context);
    final double fontSize = isTab ? 12.5 : 14;

    final EdgeInsets tabPadding = isTab
        ? const EdgeInsets.symmetric(vertical: 10)
        : const EdgeInsets.all(10);
    return Container(
      decoration: BoxDecoration(
        color: Cr.whiteColor,
        boxShadow: defaultBoxShadow,
      ),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              PersonAvatar(avatarSize: isTab ? 24 : null),
              if (isTab) Di.SBWS else Di.SBWD,
              Text(
                getUserProfileData.fullName ?? "",
                // "Noberto Holden",
                style: h4Bold,
                // de
              ),
              // Di.SBWS,
              // Text(
              //   getUserProfileData.currentMembershipGrade?.title ?? "",
              //   // "MHL",
              //   style: dividerTextSmall,
              //   // de
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                TabBar(
                  onTap: onTap,
                  labelColor: Cr.accentBlue1,
                  unselectedLabelColor: Cr.darkGrey2,
                  indicatorColor: Cr.accentBlue1,
                  indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
                  controller: tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  isScrollable: true,
                  tabs: [
                    Padding(
                      padding: tabPadding,
                      child: Text(
                        'Profile overview',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SourceSansPro',
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                    Padding(
                      padding: tabPadding,
                      child: Text(
                        'Timeline',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SourceSansPro',
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                    Padding(
                      padding: tabPadding,
                      child: Text(
                        'Articles',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SourceSansPro',
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                    Padding(
                      padding: tabPadding,
                      child: Text(
                        'Activity',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SourceSansPro',
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                    Padding(
                      padding: tabPadding,
                      child: Text(
                        'References',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'SourceSansPro',
                          fontSize: fontSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isMine) const EditProfileButton() else Di.ESB,
        ],
      ),
    );
  }
}

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    Key? key,
    this.width,
  }) : super(key: key);

  final double? width;

  @override
  Widget build(BuildContext context) {
    final isProfileEditable =
        // Provider.of<ProfileProvider>(context).
        Provider.of<ProfileProvider>(context).isProfileEditable;
    return CustomElevatedButton(
      width: width,
      text: isProfileEditable ? "Done Editing" : null,
      backgroundColor: isProfileEditable ? Cr.green1 : null,
      icon: isProfileEditable
          ? const Icon(
              Icons.check,
              size: Di.FSD,
            )
          : null,
      onPressed: () {
        Provider.of<ProfileProvider>(context, listen: false)
            // ref
            // .read(profileNotifierProvider.notifier)
            .changeIsProfieEditableState(!isProfileEditable);
      },
    );
  }
}
