// import 'dart:convert';

// import 'package:partner_app/constant/constant.dart';
// import 'package:partner_app/data/model/clean_task_model.dart';
// import 'package:http/http.dart' as http;

// abstract class CleanTaskRepository {
//   Future<bool> createTask(CreateCleanModel taskClean, String token);
//   Future<bool> updateTask(CleanModel cleanModel, String token);
//   Future<bool> deleteTask(CleanModel cleanModel, String token);
// }

// class CleanTaskRepositoryImplement extends CleanTaskRepository {
//   @override
//   Future<bool> createTask(CreateCleanModel taskClean, String token) async {
//     try {
//       var headers = {
//         'Content-Type': 'application/json; charset=utf-8',
//         'Authorization': 'Bearer $token',
//       };
//       final response = await http.post(Uri.parse(UrlApiAppUser.createCleanTask),
//           headers: headers, body: jsonEncode(taskClean.toJson()));
//       if (response.statusCode == 200) {
//         return true;
//       }
//       return false;
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   @override
//   Future<bool> updateTask(CleanModel cleanModel, String token) async {
//     // TODO: implement updateTask
//     try {
//       var headers = {
//         'Content-Type': 'application/json; charset=utf-8',
//         'Authorization': 'Bearer $token',
//       };
//       print({
//         "_id": cleanModel.id, //cleanbookingId
//         "userId": cleanModel.userId,
//         "cleanId": cleanModel.cleanId!.id,
//         "name": cleanModel.cleanId!.name,
//         "note": cleanModel.cleanId!.note,
//         "date": cleanModel.date!.toIso8601String(),
//         "time": cleanModel.time
//       });
//       final response = await http.post(Uri.parse(UrlApiAppUser.updateCleanTask),
//           headers: headers,
//           body: jsonEncode({
//             "_id": cleanModel.id, //cleanbookingId
//             "userId": cleanModel.userId,
//             "cleanId": cleanModel.cleanId!.id,
//             "name": cleanModel.cleanId!.name,
//             "note": cleanModel.cleanId!.note,
//             "date": cleanModel.date!.toIso8601String(),
//             "time": cleanModel.time
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
//   Future<bool> deleteTask(CleanModel cleanModel, String token) async {
//     // TODO: implement deleteTask
//     try {
//       var headers = {
//         'Content-Type': 'application/json; charset=utf-8',
//         'Authorization': 'Bearer $token',
//       };
//       print({
//         "_id": cleanModel.id, //cleanbookingId
//         "userId": cleanModel.userId,
//         "cleanId": cleanModel.cleanId!.id,
//         "name": cleanModel.cleanId!.name,
//         "note": cleanModel.cleanId!.note,
//         "date": cleanModel.date!.toIso8601String(),
//         "time": cleanModel.time
//       });
//       final response = await http.post(Uri.parse(UrlApiAppUser.deleteCleanTask),
//           headers: headers,
//           body: jsonEncode({
//             "_id": cleanModel.id, //clean Booking Id
//             "cleanId": cleanModel.cleanId!.id,
//             "userId": cleanModel.userId
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
