import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/clean_detail/clean_detail_cubit.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/clean_task_model.dart';
import 'package:partner_app/data/repository/clean_task_repo.dart';

class CleanDetailCubit extends Cubit<CleanDetailState> {
  CleanDetailCubit() : super(CleanDetailInitial());

  CleanModel? cleanModel;
  CleanTaskRepository cleanTaskRepository = CleanTaskRepositoryImplement();
  final HiveService _hiveService = HiveService();
  TextEditingController cancelReasonContoller = TextEditingController(text: '');
  init(String taskId) async {
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    cleanModel = await cleanTaskRepository.getCleanById(taskId, token);
    cancelReasonContoller.text = '';
    print(cleanModel);
    emit(CleanDetailLoaded());
  }
}
