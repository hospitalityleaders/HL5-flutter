import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/providers/profile_provider.dart';

part 'profile_notifier.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const ProfileState._();
  const factory ProfileState({
    @Default(false) bool isProfileEditable,
    @Default(false) bool showProfileLoading,
    // @Default(false) bool showConectionRequestPopo,
    @Default(false) bool showProfileSubMenus,
    @Default(false) bool profileSubMenuClicked,
    @Default(0) int currentTabIndex,
    @Default(true) bool isMyProfile,
    // @Default(0) int percentageProfileCompleted,
    User? userProfileData,
    @Default(AppNotificationState.profileCompletion())
        AppNotificationState appNotificationState,
  }) = _ProfileState;
}

class ProfileStateNotifier extends StateNotifier<ProfileState> {
  final User userProfileData;

  ProfileStateNotifier(this.userProfileData) : super(ProfileState());

  void changeShowProfileLoadingState(bool showLoading) {
    state = state.copyWith(
      showProfileLoading: showLoading,
    );
  }

  void changeIsMyProfile({User? user}) {
    if (user == null) {
      state = state.copyWith(
        isMyProfile: true,
        userProfileData: Get.put(HoledoDatabase()).getModel().user!,
      );
    } else {
      state = state.copyWith(
        isMyProfile: false,
        userProfileData: user,
      );
    }
  }

  // void changeConectionRequestPopupState(bool showPopup) {
  //   if (showPopup == true && state.showConectionRequestPopo == false) {
  //     state = state.copyWith(
  //       showConectionRequestPopo: true,
  //     );
  //   }
  // }

  // void changeConectionRequestPopup2State(bool showPopup) {
  //   state = state.copyWith(
  //     showConectionRequestPopo: showPopup,
  //   );
  // }

  void changeSubMenusPopupState(bool showPopup) {
    if (showPopup == true && state.showProfileSubMenus == false) {
      state = state.copyWith(showProfileSubMenus: true);
    }
  }

  Future<void> changeProfileSubMenuClicked(bool showSubMenu) async {
    state = state.copyWith(
      showProfileSubMenus: false,
      profileSubMenuClicked: showSubMenu,
    );
    state = state.copyWith(
      profileSubMenuClicked: false,
    );
  }

  void changeSubMenusPopup2State(bool showPopup) {
    state = state.copyWith(
      showProfileSubMenus: showPopup,
    );
  }

  void changeCurrentTabIndex(int newTabIndex) {
    state = state.copyWith(
      currentTabIndex: newTabIndex,
    );
  }

  void changeIsProfieEditableState(bool isEditable) {
    state = state.copyWith(
      isProfileEditable: isEditable,
    );
  }

  void changeAppNotificationState(AppNotificationState appNotificationState) {
    state = state.copyWith(
      appNotificationState: appNotificationState,
    );
  }

  // void changeUserProfilePercentage(bool isLoggedIn) {
  //   int _percentage = 20;
  //   if (isLoggedIn) {
  //     final bool experienceAdded = (userProfileData.experiences != null ||
  //         userProfileData.experiences!.isNotEmpty);
  //     final bool qualificationAdded = ((userProfileData.educations == null ||
  //             userProfileData.educations!.isNotEmpty) ||
  //         (userProfileData.educations!.first.qualification == null ||
  //             userProfileData.educations!.first.qualification != null));
  //     final bool expertiseAdded = (userProfileData.expertise == null ||
  //         userProfileData.expertise!.isNotEmpty);
  //     final bool languagesAdded = (userProfileData.languages == null ||
  //         userProfileData.languages!.isNotEmpty);

  //     if (experienceAdded) {
  //       _percentage += 20;
  //     }
  //     if (qualificationAdded) {
  //       _percentage += 20;
  //     }
  //     if (expertiseAdded) {
  //       _percentage += 20;
  //     }

  //     if (languagesAdded) {
  //       _percentage += 20;
  //     }
  //     state = state.copyWith(
  //       percentageProfileCompleted: _percentage,
  //     );
  //   }
  // }

}
