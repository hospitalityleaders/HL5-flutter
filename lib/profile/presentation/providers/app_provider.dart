import 'package:flutter/foundation.dart';
import 'package:holedo/models/models.dart';
import 'package:flutter/material.dart';
import 'package:holedo/profile/presentation/ui/components/appbar_notification.dart';
import 'package:matrix/src/client.dart';

class AppProvider extends ChangeNotifier {
  String? _username;
  String? _token;
  User? _profile;
  DataModel _model;
  Client _matrix;
  AppNotify? _notify;
  bool _slider;
  final List<User> _profiles = [];

  AppProvider({
    String? username,
    User? profile,
    AppNotify? notify,
    bool slider = false,
    required DataModel model,
    required Client matrix,
  })  : _username = username,
        _profile = profile,
        _model = model,
        _matrix = matrix,
        _slider = slider,
        _notify = notify;

  //Getters
  NewsController get newscontroller => Get.put(NewsController());
  JobsController get jobscontroller => Get.put(JobsController());

  Client get matrix => _matrix;

  Iterable<User> get profiles => List.unmodifiable(_profiles);
  bool get isLoggedIn => _username != null;
  String? get token => _token;
  String? get username => _username;
  User? get profile => _profile;

  set profile(User? data) {
    _profile = data;
    _username = data?.fullName;
    notifyListeners();
  }

  bool get slider => _slider;
  set slider(bool slider) {
    _slider = slider;
    notifyListeners();
  }

  sliderToggle() {
    _slider = !_slider;
    notifyListeners();
    print('slider: ${slider}');
  }

  AppNotify? get notify => _notify;
  set notify(AppNotify? notify) {
    _notify = notify;
    notifyListeners();
  }

  //Setters
  set username(String? value) {
    _username = value;
    notifyListeners();
  }

  set token(String? value) {
    _token = value;
    notifyListeners();
  }

  //Update state notifiers
  bool isLoginnedAndEditable(User data) {
    debugPrint('p: ${profile?.slug} ${data.slug}');
    if (profile?.slug != null) {
      if (data.slug == profile?.slug) {
        return true;
      }
    }

    return false;
  }

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

  DataModel get model => _model;
  set model(DataModel data) {
    _model = data;

    notifyListeners();
  }

  DataModel Function() get myModel => () {
        var model = Get.put(HoledoDatabase()).getModel();
        return model;
      };
}
