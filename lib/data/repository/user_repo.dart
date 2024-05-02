import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/data/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class UserRepository {
  Future<UserModel?> userSignIn(String userName, String passWord);
  Future<UserModel?> userSignUp(
      {required String userName,
      required String passWord,
      required String email,
      required String fullName});
}

class UserRepositoryImplement extends UserRepository {
  @override
  Future<UserModel?> userSignIn(String userName, String passWord) async {
    try {
      print('go go');
      final response = await http.post(Uri.parse(UrlApiAppUser.signIn),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({"username": userName, "password": passWord}));
      if (response.statusCode == 200) {
        print(UserModel.fromJson(jsonDecode(response.body)["data"]));
        return UserModel.fromJson(jsonDecode(response.body)["data"]);
      }
      return null;
    } catch (e) {
      Exception(e);
    }
    return null;
  }

  @override
  Future<UserModel?> userSignUp(
      {required String userName,
      required String passWord,
      required String email,
      required String fullName}) async {
    // TODO: implement userSignUp
    try {
      print('go go');
      final response = await http.post(Uri.parse(UrlApiAppUser.signUp),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "email": email,
            "phoneNumber": userName,
            "password": passWord,
            "fullName": fullName
          }));
      if (response.statusCode == 200) {
        print(UserModel.fromJson(jsonDecode(response.body)["data"]));
        return UserModel.fromJson(jsonDecode(response.body)["data"]);
      }
      return null;
    } catch (e) {
      Exception(e);
    }
    return null;
  }
}
