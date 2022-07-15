import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Cloudinary get _cloudinaryInstance => Cloudinary.full(
      apiKey: "932669714294851",
      apiSecret: "i4Vv1wjaFGLbhcg_qGUjpviPbzk",
      cloudName: "dgj5m6kvt",
    );

class ImageUploadFunctions {
  /// Will upload image, if it become successfull then returns uploaded image url
  static Future<String?> uploadImageToCloudinary(
    XFile image, {
    required String folder,
  }) async {
    final cloudinary = _cloudinaryInstance;
    final response = await cloudinary.uploadResource(
      CloudinaryUploadResource(
        filePath: image.path,
        fileBytes: await image.readAsBytes(),
        resourceType: CloudinaryResourceType.image,
        folder: folder,
        fileName: image.name,
        // progressCallback: (count, total) {},
      ),
    );
    return response.secureUrl;
  }

  Future<bool> deleteImageFromCloudnary(String imgUrl) async {
    final cloudinary = _cloudinaryInstance;
    final response = await cloudinary.deleteResource(
      url: imgUrl,
      resourceType: CloudinaryResourceType.image,
      invalidate: false,
    );
    return response.isSuccessful;
  }

//Covert XFile to Image
  static Future<Image> convertXfileToImage(XFile xFile) async {
    final memoryImage = await xFile.readAsBytes();
    return Image.memory(memoryImage);
  }

//Covert XFile to Image
  static Future<Image?> pickAndReturnImageFromGallery() async {
    final XFile? xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (xFile != null) {
      final memoryImage = await xFile.readAsBytes();
      return Image.memory(memoryImage);
    }
    return null;
  }

// Pick image from gallery
  static Future<XFile?> pickImageFromGallery() async => ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
}
