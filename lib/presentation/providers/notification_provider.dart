import 'package:flutter/material.dart';
import 'package:holedo/presentation/classes.dart';

class NotificationProvider extends ChangeNotifier {
  ProfileNotification? notification;
  NotificationProvider({
    this.notification,
  });

  void changeNotificationState(ProfileNotification notfi) {
    notification = notfi;
    notifyListeners();
  }
}
