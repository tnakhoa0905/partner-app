import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static String boxUserModel = 'userModel';
  isExists({required String boxName}) async {
    try {
      final openBox = await Hive.openBox(boxName);
      int length = openBox.length;
      return length != 0;
    } catch (e) {
      return false;
    }
  }

  addBox(String key, String value, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    openBox.put(key, value);
  }

  Future<String?> getBox(String key, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    return openBox.get(key);
  }

  closeBox(String boxName) async {
    final openBox = await Hive.openBox(boxName);
    openBox.clear();
    openBox.close();
  }
}
