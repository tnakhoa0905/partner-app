import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/cubit/home/home_page/home_page_state.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/clean_task_model.dart';
import 'package:partner_app/data/model/permanent_model.dart';
import 'package:partner_app/data/model/task_booking_model.dart';
import 'package:http/http.dart' as http;
import 'package:partner_app/data/repository/task_booking_repo.dart';
import 'package:partner_app/route/app_route.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());
  final HiveService _hiveService = HiveService();
  List<TaskBookingModel> listTaskBooking = [];
  List<PermanentModel> listPermanent = [];
  List<CleanModel> listClean = [];
  List<TaskBookingModel> listTaskBookingDone = [];
  List<PermanentModel> listPermanentDone = [];
  List<CleanModel> listCleanDone = [];
  TaskBookingRepo taskBookingRepo = TaskBookingRepoImplement();
  init() async {
    print('go');
    List<TaskBookingModel> listTaskBookingResult = [];
    List<CleanModel> listCleanResult = [];
    //
    List<TaskBookingModel> listTaskBookingDoneResult = [];
    List<CleanModel> listCleanDoneResult = [];
    String idUser = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;

    try {
      final response = await taskBookingRepo.getWaitingTask(idUser, token);
      if (response != null) {
        for (var item in jsonDecode(response)["data"]['taskBookingWaiting']) {
          listTaskBookingResult.add(TaskBookingModel.fromJson(item));
        }

        for (var item in jsonDecode(response)["data"]['cleanBookingWaiting']) {
          listCleanResult.add(CleanModel.fromJson(item));
        }
        listTaskBooking = listTaskBookingResult;
        listClean = listCleanResult;
      }
      final responseDone = await taskBookingRepo.getDoneTask(idUser, token);
      if (responseDone != null) {
        for (var item in jsonDecode(responseDone)["data"]['taskBookingDone']) {
          listTaskBookingDoneResult.add(TaskBookingModel.fromJson(item));
        }

        for (var item in jsonDecode(responseDone)["data"]['cleanBookingDone']) {
          listCleanDoneResult.add(CleanModel.fromJson(item));
        }
        listTaskBookingDone = listTaskBookingDoneResult;
        listCleanDone = listCleanDoneResult;
        print(listCleanDone);
        print(listTaskBookingDone);
      }
      emit(HomePageLoaded());
    } catch (e) {
      throw Exception(e);
    }
  }

  completeTask({
    required BuildContext context,
    required String taskId,
  }) async {
    String taskerId = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    bool result = await taskBookingRepo.completeTask(taskerId, taskId, token);
    if (result) {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRouteUser.homePartner, (Route<dynamic> route) => false);
    } else {
      print('error');
    }
  }

  cancelTask({
    required BuildContext context,
    required String taskId,
  }) async {
    String taskerId = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    bool result = await taskBookingRepo.cancelTask(taskerId, taskId, token);
    if (result) {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRouteUser.homePartner, (Route<dynamic> route) => false);
    } else {
      print('error');
    }
  }
}
