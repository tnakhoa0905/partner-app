// import 'dart:convert';

// import 'package:partner_app/constant/constant.dart';
// import 'package:partner_app/data/model/task_booking_model.dart';
// import 'package:http/http.dart' as http;

// abstract class TaskBookingRepo {
//   Future<bool> createTask(CreateTaskModel taskBookingModel, String token);
//   Future<bool> updateTask(TaskBookingModel taskBookingModel, String token);
//   Future<bool> deleteTask(TaskBookingModel taskBookingModel, String token);
// }

// class TaskBookingRepoImplement extends TaskBookingRepo {
//   @override
//   Future<bool> createTask(
//       CreateTaskModel taskBookingModel, String token) async {
//     try {
//       print('go go');
//       var headers = {
//         'Content-Type': 'application/json; charset=utf-8',
//         'Authorization': 'Bearer $token',
//       };
//       final response = await http.post(Uri.parse(UrlApiAppUser.createTask),
//           headers: headers, body: jsonEncode(taskBookingModel.toJson()));
//       if (response.statusCode == 200) {
//         return true;
//       }
//       return false;
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   @override
//   Future<bool> updateTask(
//       TaskBookingModel taskBookingModel, String token) async {
//     // TODO: implement updateTask
//     try {
//       print('go go');
//       var headers = {
//         'Content-Type': 'application/json; charset=utf-8',
//         'Authorization': 'Bearer $token',
//       };
//       final response = await http.post(Uri.parse(UrlApiAppUser.updateTask),
//           headers: headers,
//           body: jsonEncode({
//             "_id": taskBookingModel.id, //task booking Id
//             "taskId": taskBookingModel.taskId!.id,
//             "userId": taskBookingModel.userId,
//             "note": taskBookingModel.taskId!.note,
//             "remind": taskBookingModel.remind,
//             "price": taskBookingModel.taskId!.price,
//             "time": taskBookingModel.time,
//             "estimateTime": taskBookingModel.taskId!.estimateTime,
//             "date": taskBookingModel.date!.toIso8601String(),
//           }));
//       if (response.statusCode == 200) {
//         return true;
//       }
//       return false;
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   @override
//   Future<bool> deleteTask(
//       TaskBookingModel taskBookingModel, String token) async {
//     // TODO: implement deleteTask
//     try {
//       print('go go');
//       var headers = {
//         'Content-Type': 'application/json; charset=utf-8',
//         'Authorization': 'Bearer $token',
//       };
//       final response = await http.post(Uri.parse(UrlApiAppUser.deleteTask),
//           headers: headers,
//           body: jsonEncode({
//             "_id": taskBookingModel.id, //task booking Id
//             "taskId": taskBookingModel.taskId!.id,
//             "userId": taskBookingModel.userId,
//           }));
//       if (response.statusCode == 200) {
//         return true;
//       }
//       return false;
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
