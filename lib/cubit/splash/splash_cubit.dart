import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/splash/splash_state.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/user_model.dart';
import 'package:partner_app/data/repository/user_repo.dart';
import 'package:partner_app/route/app_route.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());
  final HiveService _hiveService = HiveService();
  UserRepository userRepository = UserRepositoryImplement();
  User? usermodel;
  init(BuildContext context) async {
    print('init?');
    Future.delayed(const Duration(seconds: 2));

    String? idUser = await _hiveService.getBox("id", 'userModel');
    String? token = await _hiveService.getBox("token", 'userModel');

    Future.delayed(const Duration(seconds: 4));

    if (idUser != null && token != null) {
      print('here?');
      print(idUser);
      usermodel = await userRepository.getUser(idUser, token);
      if (usermodel!.freetime!.isNotEmpty) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouteUser.homePartner,
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouteUser.settingNew,
          (route) => false,
        );
      }
      // ignore: use_build_context_synchronously
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
