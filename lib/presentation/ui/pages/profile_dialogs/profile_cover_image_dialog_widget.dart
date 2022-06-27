import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';

class ProfileCoverImageDialogWidget extends StatefulWidget {
  const ProfileCoverImageDialogWidget({
    Key? key,
    required this.userProfileData,
  }) : super(key: key);

  final User userProfileData;

  @override
  State<ProfileCoverImageDialogWidget> createState() =>
      _ProfileWriteReferenceDialogWidgetState();
}

class _ProfileWriteReferenceDialogWidgetState
    extends State<ProfileCoverImageDialogWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 200),
      child: Center(
        child: SingleChildScrollView(
          // behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: Container(
            color: Cr.darkGrey4,
            width: 655,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DialogTitleWidget(
                  title: "Cover image",
                ),
                Di.SBHL,
                ProfileCoverImageDialogExpandedTile(isExpanded: true),
                Di.SBHD,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileCoverImageDialogExpandedTile extends StatefulWidget {
  final bool isExpanded;
  const ProfileCoverImageDialogExpandedTile({
    Key? key,
    this.isExpanded = false,
  }) : super(key: key);

  @override
  State<ProfileCoverImageDialogExpandedTile> createState() =>
      _ProfileCoverImageDialogExpandedTileState();
}

class _ProfileCoverImageDialogExpandedTileState
    extends State<ProfileCoverImageDialogExpandedTile> {
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
              'Cover image',
              style: h4Bold,
            ),
            Text(
              "Your cover image will be used on your profile.",
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
              Icons.camera_alt,
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
                height: 240,
                child: Image.network(
                  "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2744&q=80",
                  fit: BoxFit.cover,
                ),
              ),
              Di.SBHL,
              Container(
                height: 55,
                color: Cr.accentBlue1,
                margin: EdgeInsets.symmetric(
                  horizontal: Di.PSL,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Di.PSL,
                  vertical: Di.PSS,
                ),
                child: Text(
                  "Upload an image from your computer in either JPG, GIF or PNG format. Maximum file size can not exceed 8MB. Make sure your cover image looks good on Hospitality Leaders? Upload a photo that's at least 1280px in width and 640 in height.",
                  style: bodySmallRegular.copyWith(
                    color: Cr.darkGrey1,
                  ),
                ),
              ),
              Di.SBHS,
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Di.PSL,
                ),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Cr.red1,
                        size: 12,
                      ),
                      Di.SBCW(3),
                      Text(
                        "Hide reference",
                        style: bodySmallRegular.copyWith(
                          color: Cr.red1,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
