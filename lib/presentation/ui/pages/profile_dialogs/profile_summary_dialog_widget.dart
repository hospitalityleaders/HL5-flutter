import 'package:flutter/material.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';

import 'package:holedo/presentation/utill/nav.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileSummaryDialogWidget extends StatefulWidget {
  const ProfileSummaryDialogWidget({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);

  final User userProfileData;

  @override
  State<ProfileSummaryDialogWidget> createState() =>
      _ProfileSummaryDialogWidgetState();
}

class _ProfileSummaryDialogWidgetState
    extends State<ProfileSummaryDialogWidget> {
  late final TextEditingController _profileSummaryController;

  @override
  void initState() {
    _profileSummaryController = TextEditingController(
      text: widget.userProfileData.profileSummary,
    );
    super.initState();
  }

  @override
  void dispose() {
    _profileSummaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cr.darkGrey4,
      width: 655,
      child: Column(
        children: [
          DialogTitleWidget(
            title: "Profile summary",
          ),
          Container(
            color: Cr.whiteColor,
            padding: EdgeInsets.all(Di.PSL),
            margin: EdgeInsets.all(Di.PSL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DialogLabelTextFormField(customLabel: "Summary"),
                    Di.SBHES,
                    DialogMultiLineTextField(),
                  ],
                ),
                Di.SBCH(28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomElevatedButton(
                      borderColor: Cr.accentBlue2,
                      makeWidthNull: true,
                      onPressed: () => Nav.pop(context),
                      child: Text(
                        "Cancel",
                        style: bodySmallRegular.copyWith(
                          color: Cr.accentBlue1,
                        ),
                      ),
                      height: 36,
                      donotShowIcon: true,
                      backgroundColor: Cr.accentBlue3,
                    ),
                    Di.SBWES,
                    CustomElevatedButton(
                      borderColor: Cr.accentBlue2,
                      makeWidthNull: true,
                      onPressed: () async {
                        // Nav.pop(context);
                        // await new User(
                        //   profileSummary:
                        //       _profileSummaryController.text,
                        // ).save(widget.userProfileData);
                      },
                      child: Text(
                        "Save",
                        style: bodySmallRegular.copyWith(
                          color: Cr.whiteColor,
                        ),
                      ),
                      height: 36,
                      donotShowIcon: true,
                      backgroundColor: Cr.accentBlue1,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
