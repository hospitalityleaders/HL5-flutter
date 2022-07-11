import 'package:flutter/material.dart';
import 'package:holedo/db_data.dart';
import 'package:holedo/models/models.dart';
import 'package:routemaster/routemaster.dart';

class Nav {
  void goToCurrentUserProfile(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isLoggedIn = appState.isLoggedIn;
    Routemaster.of(context).push(
        isLoggedIn ? "/profile/" + DbData.getUserProfileData.slug! : "/login");
  }

  void push(
    BuildContext context,
    Widget screen,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
