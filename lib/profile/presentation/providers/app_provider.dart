import 'package:flutter/foundation.dart';
import 'package:holedo/models/holedoapi/settings.dart';
import 'package:holedo/models/holedoapi/settings.dart';
import 'package:holedo/models/models.dart';
import 'package:flat/flat.dart';
import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  String? _username;
  String? _token;
  User? _profile;
  final List<User> _profiles = [];

  AppProvider({
    String? username,
    User? profile,
  })  : _username = username,
        _profile = profile;

  //Getters
  NewsController get newscontroller => Get.put(NewsController());
  JobsController get jobscontroller => Get.put(JobsController());
  bool get isLoggedIn => _username != null;
  String? get token => _token;
  String? get username => _username;
  Iterable<User> get profiles => List.unmodifiable(_profiles);

  User? get profile => _profile;
  set profile(User? data) {
    _profile = data;
    _username = data?.fullName;
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

  DataModel data([String? s]) {
    var model = Get.put(HoledoDatabase()).getModel();
    if (s == null) {
      return model;
    }
    final flat = flatten(model!.toJson(), maxDepth: 2);
    if (flat[s] != null) {
      return flat[s];
      //debugPrint('flat $s ${flat[s].toString()}');
    }
    //debugPrint('flat ${flat.toString()}');
    return model;
  }
}
