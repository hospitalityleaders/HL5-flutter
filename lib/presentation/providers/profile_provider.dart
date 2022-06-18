import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  bool isProfileEditable;
  ProfileProvider({
    this.isProfileEditable = false,
  });

  void changeIsProfieEditableState(bool isEditable) {
    this.isProfileEditable = isEditable;
    notifyListeners();
  }
}
