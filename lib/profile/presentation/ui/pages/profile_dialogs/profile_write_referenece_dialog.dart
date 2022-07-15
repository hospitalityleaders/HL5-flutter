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

class ProfileWriteReferenceDialog extends ConsumerStatefulWidget {
  const ProfileWriteReferenceDialog({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ProfileWriteReferenceDialog> createState() =>
      _ProfileWriteReferenceDialogState();
}

class _ProfileWriteReferenceDialogState
    extends ConsumerState<ProfileWriteReferenceDialog> {
  @override
  Widget build(BuildContext context) {
    final User userProfileData =
        ref.watch(profileNotifierProvider).userProfileData!;
    return Container(
      color: Cr.whiteColor,
      width: 950,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const DialogTitleWidget(
            title: "Write a reference",
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 560,
                  padding: const EdgeInsets.all(Di.PSL),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Reference recipient",
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
                        "Reference",
                        style: h5Bold,
                      ),
                      Text(
                        "You can edit or delete your reference after submitting it.",
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
                            "E.g. Noberto is very professional and detailed...",
                      ),
                      Di.SBHL,
                      const Align(
                        alignment: Alignment.centerRight,
                        child: CustomElevatedButton(
                          text: "Submit reference",
                          donotShowIcon: true,
                          width: 135,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Di.PSOL,
                      vertical: 24,
                    ),
                    color: Cr.accentBlue1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "References",
                          style: dividerTextLarge.copyWith(
                            color: Cr.whiteColor,
                          ),
                        ),
                        Text(
                          "What should \nI include in my \nreference",
                          style: display3.copyWith(
                            color: Cr.whiteColor,
                          ),
                        ),
                        Di.SBHOTL,
                        Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Cr.whiteColor,
                              size: 15,
                            ),
                            Di.SBWES,
                            Text(
                              "Your professional relationship",
                              style: h4Bold.copyWith(
                                color: Cr.whiteColor,
                              ),
                            ),
                          ],
                        ),
                        Di.SBHETS,
                        Text(
                          "Briefly explain the professional relationship or background to give the reference context.",
                          style: bodyLarge.copyWith(
                            color: Cr.whiteColor,
                          ),
                        ),
                        Di.SBHL,
                        Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Cr.whiteColor,
                              size: 15,
                            ),
                            Di.SBWES,
                            Text(
                              "An endorsement",
                              style: h4Bold.copyWith(
                                color: Cr.whiteColor,
                              ),
                            ),
                          ],
                        ),
                        Di.SBHETS,
                        Text(
                          "Explain the reason for your recommendation?  What are the person’s skills, attributes and personality traits that you are recommending?",
                          style: bodyLarge.copyWith(
                            color: Cr.whiteColor,
                          ),
                        ),
                        // Spacer(),
                      ],
                    ),
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
