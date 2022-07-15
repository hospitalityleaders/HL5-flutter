import 'package:flutter/foundation.dart';
// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:holedo/models/models.dart';

part 'profile_provider.freezed.dart';

@freezed
class AppNotificationState with _$AppNotificationState {
  const AppNotificationState._();
  const factory AppNotificationState.showNothing() = _ShowNothing;
  const factory AppNotificationState.sucess() = _Sucess;
  const factory AppNotificationState.profileCompletion() = _ProfileCompletion;
}

class ProfileProvider extends ChangeNotifier {
  // bool isProfileEditable;
  // bool showProfileLoading;
  bool showConectionRequestPopo;
  bool showProfileSubMenus;
  bool profileSubMenuClicked;
  // int currentTabIndex;
  int percentageProfileCompleted;
  // AppNotificationState appNotificationState;
  ProfileProvider({
    this.showConectionRequestPopo = false,
    this.showProfileSubMenus = false,
    // this.isProfileEditable = false,
    // this.showProfileLoading = false,
    this.profileSubMenuClicked = false,
    this.percentageProfileCompleted = 20,
    // this.currentTabIndex = 0,
    // this.appNotificationState = const AppNotificationState.profileCompletion(),
  });

  // void changeAppNotificationState(AppNotificationState appNotificationState) {
  //   this.appNotificationState = appNotificationState;
  //   notifyListeners();
  // }

  void changeUserProfilePercentage(bool isLoggedIn) {
    int percentage = 20;
    if (isLoggedIn) {
      final userProfileData = Get.put(HoledoDatabase()).getModel().user!;
      final bool experienceAdded = userProfileData.experiences != null ||
          userProfileData.experiences!.isNotEmpty;
      final bool qualificationAdded = (userProfileData.educations == null ||
              userProfileData.educations!.isNotEmpty) ||
          (userProfileData.educations!.first.qualification == null ||
              userProfileData.educations!.first.qualification != null);
      final bool expertiseAdded = userProfileData.expertise == null ||
          userProfileData.expertise!.isNotEmpty;
      final bool languagesAdded = userProfileData.languages == null ||
          userProfileData.languages!.isNotEmpty;

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
      percentageProfileCompleted = percentage;
      notifyListeners();
    }
  }

  // void changeShowProfileLoadingState(bool showLoading) {
  //   showProfileLoading = showLoading;

  //   notifyListeners();
  // }

  // void changeCurrentTabIndex(int currentTabIndex) {
  //   this.currentTabIndex = currentTabIndex;

  //   notifyListeners();
  // }

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

  // void changeIsProfieEditableState(bool isEditable) {
  //   isProfileEditable = isEditable;
  //   notifyListeners();
  // }
}
