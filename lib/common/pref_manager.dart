import 'package:get_storage/get_storage.dart';

class PreferenceManager {
  static GetStorage getStorage = GetStorage();

  ///News Data Id

  static Future setNewsDataId(String value) async {
    await getStorage.write("News_data_id", value);
  }

  static getNewsDataId() {
    return getStorage.read("News_data_id");
  }

  ///all erase
  static allClearPreferenceManager() {
    return getStorage.erase();
  }
}
