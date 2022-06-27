import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/nav.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileFeaturedVideoDialogWidget extends StatefulWidget {
  const ProfileFeaturedVideoDialogWidget({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);

  final User userProfileData;

  @override
  State<ProfileFeaturedVideoDialogWidget> createState() =>
      _ProfileWriteReferenceDialogWidgetState();
}

class _ProfileWriteReferenceDialogWidgetState
    extends State<ProfileFeaturedVideoDialogWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Cr.darkGrey4,
        width: 655,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DialogTitleWidget(
              title: "Featured video",
            ),
            Di.SBHL,
            CoverDialogExpandedTile(isExpanded: true),
            Di.SBHD,
          ],
        ),
      ),
    );
  }
}

class CoverDialogExpandedTile extends StatefulWidget {
  final bool isExpanded;
  const CoverDialogExpandedTile({
    Key? key,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<CoverDialogExpandedTile> createState() =>
      _CoverDialogExpandedTileState();
}

class _CoverDialogExpandedTileState extends State<CoverDialogExpandedTile> {
  String? selectedValue;
  bool currentlyWorkHere = false;

  late ExpandedTileController expandedTileController;
  @override
  void initState() {
    expandedTileController = ExpandedTileController(
      isExpanded: widget.isExpanded,
    );
    super.initState();
  }

  @override
  void dispose() {
    expandedTileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Di.PSL),
      color: Cr.whiteColor,
      width: 615,
      child: ExpandedTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured video',
              style: h4Bold,
            ),
            Text(
              "Your featured video will be used on your profile.",
              style: bodySmallRegular.copyWith(
                color: Cr.darkGrey1,
              ),
            ),
          ],
        ),
        onTap: () {
          setState(() {
            expandedTileController = expandedTileController.copyWith(
              isExpanded: !expandedTileController.isExpanded,
            );
          });
        },
        leading: Container(
          width: 50,
          height: 50,
          color: Cr.accentBlue1,
          child: Center(
            child: Icon(
              Icons.play_arrow,
              size: 22,
              color: Cr.whiteColor,
            ),
          ),
        ),
        trailingRotation: 0,
        trailing: !(expandedTileController.isExpanded == false)
            ? null
            : CustomMinusIcon(),
        theme: ExpandedTileThemeData(
          contentPadding: EdgeInsets.zero,
          headerPadding: EdgeInsets.all(17),
          headerRadius: 0,
          contentRadius: 0,
        ),
        controller: expandedTileController,
        content: Container(
          color: Cr.whiteColor,
          padding: EdgeInsets.only(
            // left: Di.PSL,
            // right: Di.PSL,
            top: 12,
            bottom: Di.PSD,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 345,
                child: Image.asset(
                  "assets/images/videoThumbnail.png",
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Di.PSL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Di.SBHL,
                    DialogLabelTextFormField(customLabel: "Video link"),
                    Di.SBHES,
                    DialogTextFieldForm(),
                    Di.SBCH(18),
                    DialogLabelTextFormField(customLabel: "Video title"),
                    Di.SBHES,
                    DialogTextFieldForm(),
                    Di.SBCH(18),
                    DialogLabelTextFormField(customLabel: "Video description"),
                    Di.SBHES,
                    DialogMultiLineTextField(
                      width: 575,
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
                            "Add to profile",
                            style: bodySmallRegular.copyWith(
                              color: Cr.whiteColor,
                            ),
                          ),
                          height: 36,
                          donotShowIcon: true,
                          backgroundColor: Cr.accentBlue1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
