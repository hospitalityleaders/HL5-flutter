import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:holedo/profile/application//shared/providers.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/profile/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/profile/presentation/ui/components/person_avatar.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';

class ProfileSendConnectionRequestDialog extends ConsumerStatefulWidget {
  const ProfileSendConnectionRequestDialog({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ProfileSendConnectionRequestDialog> createState() =>
      _ProfileSendConnectionRequestDialogState();
}

class _ProfileSendConnectionRequestDialogState
    extends ConsumerState<ProfileSendConnectionRequestDialog> {
  @override
  Widget build(BuildContext context) {
    final User userProfileData =
        ref.watch(profileNotifierProvider).userProfileData!;
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
