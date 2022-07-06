import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  bool isProfileEditable;
  bool showProfileLoading;
  bool showConectionRequestPopo;
  bool showConectionRequestPopo2;
  bool showProfileSubMenus;
  bool showProfileSubMenus2;
  ProfileProvider({
    this.showConectionRequestPopo = false,
    this.showConectionRequestPopo2 = false,
    this.showProfileSubMenus = false,
    this.showProfileSubMenus2 = false,
    this.isProfileEditable = false,
    this.showProfileLoading = false,
  });

  void changeShowProfileLoadingState(bool showLoading) {
    this.showProfileLoading = showLoading;

    notifyListeners();
  }

  void changeConectionRequestPopupState(bool showPopup) {
    if (showPopup == true && showConectionRequestPopo2 == false) {
      showConectionRequestPopo2 = true;
    }

    notifyListeners();
  }

  void changeConectionRequestPopup2State(bool showPopup) {
    this.showConectionRequestPopo2 = showPopup;
    notifyListeners();
  }

  void changeProfileSubMenusState(bool showPopup) {
    if (showPopup == true && showProfileSubMenus2 == false) {
      showProfileSubMenus2 = true;
    } else if (showPopup == false && showConectionRequestPopo2 == true) {
      showConectionRequestPopo2 == false;
      showConectionRequestPopo = false;
    }

    notifyListeners();
  }

  void changeProfileSubMenus2State(bool showPopup) {
    this.showProfileSubMenus2 = showPopup;
    notifyListeners();
  }

  void changeIsProfieEditableState(bool isEditable) {
    this.isProfileEditable = isEditable;
    notifyListeners();
  }
}
