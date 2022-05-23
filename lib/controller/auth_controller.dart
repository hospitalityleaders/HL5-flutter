import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Map<dynamic, dynamic> settings = <dynamic, dynamic>{
  'apiHost': 'dev.holedo.com',
  'apiKey': 'test',
};
Map<dynamic, dynamic> setup = <dynamic, dynamic>{
  'settings': settings,
  'name': '',
  'token': '',
  'sott': false,
  'isLogined': false
};

enum Config {
  apiSettings,
  loginData,
  cache,
}

class SetupData {
  const SetupData({required this.name, required this.value});

  final String name;
  final bool value;

  static const Map<Config, SetupData> setup = {
    Config.apiSettings: SetupData(name: 'api', value: true),
    Config.loginData: SetupData(name: 'api', value: true),
    Config.cache: SetupData(name: 'cache', value: true),
  };

  static List<SetupData> get list {
    List<SetupData> list = [];
    setup.forEach((k, v) => list.add(v));
    return list;
  }

  @override
  String toString() {
    return 'SetupData{name: $name, value: $value}';
  }
}

const set = SetupData(name: 'wtf', value: true);
void main() {
  print('set: ${SetupData.setup}');
  print('ss: ${set}');
}

Map<dynamic, dynamic> myJson = <dynamic, dynamic>{
  'apiHost': 'dev.holedo.com',
  'apiKey': 'holedo_flutter_tests',
  'name': '',
  'token': '',
  'sott': false,
  'isLogined': false
};

class Auth {
  dynamic apiHost;
  dynamic apiKey;
  dynamic sott;
  dynamic name;
  dynamic token;
  dynamic data;
  bool isLogined;

  Auth(this.apiHost, this.apiKey, this.sott, this.name, this.token,
      this.isLogined, this.data);

  dynamic get setToken => token;

  set setToken(dynamic value) {
    token = value;
  }

  dynamic get setName => name;

  set setName(dynamic value) {
    name = value;
  }

  dynamic get setData => data;

  set setData(dynamic value) {
    data = value;
  }

  bool get setIsLogined => isLogined;

  set setIsLogined(bool value) {
    isLogined = value;
  }

  Auth.fromJson(Map<dynamic, dynamic> json)
      : apiHost = json['apiHost'],
        apiKey = json['apiKey'],
        sott = json['sott'],
        name = json['name'],
        token = json['token'],
        data = json['data'],
        isLogined = json['isLogined'];

  Map<dynamic, dynamic> toJson() => {
        'apiHost': apiHost,
        'apiKey': apiKey,
        'sott': sott,
        'name': name,
        'token': token,
        'data': data,
        'isLogined': isLogined,
      };
}

class AuthController extends GetxController {
  final box = GetStorage();

  Future<void> initStorage() async {
    await GetStorage.init();
  }

  void authModel(Auth model) {
    box.write('model', model.toJson());
    //print('model update: ${box.read('model')}');
  }

  void resetModel() {
    box.remove('model');
  }

  Auth restoreModel() {
    //print('model: ${box.read('model')}');
    final map = box.read('model') ?? myJson;
    return Auth.fromJson(map);
  }
}

var AuthData = Get.put(AuthController()).restoreModel();

/* notes:
 To log out:
    Get.put(AuthController()).restModel();

  This will erase all the data on the storage.

 To save data:
    final model = Get.put(AuthController()).restoreModel();
    model.setToken = accessToken;
    model.setIsLogined = true;
    Get.find<AuthController>().authModel(model);

  AuthData constant:
    AuthData is available everywhere.

    AuthData.apiKey
    AuthData.token
    AuthData.isLogined
    etc.

    If for some reason AuthData doesn't work. You can use
      Get.put(AuthController()).restoreModel().isLogined

*/
