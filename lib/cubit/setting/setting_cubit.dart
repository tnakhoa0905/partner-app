import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/cubit/home/home_page/home_page_cubit.dart';
import 'package:partner_app/cubit/setting/setting_state.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:partner_app/route/app_route.dart';

class SettingPageCubit extends Cubit<SettingPageState> {
  SettingPageCubit() : super(SettingPageInitial());
  final HiveService _hiveService = HiveService();
  List<int> listCalendar = [];
  User? usermodel;
  bool task = false;
  bool clean = false;
  List<int> listCalendarNew = [];
  bool taskNew = false;
  bool cleanNew = false;
  init(BuildContext context) {
    usermodel = BlocProvider.of<HomePageCubit>(context).usermodel!;
    listCalendar = BlocProvider.of<HomePageCubit>(context).usermodel!.freetime
        as List<int>;
    List<int> listJob = BlocProvider.of<HomePageCubit>(context)
        .usermodel!
        .partnerServiceType as List<int>;
    print(listJob);
    if (listJob.length == 2) {
      task = true;
      clean = true;
    } else if (listJob.contains(1)) {
      clean = true;
    } else if (listJob.contains(0)) {
      task = true;
    }
    emit(SettingPageLoaded());
  }

  initNew(BuildContext context) {
    emit(SettingPageLoaded());
  }

  setTask(bool value) {
    taskNew = value;
    emit(SettingPageLoaded());
  }

  setClean(bool value) {
    cleanNew = value;
    emit(SettingPageLoaded());
  }

  updateFreeTimeNew(BuildContext context) async {
    // TODO: implement getWaitingTask
    String idUser = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    List<int> listJob = [];
    if (taskNew = true) {
      listJob.add(0);
    }
    if (cleanNew = true) {
      listJob.add(1);
    }
    try {
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(Uri.parse(UrlApiAppUser.updateFreeTime),
          headers: headers,
          body: jsonEncode({
            "_id": idUser, //id cua tasker
            "freetime": listCalendarNew,
            "partnerServiceType": listJob // 0: task, 1:clean
          }));
      if (response.statusCode == 200) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRouteUser.homePartner, (Route<dynamic> route) => false);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  updateFreeTime(BuildContext context) async {
    // TODO: implement getWaitingTask
    String idUser = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    List<int> listJob = [];
    if (task = true) {
      listJob.add(0);
    }
    if (clean = true) {
      listJob.add(1);
    }
    try {
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(Uri.parse(UrlApiAppUser.updateFreeTime),
          headers: headers,
          body: jsonEncode({
            "_id": idUser, //id cua tasker
            "freetime": listCalendar,
            "partnerServiceType": listJob // 0: task, 1:clean
          }));
      if (response.statusCode == 200) {
        BlocProvider.of<HomePageCubit>(context).usermodel!.freetime =
            listCalendar;
        BlocProvider.of<HomePageCubit>(context).usermodel!.partnerServiceType =
            listJob;
        // Navigator.pushNamedAndRemoveUntil(
        //     context, AppRouteUser.homePartner, (Route<dynamic> route) => false);
        Navigator.pop(context);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
