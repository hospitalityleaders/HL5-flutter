import 'package:flutter/material.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/components/person_avatar.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileSendConnectionRequestDialog extends StatefulWidget {
  const ProfileSendConnectionRequestDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileSendConnectionRequestDialog> createState() =>
      _ProfileSendConnectionRequestDialogState();
}

class _ProfileSendConnectionRequestDialogState
    extends State<ProfileSendConnectionRequestDialog> {
  final User userProfileData = DbData.getUserProfileData;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cr.whiteColor,
      width: 560,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          DialogTitleWidget(
            title: "Send connection request",
          ),
          Container(
            width: 560,
            padding: EdgeInsets.all(Di.PSL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Send to",
                  style: h5Bold,
                ),
                Di.SBCH(7),
                Container(
                  padding: EdgeInsets.all(Di.PSS),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Cr.darkGrey4,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      PersonAvatar(
                        avatarSize: 26,
                      ),
                      Di.SBCW(8),
                      Text(
                        userProfileData.fullName ?? "",
                        style: h4Bold.copyWith(
                          color: Cr.darkGrey1,
                        ),
                      )
                    ],
                  ),
                ),
                Di.SBHL,
                Text(
                  "Intro message",
                  style: h5Bold,
                ),
                Text(
                  "Send a message along with your connection request.",
                  style: bodySmallRegular.copyWith(
                    color: Cr.darkGrey1,
                  ),
                ),
                Di.SBHES,
                DialogMultiLineTextField(
                  minLines: 9,
                  hintText:
                      "Hey Noberto! Please accept my request to be your connection :-)",
                ),
                Di.SBHL,
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomElevatedButton(
                    text: "Send request",
                    donotShowIcon: true,
                    width: 135,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
