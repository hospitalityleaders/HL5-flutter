import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadFunctions {
  /// Will upload image, if it become successfull then returns uploaded image url
  static Future<String?> uploadImageToCloudinary(XFile image) async {
    final cloudinary = Cloudinary.full(
      apiKey: "932669714294851",
      apiSecret: "i4Vv1wjaFGLbhcg_qGUjpviPbzk",
      cloudName: "dgj5m6kvt",
    );
    final response = await cloudinary.uploadResource(
      CloudinaryUploadResource(
        filePath: image.path,
        fileBytes: await image.readAsBytes(),
        resourceType: CloudinaryResourceType.image,
        folder: "user_banners",
        fileName: image.name,
        // progressCallback: (count, total) {},
      ),
    );
    return response.secureUrl;
  }

// Pick image from gallery
  static Future<XFile?> pickImageFromGallery() async =>
      await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
}
