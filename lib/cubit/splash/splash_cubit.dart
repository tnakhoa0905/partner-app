import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/splash/splash_state.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/route/app_route.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  final HiveService _hiveService = HiveService();
  init(BuildContext context) async {
    print('init?');
    Future.delayed(const Duration(seconds: 2));

    String? idUser = await _hiveService.getBox("id", 'userModel');
    String? token = await _hiveService.getBox("token", 'userModel');

    Future.delayed(const Duration(seconds: 4));

    if (idUser != null && token != null) {
      print('here?');
      print(idUser);
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRouteUser.homePartner,
        (route) => false,
      );
    } else {
      print('here');
      // ignore: use_build_context_synchronously
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRouteUser.signInPartner,
        (route) => false,
      );
    }
  }
}
