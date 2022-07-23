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
  bool isProfileEditable;
  bool showProfileLoading;
  bool showConectionRequestPopo;
  bool showProfileSubMenus;
  bool profileSubMenuClicked;
  int currentTabIndex;
  int percentageProfileCompleted;
  AppNotificationState appNotificationState;
  User? userProfileData;
  bool isMyProfile;
  String? currentProfileSlug;

  ProfileProvider({
    this.showConectionRequestPopo = false,
    this.showProfileSubMenus = false,
    this.isProfileEditable = false,
    this.showProfileLoading = false,
    this.profileSubMenuClicked = false,
    this.isMyProfile = false,
    this.percentageProfileCompleted = 20,
    this.currentTabIndex = 0,
    this.userProfileData,
    this.currentProfileSlug,
    this.appNotificationState = const AppNotificationState.profileCompletion(),
  });

  void initializeProfile({required User user, required bool isMyProfile}) {
    this.isMyProfile = isMyProfile;
    if (isMyProfile) {
      userProfileData = Get.put(HoledoDatabase()).getModel().user!;
      changeUserProfilePercentage();
    } else {
      userProfileData = user;
    }
  }

  void changeAppNotificationState(AppNotificationState appNotificationState) {
    this.appNotificationState = appNotificationState;
    notifyListeners();
  }

  void changeCurrentProfileSlug(String currentProfileSlug) {
    this.currentProfileSlug = currentProfileSlug;
    notifyListeners();
  }

  void changeUserProfilePercentage() {
    int percentage = 20;
    //TODO
    // if (isLoggedIn) {

    final _userProfileData = Get.put(HoledoDatabase()).getModel().user!;
    final bool experienceAdded =
        _userProfileData.experiences?.isNotEmpty ?? false;
    final bool qualificationAdded =
        (_userProfileData.educations?.isNotEmpty ?? false) &&
            (_userProfileData.educations!.first.qualification != null);
    final bool expertiseAdded = _userProfileData.expertise?.isNotEmpty ?? false;
    final bool languagesAdded = _userProfileData.languages?.isNotEmpty ?? false;

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
    // }
  }

  void changeShowProfileLoadingState(bool showLoading) {
    showProfileLoading = showLoading;
    notifyListeners();
  }

  void changeCurrentTabIndex(int currentTabIndex) {
    this.currentTabIndex = currentTabIndex;
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
