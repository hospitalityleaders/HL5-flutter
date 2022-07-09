import 'package:flutter/material.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/models.dart';

class ProfileProvider extends ChangeNotifier {
  bool isProfileEditable;
  bool showProfileLoading;
  bool showConectionRequestPopo;
  bool showProfileSubMenus;
  bool profileSubMenuClicked;
  int percentageProfileCompleted;
  ProfileProvider({
    this.showConectionRequestPopo = false,
    this.showProfileSubMenus = false,
    this.isProfileEditable = false,
    this.showProfileLoading = false,
    this.profileSubMenuClicked = false,
    this.percentageProfileCompleted = 0,
  }) {
    // percentageProfileCompleted = _getUserProfilePercentage(appState!, percentageProfileCompleted);
  }

  int _getUserProfilePercentage(AppState appState, int percentage) {
    // Provider.of(context);
    if (true) {
      final userProfileData = DbData.getUserProfileData;
      final bool experienceAdded = (userProfileData.experiences != null ||
          userProfileData.experiences!.isNotEmpty);
      final bool qualificationAdded = ((userProfileData.educations == null ||
              userProfileData.educations!.isNotEmpty) ||
          (userProfileData.educations!.first.qualification == null ||
              userProfileData.educations!.first.qualification != null));
      final bool expertiseAdded = (userProfileData.expertise == null ||
          userProfileData.expertise!.isNotEmpty);
      final bool languagesAdded = (userProfileData.languages == null ||
          userProfileData.languages!.isNotEmpty);

      if (experienceAdded) {
        percentage += 20;
      }
      if (qualificationAdded) {
        percentage += 20;
      }
      if (expertiseAdded) {
        percentage += 20;
      }

      if (languagesAdded) {
        percentage += 20;
      }
    }

    return percentageProfileCompleted;
  }

  void changeShowProfileLoadingState(bool showLoading) {
    showProfileLoading = showLoading;

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
    isProfileEditable = isEditable;
    notifyListeners();
  }
}
