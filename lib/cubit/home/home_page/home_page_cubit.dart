import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:partner_app/cubit/home/home_page/home_page_state.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/clean_task_model.dart';
import 'package:partner_app/data/model/permanent_model.dart';
import 'package:partner_app/data/model/task_booking_model.dart';
import 'package:partner_app/data/model/user_model.dart';
import 'package:partner_app/data/repository/clean_task_repo.dart';
import 'package:partner_app/data/repository/task_booking_repo.dart';
import 'package:partner_app/data/repository/user_repo.dart';
import 'package:partner_app/route/app_route.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:url_launcher/url_launcher.dart';

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
  CleanTaskRepository cleanTaskRepository = CleanTaskRepositoryImplement();
  UserRepository userRepository = UserRepositoryImplement();
  User? usermodel;
  List<dynamic> combinedList = [];
  List<dynamic> combinedListDone = [];
  late IO.Socket socket;
  init() async {
    print('go');
    List<TaskBookingModel> listTaskBookingResult = [];
    List<CleanModel> listCleanResult = [];
    List<TaskBookingModel> listTaskBookingDoneResult = [];
    List<CleanModel> listCleanDoneResult = [];
    String idUser = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    usermodel = await userRepository.getUser(idUser, token);
    initSocket(idUser);
    getCurrentGeolocator();
    if (usermodel!.level! > 1) {
      try {
        final response = await taskBookingRepo.getWaitingTask(idUser, token);
        if (response != null) {
          for (var item in jsonDecode(response)["data"]['taskBookingWaiting']) {
            listTaskBookingResult.add(TaskBookingModel.fromJson(item));
          }

          for (var item in jsonDecode(response)["data"]
              ['cleanBookingWaiting']) {
            listCleanResult.add(CleanModel.fromJson(item));
          }
          listTaskBooking = listTaskBookingResult;
          listClean = listCleanResult;
          List<dynamic> combinedListResult = [...listTaskBooking, ...listClean];
          combinedListResult.sort((a, b) => a.date.compareTo(b.date));
          combinedList = combinedListResult;
        }
        final responseDone = await taskBookingRepo.getDoneTask(idUser, token);
        if (responseDone != null) {
          for (var item in jsonDecode(responseDone)["data"]
              ['taskBookingDone']) {
            listTaskBookingDoneResult.add(TaskBookingModel.fromJson(item));
          }

          for (var item in jsonDecode(responseDone)["data"]
              ['cleanBookingDone']) {
            listCleanDoneResult.add(CleanModel.fromJson(item));
          }
          listTaskBookingDone = listTaskBookingDoneResult;
          listCleanDone = listCleanDoneResult;
          List<dynamic> combinedListResultDone = [
            ...listTaskBookingDone,
            ...listCleanDone
          ];
          combinedListResultDone.sort((a, b) => a.date.compareTo(b.date));
          combinedListDone = combinedListResultDone;
        }
        emit(HomePageLoaded());
      } catch (e) {
        throw Exception(e);
      }
    } else {
      emit(HomePageLoaded());
    }
  }

  void getCurrentGeolocator() async {
    String idUser = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    Position position = await determinePosition();
    print(Geolocator.distanceBetween(position.latitude, position.longitude,
        16.463264092079807, 107.58998684300418));
    bool result = await userRepository.updateLocation(
        userId: idUser,
        token: token,
        lat: position.latitude,
        lng: position.longitude);
    print(result);
  }

  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Local permisstion are denied");
      }
    }
    return Geolocator.getCurrentPosition();
  }

  getList() async {
    print('Get list');
    List<TaskBookingModel> listTaskBookingResult = [];
    List<CleanModel> listCleanResult = [];
    //
    List<TaskBookingModel> listTaskBookingDoneResult = [];
    List<CleanModel> listCleanDoneResult = [];
    String idUser = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    usermodel = await userRepository.getUser(idUser, token);
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
      }
      emit(HomePageLoaded());
    } catch (e) {
      throw Exception(e);
    }
  }

  initSocket(
    String userId,
  ) async {
    socket = IO.io(
        'https://apitasks.pdteam.net/',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .setQuery(
              {
                "user": jsonEncode({
                  'userId': userId,
                }),
                "citySettingModelId": "663f40875bc3c16fac4fa60f"
              },
            )
            .enableAutoConnect()
            .enableReconnection()
            .setReconnectionDelay(3000)
            .setExtraHeaders(
                {'Content-Type': 'application/x-www-form-urlencoded'})
            .build());
    socket.onConnect((data) => {print('connecttion')});
    socket.onConnectError((data) => {print("wrong in $data")});
    socket.connect();
  }

  completeTaskBooking({
    required BuildContext context,
    required String taskId,
    required TaskBookingModel taskBookingModel,
  }) async {
    String taskerId = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    bool result = await taskBookingRepo.completeTask(
        taskerId, taskBookingModel.id!, token);
    print("in complete task $result");
    if (result) {
      socket.emit('partner_done_task', {
        "userId": taskBookingModel.userId!,
        "note": "Taker donetask",
        "type": "taskBooking",
        "_id": taskBookingModel.id
      });
      Navigator.pushNamedAndRemoveUntil(
          context, AppRouteUser.homePartner, (Route<dynamic> route) => false);
    } else {
      print('error');
    }
  }

  cancelTaskBooking({
    required BuildContext context,
    required String taskId,
    required TaskBookingModel taskBookingModel,
    required String cancelReason,
  }) async {
    String taskerId = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    bool result = await taskBookingRepo.cancelTask(
        taskerId: taskerId,
        taskId: taskId,
        token: token,
        cancelReason: cancelReason);
    if (result) {
      socket.emit('partner_cancel_task', {
        "note": "Taker donetask",
        "type": "taskBooking",
        "_id": taskBookingModel.id,
        "userId": taskBookingModel.userId
      });

      Navigator.pushNamedAndRemoveUntil(
          context, AppRouteUser.homePartner, (Route<dynamic> route) => false);
    } else {
      print('error');
    }
  }

  completeCleanBooking({
    required BuildContext context,
    required String taskId,
    required CleanModel cleanModel,
  }) async {
    String taskerId = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    bool result =
        await cleanTaskRepository.completeTask(taskerId, cleanModel.id!, token);
    if (result) {
      socket.emit('partner_done_task', {
        "userId": cleanModel.userId!,
        "note": "Taker donetask",
        "type": "cleanBooking",
        "_id": cleanModel.id
      });
      Navigator.pushNamedAndRemoveUntil(
          context, AppRouteUser.homePartner, (Route<dynamic> route) => false);
    } else {
      print('error');
    }
  }

  cancelCleanBooking({
    required BuildContext context,
    required String taskId,
    required CleanModel cleanModel,
    required String cancelReason,
  }) async {
    String taskerId = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    bool result = await cleanTaskRepository.cancelTask(
        taskerId: taskerId,
        taskId: taskId,
        token: token,
        cancelReason: cancelReason);
    if (result) {
      socket.emit('partner_cancel_task', {
        "note": "Taker donetask",
        "type": "cleanBooking",
        "_id": cleanModel.id,
        "userId": cleanModel.userId
      });

      Navigator.pushNamedAndRemoveUntil(
          context, AppRouteUser.homePartner, (Route<dynamic> route) => false);
    } else {
      print('error');
    }
  }

  createPaymentLink(TaskBookingModel taskBookingModel) async {
    String? launchUr =
        await taskBookingRepo.createPaymentLink(taskBookingModel);
    if (launchUr != null) {
      launchUrl(Uri.parse(launchUr), mode: LaunchMode.externalApplication);
    }
  }

  createPaymentLinkCleanModel(CleanModel cleanModel) async {
    String? launchUr = await taskBookingRepo.createPaymentLinkClean(cleanModel);
    if (launchUr != null) {
      launchUrl(Uri.parse(launchUr), mode: LaunchMode.externalApplication);
    }
  }
}
