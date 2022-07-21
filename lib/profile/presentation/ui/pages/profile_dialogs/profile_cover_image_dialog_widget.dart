import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

import 'package:holedo/models/holedoapi/holedoapi.dart';
import 'package:holedo/profile/presentation/ui/pages/components/upload_button_widget.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';
import 'package:holedo/profile/presentation/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfileCoverImageDialogWidget extends StatefulWidget {
  const ProfileCoverImageDialogWidget({
    Key? key,
    // required this.userProfileData,
  }) : super(key: key);

  // final User userProfileData;

  @override
  State<ProfileCoverImageDialogWidget> createState() =>
      _ProfileWriteReferenceDialogWidgetState();
}

class _ProfileWriteReferenceDialogWidgetState
    extends State<ProfileCoverImageDialogWidget> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   width: 100,
    //   height: 200,
    // );
    return Container(
      color: Cr.darkGrey4,
      width: 655,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            DialogTitleWidget(
              title: "Cover image",
            ),
            Di.SBHL,
            ProfileCoverImageDialogExpandedTile(isExpanded: true),
            Di.SBHD,
          ],
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
  Image? pickedImage;

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
    final userProfileData =
        Provider.of<ProfileProvider>(context).userProfileData!;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Di.PSL),
      color: Cr.whiteColor,
      width: 615,
      child: ExpandedTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
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
          child: const Center(
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
            : const CustomMinusIcon(),
        theme: const ExpandedTileThemeData(
          contentPadding: EdgeInsets.zero,
          headerPadding: EdgeInsets.all(17),
          headerRadius: 0,
          contentRadius: 0,
        ),
        controller: expandedTileController,
        content: Container(
          color: Cr.whiteColor,
          padding: const EdgeInsets.only(
            // left: Di.PSL,
            // right: Di.PSL,
            top: 12,
            bottom: Di.PSD,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 240,
                child: pickedImage ??
                    Image.network(
                      userProfileData.banner ??
                          "https://images.pexels.com/photos/269077/pexels-photo-269077.jpeg",
                      fit: BoxFit.cover,
                    ),
              ),
              Di.SBHL,
              UploadButtonWidget(
                folder: "banners",
                uploadedImgCallback: (String imgUrl) async {
                  await User(
                    banner: imgUrl,
                  ).save(userProfileData);
                },
                pickedImgCallback: (Image image) {
                  setState(() {
                    pickedImage = image;
                  });
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(
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
                margin: const EdgeInsets.symmetric(
                  horizontal: Di.PSL,
                ),
                child: GestureDetector(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.delete,
                        color: Cr.red1,
                        size: 12,
                      ),
                      Di.SBCW(3),
                      Text(
                        "Delete photo",
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
