import 'package:flutter/material.dart';
import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/components/expanded_collapse_widget.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileMyReferenceDialogWidget extends StatefulWidget {
  const ProfileMyReferenceDialogWidget({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);

  final User userProfileData;

  @override
  State<ProfileMyReferenceDialogWidget> createState() =>
      _ProfileWriteReferenceDialogWidgetState();
}

class _ProfileWriteReferenceDialogWidgetState
    extends State<ProfileMyReferenceDialogWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cr.darkGrey4,
      width: 655,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DialogTitleWidget(
              title: "My reference",
            ),
            Di.SBHL,
            Center(
              child: SizedBox(
                width: 615,
                child: Text(
                  "Select from your references below which ones you would like to display on your profile overview. You can display up to two references to show on your profile overview.",
                  textAlign: TextAlign.center,
                  style: bodyLarge.copyWith(
                    height: 1.375,
                    color: Cr.darkGrey1,
                  ),
                ),
              ),
            ),
            Di.SBHL,
            DialogExpandedTile(isExpanded: true),
            Di.SBHS,
            DialogExpandedTile(),
            Di.SBHD,
          ],
        ),
      ),
    );
  }
}

class DialogExpandedTile extends StatefulWidget {
  final bool isExpanded;
  const DialogExpandedTile({
    Key? key,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<DialogExpandedTile> createState() => _DialogExpandedTileState();
}

class _DialogExpandedTileState extends State<DialogExpandedTile> {
  List<String> newTextField = [""];
  String? selectedValue;
  bool currentlyWorkHere = false;
  bool showMore = true;
  bool checked = false;

  @override
  void initState() {
    showMore = widget.isExpanded;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Cr.lightGrey2,
      margin: EdgeInsets.symmetric(horizontal: Di.PSL),
      width: 615,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                checked = !checked;
              });
            },
            child: Container(
              padding: EdgeInsets.all(Di.PSL),
              height: 90,
              decoration: BoxDecoration(
                color: Cr.whiteColor,
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Cr.grey1,
                  ),
                  Di.SBCW(14),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Ealasiad Wang',
                              style: h4Bold,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 2, left: 8),
                              child: Text(
                                'MHL',
                                style: dividerTextSmall,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Recruiter, Top Talent Recruiters",
                          style: bodySmallRegular.copyWith(
                            color: Cr.darkGrey1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Di.SBCW(14),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Cr.accentBlue3,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: checked
                        ? Icon(
                            Icons.check,
                            color: Cr.accentBlue1,
                            size: 20,
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
          ExpandedCollapseWidget(
            showText: r"  + Show reference",
            hideText: r"  - Hide reference",
            description:
                "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          ),

          // ExpandedSection(
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: Di.PSD),
          //     child: Text(
          //       // singleExperience
          //       //         .description ??
          //       "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          //       maxLines: 5,
          //       overflow: TextOverflow.ellipsis,
          //       style: bodyLarge.copyWith(
          //         color: Cr.darkGrey1,
          //       ),
          //     ),
          //   ),
          //   expand: showMore,
          // ),
          // Container(
          //   height: 40,
          //   width: double.infinity,
          //   color: Cr.lightGrey2,
          //   child: Align(
          //     alignment: Alignment.centerLeft,
          //     child: AnimatedCrossFade(
          //       firstChild: CustomTextButton(
          //         color: Cr.whiteColor,
          //         onPressed: () {
          //           setState(() {
          //             showMore = !showMore;
          //           });
          //         },
          //         textWidget: Text(
          //           "  + Show more",
          //           style: (bodySmallRegular).copyWith(
          //             color: Cr.accentBlue1,
          //           ),
          //         ),
          //       ),
          //       secondChild: CustomTextButton(
          //         color: Cr.whiteColor,
          //         onPressed: () {
          //           setState(() {
          //             showMore = !showMore;
          //           });
          //         },
          //         textWidget: Text(
          //           "  - Close",
          //           style: (bodySmallRegular).copyWith(
          //             color: Cr.accentBlue1,
          //           ),
          //         ),
          //       ),
          //       crossFadeState: showMore
          //           ? CrossFadeState.showSecond
          //           : CrossFadeState.showFirst,
          //       duration: Duration(milliseconds: 200),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _ShowMoreWIdget extends StatelessWidget {
  const _ShowMoreWIdget({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Di.PSL,
        right: Di.PSL,
        top: Di.PSS,
        bottom: 12,
      ),
      child: Text(
        description,
        overflow: TextOverflow.fade,
        style: bodyLarge.copyWith(
          color: Cr.darkGrey1,
        ),
      ),
    );
  }
}
