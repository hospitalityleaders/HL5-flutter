import 'package:flutter/material.dart';

import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/profile/presentation/providers/profile_provider.dart';
import 'package:holedo/profile/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/profile/presentation/ui/components/person_avatar.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    final User userProfileData =
        Provider.of<ProfileProvider>(context).userProfileData!;
    return Container(
      color: Cr.whiteColor,
      width: 560,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const DialogTitleWidget(
            title: "Send connection request",
          ),
          Container(
            width: 560,
            padding: const EdgeInsets.all(Di.PSL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Send to",
                  style: h5Bold,
                ),
                Di.SBCH(7),
                Container(
                  padding: const EdgeInsets.all(Di.PSS),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Cr.darkGrey4,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const PersonAvatar(
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
                const Text(
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
                  hintStyle: bodySmallRegular.copyWith(
                    color: Cr.darkGrey3,
                  ),
                  minLines: 9,
                  hintText:
                      "Hey Noberto! Please accept my request to be your connection :-)",
                ),
                Di.SBHL,
                const Align(
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
