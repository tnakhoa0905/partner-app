import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/home/history_detail/clean_booking/clean_history_state.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/clean_booking_rating.dart';
import 'package:partner_app/data/model/clean_task_model.dart';
import 'package:partner_app/data/repository/clean_task_repo.dart';

class CleanHistoryCubit extends Cubit<CleanHistoryState> {
  CleanHistoryCubit() : super(CleanHistoryInitial());
  CleanModel? cleanModel;
  CleanTaskRepository cleanTaskRepository = CleanTaskRepositoryImplement();
  final HiveService _hiveService = HiveService();
  CleanRatingModel? cleanRatingModel;
  init(BuildContext context, CleanModel clean) async {
    emit(CleanHistoryLoaded());
    cleanModel = clean;
    await getRating(cleanModel!.id!);
    emit(CleanHistoryLoaded());
  }

  getRating(String id) async {
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    cleanRatingModel = await cleanTaskRepository.getRatingClean(
        cleanModel: cleanModel!, token: token);
  }
}
