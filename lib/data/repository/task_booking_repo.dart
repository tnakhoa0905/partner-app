import 'dart:convert';

import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/data/model/task_booking_model.dart';
import 'package:http/http.dart' as http;

abstract class TaskBookingRepo {
  Future<bool> completeTask(String taskerId, String taskId, String token);
  Future<bool> cancelTask(String taskerId, String taskId, String token);
  Future<dynamic> getWaitingTask(String taskerId, String token);
  Future<dynamic> getDoneTask(String taskerId, String token);
  Future<TaskBookingModel?> getTaskBookingById(String taskId, String token);
}

class TaskBookingRepoImplement extends TaskBookingRepo {
  @override
  Future<bool> completeTask(
      String taskerId, String taskId, String token) async {
    try {
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(Uri.parse(UrlApiAppUser.completedJob),
          headers: headers,
          body: jsonEncode({
            "_id": taskId, // booking Task
            "taskerId": taskerId
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
  Future<bool> cancelTask(String taskerId, String taskId, String token) async {
    // TODO: implement cancelTask
    try {
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(Uri.parse(UrlApiAppUser.cancelJob),
          headers: headers,
          body: jsonEncode({
            "_id": taskId, // booking Task
            "taskerId": taskerId
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
  Future getWaitingTask(String taskerId, String token) async {
    // TODO: implement getWaitingTask
    try {
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(Uri.parse(UrlApiAppUser.getWaitingJob),
          headers: headers, body: jsonEncode({"taskerId": taskerId}));
      if (response.statusCode == 200) {
        return response.body;
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future getDoneTask(String taskerId, String token) async {
    try {
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(Uri.parse(UrlApiAppUser.getDoneJob),
          headers: headers, body: jsonEncode({"taskerId": taskerId}));
      if (response.statusCode == 200) {
        return response.body;
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<TaskBookingModel?> getTaskBookingById(
      String taskId, String token) async {
    // TODO: implement getTaskBookingById
    try {
      print('go go');
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(Uri.parse(UrlApiAppUser.getTaskById),
          headers: headers, body: jsonEncode({"_id": taskId}));
      if (response.statusCode == 200) {
        print(response.body);
        return TaskBookingModel.fromJson(jsonDecode(response.body)["data"]);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
