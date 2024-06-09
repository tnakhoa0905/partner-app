import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/home/history_detail/task_booking/task_booking_history_detail.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/task_booking_model.dart';
import 'package:partner_app/data/model/task_booking_rating.dart';
import 'package:partner_app/data/repository/task_booking_repo.dart';

class TaskBookingHistoryCubit extends Cubit<TaskBookingHistoryState> {
  TaskBookingHistoryCubit() : super(TaskBookingHistoryInitial());
  TaskBookingModel? taskBookingModel;
  TaskBookingRepo taskBookingRepo = TaskBookingRepoImplement();
  TaskBookingRating? rating;
  final HiveService _hiveService = HiveService();

  init(BuildContext context, TaskBookingModel taskBooking) async {
    emit(TaskBookingHistoryLoading());
    taskBookingModel = taskBooking;
    await getRating();
    emit(TaskBookingHistoryLoaded());
  }

  getRating() async {
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    rating = await taskBookingRepo.getRatingTaskBooking(
        taskBookingModel: taskBookingModel!, token: token);
  }
}
