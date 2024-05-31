import 'dart:convert';

import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/data/model/clean_task_model.dart';
import 'package:http/http.dart' as http;

abstract class CleanTaskRepository {
  Future<bool> completeTask(CreateCleanModel taskClean, String token);
  Future<CleanModel?> getCleanById(String taskId, String token);
}

class CleanTaskRepositoryImplement extends CleanTaskRepository {
  @override
  Future<bool> completeTask(CreateCleanModel taskClean, String token) {
    // TODO: implement completeTask
    throw UnimplementedError();
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
