import 'dart:convert';

import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/data/model/clean_task_model.dart';
import 'package:partner_app/data/model/task_booking_model.dart';
import 'package:http/http.dart' as http;
import 'package:partner_app/data/model/task_booking_rating.dart';

abstract class TaskBookingRepo {
  Future<bool> completeTask(String taskerId, String taskId, String token);
  Future<bool> cancelTask(
      {required String taskerId,
      required String taskId,
      required String token,
      required String cancelReason});
  Future<dynamic> getWaitingTask(String taskerId, String token);
  Future<dynamic> getDoneTask(String taskerId, String token);
  Future<TaskBookingModel?> getTaskBookingById(String taskId, String token);
  Future<String?> createPaymentLink(TaskBookingModel taskBookingModel);
  Future<String?> createPaymentLinkClean(CleanModel cleanModel);
  Future<TaskBookingRating?> ratingTaskBooking(
      {required String userId,
      required String taskBookingId,
      required int taskBookingRating,
      required String taskBookingReview,
      required String token});
  Future<TaskBookingRating?> getRatingTaskBooking(
      {required TaskBookingModel taskBookingModel, required String token});
}

class TaskBookingRepoImplement extends TaskBookingRepo {
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
      final response = await http.post(Uri.parse(UrlApiAppUser.completedTask),
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
      final response = await http.post(Uri.parse(UrlApiAppUser.cancelTask),
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
      print(taskId);
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(Uri.parse(UrlApiAppUser.getTaskById),
          headers: headers, body: jsonEncode({"_id": taskId}));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.body);
        return TaskBookingModel.fromJson(jsonDecode(response.body)["data"]);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String?> createPaymentLink(TaskBookingModel taskBookingModel) async {
    // TODO: implement createPaymentLink
    try {
      print('go go');
      print(taskBookingModel.toJson());

      final response = await http.post(Uri.parse(UrlApiAppUser.createPayment),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(taskBookingModel.toJson()));

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body)["data"]["checkoutUrl"];
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String?> createPaymentLinkClean(CleanModel cleanModel) async {
    // TODO: implement createPaymentLink
    try {
      print('go go');
      print(cleanModel.toJson());

      final response = await http.post(Uri.parse(UrlApiAppUser.createPayment),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(cleanModel.toJson()));

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body)["data"]["checkoutUrl"];
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<TaskBookingRating?> ratingTaskBooking(
      {required String userId,
      required String taskBookingId,
      required int taskBookingRating,
      required String taskBookingReview,
      required String token}) async {
    // TODO: implement ratingTaskBooking
    try {
      print('go go');
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response =
          await http.post(Uri.parse(UrlApiAppUser.ratingTaskBooking),
              headers: headers,
              body: jsonEncode({
                "userId": userId,
                "taskBookingId": taskBookingId,
                "taskBookingRating": taskBookingRating,
                "taskBookingReview": {"review": taskBookingReview}
              }));
      if (response.statusCode == 200) {
        print(response.body);
        return TaskBookingRating.fromJson(jsonDecode(response.body)["data"]);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<TaskBookingRating?> getRatingTaskBooking(
      {required TaskBookingModel taskBookingModel,
      required String token}) async {
    // TODO: implement getRatingTaskBooking
    try {
      print('go go');
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(
          Uri.parse(UrlApiAppUser.getRatingTaskBooking),
          headers: headers,
          body: jsonEncode({
            "userId": taskBookingModel.userId,
            "taskBookingId": taskBookingModel.id
          }));
      if (response.statusCode == 200) {
        print(response.body);
        return TaskBookingRating.fromJson(jsonDecode(response.body)["data"]);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> cancelTaskBooking(
      {required TaskBookingModel taskBookingModel, required String token}) {
    // TODO: implement cancelTaskBooking
    throw UnimplementedError();
  }

  @override
  Future<bool> completeTaskBooking(
      {required TaskBookingModel taskBookingModel, required String token}) {
    // TODO: implement completeTaskBooking
    throw UnimplementedError();
  }
}
