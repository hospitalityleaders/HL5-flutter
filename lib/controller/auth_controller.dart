import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Map<dynamic, dynamic> myJson = <dynamic, dynamic>{
  'apiKey': 'test',
  'name': '',
  'token': '',
  'sott': false,
  'isLogined': false
};

class Auth {
  dynamic apiKey;
  dynamic sott;
  dynamic name;
  dynamic token;
  bool isLogined;

  Auth(this.apiKey, this.sott, this.name, this.token, this.isLogined);

  dynamic get setToken => token;

  set setToken(dynamic value) {
    token = value;
  }

  dynamic get setName => name;

  set setName(dynamic value) {
    name = value;
  }

  bool get setIsLogined => isLogined;

  set setIsLogined(bool value) {
    isLogined = value;
  }

  Auth.fromJson(Map<dynamic, dynamic> json)
      : apiKey = json['apiKey'],
        sott = json['sott'],
        name = json['name'],
        token = json['token'],
        isLogined = json['isLogined'];

  Map<dynamic, dynamic> toJson() => {
        'apiKey': apiKey,
        'sott': sott,
        'name': name,
        'token': token,
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
