import 'package:holedo/models/models.dart';

void showCustomSnakbar(String title, String message) {
  Get.snackbar(title, message);
}

void showSuccessSnakbar(String message) {
  Get.snackbar("Success", message);
}

void showErrorSnakbar(String message) {
  Get.snackbar("Error", message);
}
