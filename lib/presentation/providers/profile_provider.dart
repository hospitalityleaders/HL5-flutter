import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  bool isProfileEditable;
  bool showProfileLoading;
  bool showConectionRequestPopo;
  bool showProfileSubMenus;
  bool profileSubMenuClicked;
  ProfileProvider({
    this.showConectionRequestPopo = false,
    this.showProfileSubMenus = false,
    this.isProfileEditable = false,
    this.showProfileLoading = false,
    this.profileSubMenuClicked = false,
  });

  void changeShowProfileLoadingState(bool showLoading) {
    this.showProfileLoading = showLoading;

    notifyListeners();
  }

  void changeConectionRequestPopupState(bool showPopup) {
    if (showPopup == true && showConectionRequestPopo == false) {
      showConectionRequestPopo = true;
    }
    notifyListeners();
  }

  void changeConectionRequestPopup2State(bool showPopup) {
    showConectionRequestPopo = showPopup;
    notifyListeners();
  }

  void changeSubMenusPopupState(bool showPopup) {
    if (showPopup == true && showProfileSubMenus == false) {
      showProfileSubMenus = true;
    }
    notifyListeners();
  }

  Future<void> changeProfileSubMenuClicked(bool showSubMenu) async {
    showProfileSubMenus = false;
    profileSubMenuClicked = showSubMenu;
    notifyListeners();
    profileSubMenuClicked = false;
    notifyListeners();
  }

  void changeSubMenusPopup2State(bool showPopup) {
    showProfileSubMenus = showPopup;
    notifyListeners();
  }

  void profileNotifyListeners() {
    notifyListeners();
  }

  void changeIsProfieEditableState(bool isEditable) {
    this.isProfileEditable = isEditable;
    notifyListeners();
  }
}
