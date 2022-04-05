import 'package:get/get.dart';

class MenuController extends GetxController {
  RxInt bottomIndex = 0.obs;

  void setIndex(int? id) {
    bottomIndex.value = id!;
    update();
  }
}
