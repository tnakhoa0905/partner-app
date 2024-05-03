import 'dart:convert';

import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/data/model/clean_task_model.dart';
import 'package:http/http.dart' as http;

abstract class CleanTaskRepository {
  Future<bool> completeTask(CreateCleanModel taskClean, String token);
}

class CleanTaskRepositoryImplement extends CleanTaskRepository {
  @override
  Future<bool> completeTask(CreateCleanModel taskClean, String token) {
    // TODO: implement completeTask
    throw UnimplementedError();
  }
}
