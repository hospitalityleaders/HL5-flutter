import 'package:flutter/foundation.dart';
// This file is "main.dart"

// part 'profile_provider.freezed.dart';

// @freezed
// class AppNotificationState with _$AppNotificationState {
//   const AppNotificationState._();
//   const factory AppNotificationState.showNothing() = _ShowNothing;
//   const factory AppNotificationState.sucess() = _Sucess;
//   const factory AppNotificationState.profileCompletion() = _ProfileCompletion;
// }

class JobsProvider extends ChangeNotifier {
  bool isProfileEditable;

  JobsProvider({
    this.isProfileEditable = false,
  });

  void changeIsProfieEditableState(bool isEditable) {
    isProfileEditable = isEditable;
    notifyListeners();
  }
}
