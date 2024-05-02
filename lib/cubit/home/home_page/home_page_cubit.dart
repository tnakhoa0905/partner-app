import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/cubit/home/home_page/home_page_state.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/clean_task_model.dart';
import 'package:partner_app/data/model/permanent_model.dart';
import 'package:partner_app/data/model/task_booking_model.dart';
import 'package:http/http.dart' as http;

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());
  final HiveService _hiveService = HiveService();
  List<TaskBookingModel> listTaskBooking = [];
  List<PermanentModel> listPermanent = [];
  List<CleanModel> listClean = [];

  init() async {
    print('go');
    List<TaskBookingModel> listTaskBookingResult = [];
    List<PermanentModel> listPermanentResult = [];
    List<CleanModel> listCleanResult = [];
    String idUser = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;

    try {
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(Uri.parse(UrlApiAppUser.getWaitingJob),
          headers: headers, body: jsonEncode({"taskerId": idUser}));
      if (response.statusCode == 200) {
        print(response.body);
        for (var item in jsonDecode(response.body)["data"]
            ['taskBookingWaiting']) {
          listTaskBookingResult.add(TaskBookingModel.fromJson(item));
        }

        for (var item in jsonDecode(response.body)["data"]
            ['cleanBookingWaiting']) {
          listCleanResult.add(CleanModel.fromJson(item));
        }
        listTaskBooking = listTaskBookingResult;
        listPermanent = listPermanentResult;
        listClean = listCleanResult;
        print(listTaskBooking);

        print(listClean);
        emit(HomePageLoaded());
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
