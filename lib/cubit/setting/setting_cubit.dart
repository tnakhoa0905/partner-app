import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/cubit/home/home_page/home_page_cubit.dart';
import 'package:partner_app/cubit/setting/setting_state.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/user_model.dart';
import 'package:http/http.dart' as http;

class SettingPageCubit extends Cubit<SettingPageState> {
  SettingPageCubit() : super(SettingPageInitial());
  final HiveService _hiveService = HiveService();
  List<int> listCalendar = [];
  User? usermodel;
  init(BuildContext context) {
    usermodel = BlocProvider.of<HomePageCubit>(context).usermodel!;
    listCalendar = BlocProvider.of<HomePageCubit>(context).usermodel!.freetime
        as List<int>;
  }

  updateFreeTime(BuildContext context) async {
    // TODO: implement getWaitingTask
    String idUser = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
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
            "partnerServiceType": [0, 1] // 0: task, 1:clean
          }));
      if (response.statusCode == 200) {
        BlocProvider.of<HomePageCubit>(context).usermodel!.freetime =
            listCalendar;
        BlocProvider.of<HomePageCubit>(context).usermodel!.freetime =
            listCalendar;
        // Navigator.pushNamedAndRemoveUntil(
        //     context, AppRouteUser.homePartner, (Route<dynamic> route) => false);
        Navigator.pop(context);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
