import 'dart:convert';

import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/data/model/clean_booking_rating.dart';
import 'package:partner_app/data/model/clean_task_model.dart';
import 'package:http/http.dart' as http;

abstract class CleanTaskRepository {
  Future<bool> completeTask(String taskerId, String taskId, String token);
  Future<bool> cancelTask(
      {required String taskerId,
      required String taskId,
      required String token,
      required String cancelReason});
  Future<CleanModel?> getCleanById(String taskId, String token);
  Future<CleanRatingModel?> getRatingClean(
      {required CleanModel cleanModel, required String token});
}

class CleanTaskRepositoryImplement extends CleanTaskRepository {
  @override
  Future<bool> completeTask(
      String taskerId, String taskId, String token) async {
    print(taskerId);
    print(taskId);
    print(token);
    try {
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(Uri.parse(UrlApiAppUser.completedClean),
          headers: headers,
          body: jsonEncode({
            "_id": taskId, // booking Task
            "taskerId": taskerId, "citySettingId": "66399069b760e117606292a0"
          }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<CleanRatingModel?> getRatingClean(
      {required CleanModel cleanModel, required String token}) async {
    try {
      print('go go');
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(Uri.parse(UrlApiAppUser.getRatingClean),
          headers: headers,
          body: jsonEncode(
              {"userId": cleanModel.userId, "cleanBookingId": cleanModel.id}));
      if (response.statusCode == 200) {
        print(response.body);
        return CleanRatingModel.fromJson(jsonDecode(response.body)["data"]);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> cancelTask(
      {required String taskerId,
      required String taskId,
      required String token,
      required String cancelReason}) async {
    // TODO: implement cancelTask
    try {
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(Uri.parse(UrlApiAppUser.cancelClean),
          headers: headers,
          body: jsonEncode({
            "_id": taskId, // booking Task
            "taskerId": taskerId, "citySettingId": "66399069b760e117606292a0",
            "cancelReason": cancelReason
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
  Future<CleanModel?> getCleanById(String taskId, String token) async {
    // TODO: implement getCleanById
    try {
      print('go go');
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(Uri.parse(UrlApiAppUser.getCleanById),
          headers: headers, body: jsonEncode({"_id": taskId}));
      if (response.statusCode == 200) {
        print(response.body);
        return CleanModel.fromJson(jsonDecode(response.body)["data"]);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
