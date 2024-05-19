import 'package:hive_flutter/hive_flutter.dart';
import 'package:partner_app/data/model/user_model.dart';
part 'hive_service.g.dart';

@HiveType(typeId: 1)
class Person extends HiveObject {
  Person({
    required this.userModel,
  });

  @HiveField(0)
  String userModel;

  @override
  String toString() {
    return '$userModel: $userModel';
  }
}

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

  add(Person person, String boxName) async {
    final openBox = await Hive.openBox(boxName);
    openBox.add(person);
  }

  Future<Person> getUser() async {
    final openBox = await Hive.openBox(boxUserModel);
    return openBox.getAt(1);
  }
}
