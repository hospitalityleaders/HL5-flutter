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
  ProfileProvider(
      {this.showConectionRequestPopo = false,
      this.showProfileSubMenus = false,
      // this.isProfileEditable = false,
      // this.showProfileLoading = false,
      this.profileSubMenuClicked = false,
      this.percentageProfileCompleted = 20,
      // this.currentTabIndex = 0,
      // this.appNotificationState = const AppNotificationState.profileCompletion(),
      String? username,
      User? profile})
      : _username = username,
        _profile = profile;

  NewsController get news => Get.put(NewsController());
  JobsController get jobs => Get.put(JobsController());

  bool get isLoggedIn => _username != null;

  String? _username;
  String? _token;
  User? _profile;
  String? get username => _username;

  set username(String? value) {
    _username = value;
    notifyListeners();
  }

  String? get token => _token;
  set token(String? value) {
    _token = value;
    notifyListeners();
  }

  bool isLoginnedAndEditable(User data) {
    debugPrint('p: ${profile?.slug} ${data.slug}');
    if (profile?.slug != null) {
      if (data.slug == profile?.slug) {
        return true;
      }
    }

    return false;
  }

  User? get profile => _profile;
  set profile(User? data) {
    _profile = data;
    _username = data?.fullName;
    notifyListeners();
  }

  final List<User> _profiles = [];
  Iterable<User> get profiles => List.unmodifiable(_profiles);

  void addProfile(User data) {
    _profiles.add(data);
    notifyListeners();
  }

  Future<DataModel> saveProfile(User data) async {
    data.id = _profile?.id;
    // ignore: unused_local_variable

    //data.slug = _profile?.slug;
    //this.token = profile.token;
    final dataModel = await Get.put(HoledoDatabase().users).saveProfile(data);
    _profile = dataModel.user as User;
    return dataModel;
  }

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
