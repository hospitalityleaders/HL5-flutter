import 'package:flutter/material.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/presentation/functions/image_upload_functions.dart';
import 'package:holedo/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/presentation/ui/pages/profile_dialogs/dialog_widgets.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/nav.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:routemaster/routemaster.dart';

class UploadButtonWidget extends StatefulWidget {
  const UploadButtonWidget({
    Key? key,
    required this.uploadedImgCallback,
    required this.pickedImgCallback,
    required this.folder,
    this.padding,
    this.margin,
    this.setErrorMessage,
  }) : super(key: key);

  final Future<void> Function(String imgUrl) uploadedImgCallback;
  final void Function(Image imgXFile) pickedImgCallback;
  final String folder;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String? setErrorMessage;

  @override
  State<UploadButtonWidget> createState() => _UploadButtonWidgetState();
}

class _UploadButtonWidgetState extends State<UploadButtonWidget> {
  XFile? image;
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Cr.darkGrey4,
          width: 1,
        ),
      ),
      margin: widget.margin ??
          EdgeInsets.symmetric(
            horizontal: Di.PSL,
          ),
      padding: widget.padding ??
          EdgeInsets.symmetric(
            horizontal: Di.PSS,
            vertical: Di.PSS,
          ),
      child: Row(
        children: [
          InkWell(
            onTap: () async {
              final XFile? imgXFile =
                  await ImageUploadFunctions.pickImageFromGallery();
              if (imgXFile != null) {
                setState(() {
                  image = imgXFile;
                  errorMessage = "";
                });
                widget.pickedImgCallback(
                  await ImageUploadFunctions.convertXfileToImage(imgXFile),
                );
              }
            },
            child: Container(
              width: 80,
              height: 20,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2, 2),
                      blurRadius: 2,
                      color: Color.fromARGB(13, 0, 0, 0),
                    )
                  ],
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    width: 1,
                    color: Cr.darkGrey4,
                  )),
              child: Center(
                child: Text(
                  "Choose file",
                  style: bodySmallRegular.copyWith(
                    height: 0,
                  ),
                ),
              ),
            ),
          ),
          Di.SBWS,
          Expanded(
            child: Text(
              widget.setErrorMessage != null
                  ? widget.setErrorMessage!
                  : (image == null ? errorMessage : image!.name),
              style: bodySmallRegular.copyWith(
                color: image == null ? Cr.red1 : Cr.darkGrey1,
              ),
            ),
          ),
          Di.SBWS,
          CustomElevatedButton(
            width: 85,
            onPressed: () async {
              if (image != null) {
                showCircularProgressIndicator(
                  context,
                  barrierDismissible: false,
                );
                final String? imageUrl =
                    await ImageUploadFunctions.uploadImageToCloudinary(
                  image!,
                  folder: widget.folder,
                );
                if (imageUrl != null) {
                  await widget.uploadedImgCallback(imageUrl);
                  Nav.pop(context);
                  Routemaster.of(context)
                      .push("/profile/${DbData.getUserProfileData.slug}");

                  Nav.pop(context);
                } else {
                  setState(() {
                    errorMessage = "Failed to upload image";
                  });
                }
              } else {
                setState(() {
                  errorMessage = "Please choose image";
                });
              }
            },
            child: Text(
              "Upload",
            ),
          ),
        ],
      ),
    );
  }
}