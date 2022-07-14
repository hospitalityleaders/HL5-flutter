import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:holedo/presentation/providers/profile_provider.dart';

part 'profile_notifier.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const ProfileState._();
  const factory ProfileState({
    @Default(false) bool isProfileEditable,
    @Default(false) bool showProfileLoading,
    @Default(false) bool showConectionRequestPopo,
    @Default(false) bool showProfileSubMenus,
    @Default(false) bool profileSubMenuClicked,
    @Default(0) int currentTabIndex,
    @Default(0) int percentageProfileCompleted,
    @Default(AppNotificationState.profileCompletion())
        AppNotificationState appNotificationState,
  }) = _ProfileState;
}

class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier() : super(ProfileState());

  void changeCurrentTabIndex(int newTabIndex) {
    state = state.copyWith(
      currentTabIndex: newTabIndex,
    );
  }
}
