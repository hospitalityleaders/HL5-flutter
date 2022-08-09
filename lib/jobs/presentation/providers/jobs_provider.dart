import 'package:flutter/foundation.dart';

class JobsProvider extends ChangeNotifier {
  int currentTabIndex;

  JobsProvider({
    this.currentTabIndex = 0,
  });

  void changeCurrentTabIndex(int currentTabIndex) {
    this.currentTabIndex = currentTabIndex;
    notifyListeners();
  }
}
