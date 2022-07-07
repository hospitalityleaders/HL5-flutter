import 'package:get/get.dart';

class MenuController extends GetxController {
  RxInt menuIndex = 0.obs;
  RxString menuString = ''.obs;

  void setIndex(int? id) {
    menuIndex.value = id!;
    update();
  }

  void setString(String? id) {
    menuString.value = id!;
    update();
  }

  RxInt tabIndex = 0.obs;
  void setTabIndex(int? index) {
    tabIndex.value = index!;
  }

  RxInt tabIndex1 = 0.obs;
  void setTabIndex1(int? index) {
    tabIndex1.value = index!;
  }
}
