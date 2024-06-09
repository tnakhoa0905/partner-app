import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/task_detail/task_detail_state.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/task_booking_model.dart';
import 'package:partner_app/data/repository/task_booking_repo.dart';

class TaskBookingDetailCubit extends Cubit<TaskBookingDetailState> {
  TaskBookingDetailCubit() : super(TaskBookingDetailInitial());

  TaskBookingModel? taskBookingModel;
  TaskBookingRepo taskBookingRepo = TaskBookingRepoImplement();
  final HiveService _hiveService = HiveService();

  init(String taskId) async {
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    taskBookingModel = await taskBookingRepo.getTaskBookingById(taskId, token);
    print("taskBookingModel");
    print(taskBookingModel);
    emit(TaskBookingDetailLoaded());
  }
}
