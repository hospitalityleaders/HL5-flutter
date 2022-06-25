import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  bool isProfileEditable;
  bool showProfileLoading;
  ProfileProvider({
    this.isProfileEditable = false,
    this.showProfileLoading = false,
  });

  void changeShowProfileLoadingState(bool showLoading) {
    this.showProfileLoading = showLoading;
    notifyListeners();
  }

  void changeIsProfieEditableState(bool isEditable) {
    this.isProfileEditable = isEditable;
    notifyListeners();
  }
}
