import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/data/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class UserRepository {
  Future<UserModel?> userSignIn(
      String userName, String passWord, String fcmToken);
  Future<Map<String, dynamic>?> userSignUp(
      {required String userName,
      required String passWord,
      required String email,
      required String fullName});
  Future<User?> getUser(String id, token);
  Future<bool> updateUser(
      {required String id,
      required String phoneNumber,
      required String email,
      required String fullName,
      required String token});
  Future<bool> logOut(
      {required String userId,
      required String token,
      required String fcmToken});
  Future<bool> updateLocation({
    required String userId,
    required String token,
    required double lat,
    required double lng,
  });
  Future<UserModel?> userSignInByPhone(String userName);
  Future<bool> changePassword({
    required String userId,
    required String token,
    required String password,
  });
}

class UserRepositoryImplement extends UserRepository {
  @override
  Future<UserModel?> userSignIn(
      String userName, String passWord, String fcmToken) async {
    try {
      print('go go');
      final response = await http.post(Uri.parse(UrlApiAppUser.signIn),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "username": userName,
            "password": passWord,
            "fcmToken": fcmToken
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

  @override
  Future<bool> updateUser(
      {required String id,
      required String phoneNumber,
      required String email,
      required String fullName,
      required String token}) async {
    // TODO: implement updateUser
    try {
      print('go go');
      final response = await http.post(Uri.parse(UrlApiAppUser.updateProfile),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            "userInfo": {
              "_id": id,
              "fullName": fullName,
              "email": email,
              "phoneNumber": phoneNumber,
            }
          }));
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Map<String, dynamic>?> userSignUp(
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
        return {
          "data": jsonDecode(response.body)["data"]["_id"],
          "success": jsonDecode(response.body)["success"]
        };
      }
      return {
        "data": jsonDecode(response.body)["data"],
        "success": jsonDecode(response.body)["success"]
      };
    } catch (e) {
      Exception(e);
    }
    return null;
  }

  @override
  Future<User?> getUser(String id, token) async {
    // TODO: implement getUser
    try {
      print('go go');
      final response = await http.post(Uri.parse(UrlApiAppUser.getUser),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            "info": {"_id": id}
          }));
      if (response.statusCode == 200) {
        print(User.fromJson(jsonDecode(response.body)["data"]));
        return User.fromJson(jsonDecode(response.body)["data"]);
      }
      return null;
    } catch (e) {
      Exception(e);
    }
    return null;
  }

  @override
  Future<bool> logOut(
      {required String userId,
      required String token,
      required String fcmToken}) async {
    // TODO: implement logOut
    try {
      print('go go');
      print(userId);
      final response = await http.post(Uri.parse(UrlApiAppUser.logOut),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({"userId": userId, "token": token}));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('ccccc');
        print(jsonDecode(response.body)["data"]);
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> updateLocation(
      {required String userId,
      required String token,
      required double lat,
      required double lng}) async {
    // TODO: implement updateLocation
    try {
      print('go go');
      print(userId);
      final response = await http.post(Uri.parse(UrlApiAppUser.updateLocation),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            "userInfo": {
              "_id": userId,
              "location": {"lat": lat, "lng": lng}
            }
          }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('ccccc');
        print(jsonDecode(response.body)["data"]);
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> changePassword({
    required String userId,
    required String token,
    required String password,
  }) async {
    // TODO: implement changePassword
    try {
      print('go go');
      print(userId);
      final response = await http.post(Uri.parse(UrlApiAppUser.updateProfile),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            "userInfo": {"password": password}
          }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('ccccc');
        print(jsonDecode(response.body)["data"]);
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<UserModel?> userSignInByPhone(String userName) async {
    // TODO: implement userSignInByPhone
    try {
      print('go go');
      final response = await http.post(
          Uri.parse("${UrlApiAppUser.host}users/signin_by_phone"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "phoneNumber": userName,
          }));
      if (response.statusCode == 200) {
        print(UserModel.fromJson(jsonDecode(response.body)["data"]));
        return UserModel.fromJson(jsonDecode(response.body)["data"]);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
