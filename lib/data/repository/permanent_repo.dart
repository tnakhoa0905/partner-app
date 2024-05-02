// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import 'package:partner_app/constant/constant.dart';
// import 'package:partner_app/data/model/permanent_model.dart';

// abstract class PermanentRepository {
//   Future<bool> createTask(CreateParmanentModel taskPermanent, String token);
//   Future<bool> updateTask(PermanentModel permanentModel, String token);
//   Future<bool> deleteTask(PermanentModel permanentModel, String token);
// }

// class PermanentRepositoryImplement extends PermanentRepository {
//   @override
//   Future<bool> createTask(
//       CreateParmanentModel taskPermanent, String token) async {
//     try {
//       print('go go');
//       var headers = {
//         'Content-Type': 'application/json; charset=utf-8',
//         'Authorization': 'Bearer $token',
//       };
//       final response = await http.post(
//           Uri.parse(UrlApiAppUser.createPermanentTask),
//           headers: headers,
//           body: jsonEncode(taskPermanent.toJson()));
//       if (response.statusCode == 200) {
//         return true;
//       }
//       return false;
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   @override
//   Future<bool> updateTask(PermanentModel permanentModel, String token) async {
//     // TODO: implement updateTask
//     try {
//       print('go go');
//       var headers = {
//         'Content-Type': 'application/json; charset=utf-8',
//         'Authorization': 'Bearer $token',
//       };
//       final response =
//           await http.post(Uri.parse(UrlApiAppUser.updatePermanentTask),
//               headers: headers,
//               body: jsonEncode({
//                 "_id": permanentModel.id, //permanent task booking Id
//                 "taskId": permanentModel.taskId!.id,
//                 "userId": permanentModel.userId,
//                 "note": permanentModel.taskId!.note,
//                 "price": permanentModel.taskId!.price,
//                 "time": permanentModel.time,
//                 "date": List<dynamic>.from(
//                     permanentModel.date!.map((x) => x.toIso8601String()))
//               }));
//       if (response.statusCode == 200) {
//         return true;
//       }
//       return false;
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   @override
//   Future<bool> deleteTask(PermanentModel permanentModel, String token) async {
//     // TODO: implement deleteTask
//     try {
//       print('go go');
//       var headers = {
//         'Content-Type': 'application/json; charset=utf-8',
//         'Authorization': 'Bearer $token',
//       };
//       final response =
//           await http.post(Uri.parse(UrlApiAppUser.deletePermanentTask),
//               headers: headers,
//               body: jsonEncode({
//                 "_id": permanentModel.id, //permanent task booking Id
//                 "taskId": permanentModel.taskId!.id,
//                 "userId": permanentModel.userId
//               }));
//       if (response.statusCode == 200) {
//         return true;
//       }
//       return false;
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }
