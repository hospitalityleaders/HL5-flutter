import 'package:flutter/material.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
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
      height: 340,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 46,
            decoration: BoxDecoration(
              color: Cr.whiteColor,
              boxShadow: Styles.defaultBoxShadow,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile summary",
                      style: h2Regular,
                    ),
                    GestureDetector(
                      onTap: () => Nav.pop(context),
                      child: Icon(
                        Icons.close,
                        size: 24,
                        color: Cr.accentBlue1,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Cr.whiteColor,
              padding: EdgeInsets.all(Di.PSL),
              margin: EdgeInsets.all(Di.PSL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Summary",
                    style: h5Bold,
                  ),
                  Di.SBHES,
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Cr.darkGrey4,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    height: 136,
                    child: TextFormField(
                      controller: _profileSummaryController,
                      maxLines: null,
                      minLines: null,
                      keyboardType: TextInputType.multiline,
                      expands: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 54,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 35,
                        child: Row(
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
                                await new User(
                                  profileSummary:
                                      _profileSummaryController.text,
                                ).save(widget.userProfileData);
                                Nav.pop(context);
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
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
