import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/profile/profile_state.dart';
import 'package:partner_app/data/fcm_api.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/repository/user_repo.dart';
import 'package:partner_app/route/app_route.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  ProfilePageCubit() : super(ProfilePageInitial());
  final HiveService _hiveService = HiveService();
  UserRepository userRepository = UserRepositoryImplement();

  // User? usermodel;
  // init(BuildContext context) {
  //   usermodel = BlocProvider.of<HomePageCubit>(context).usermodel!;
  // }

  logout(BuildContext context) async {
    String idUser = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    // BlocProvider.of<HomeCubit>(context).userModel = null;
    print(idUser);
    String fcmToken = await FirebaseApi().getToken();
    bool result = await userRepository.logOut(
        userId: idUser, token: token, fcmToken: fcmToken);
    await _hiveService.closeBox(HiveService.boxUserModel);
    // bool result = true;
    // if (result) {
    Future.delayed(const Duration(milliseconds: 200), () {
      Navigator.pushNamedAndRemoveUntil(
          context, AppRouteUser.splash, (Route<dynamic> route) => false);
    });
    // } else {
    //   print("dcm sai r ");
    // }
  }

  // getUser(BuildContext context) async {
  //   emit(ProfilePageLoading());
  //   String idUser = (await _hiveService.getBox("id", 'userModel'))!;
  //   String token = (await _hiveService.getBox("token", 'userModel'))!;
  //   try {
  //     usermodel = await userRepository.getUser(idUser, token);
  //     print(usermodel!.fullName);
  //     emit(ProfilePageLoaded());
  //   } catch (e) {
  //     Navigator.pushNamed(context, "error");
  //   }
  // }
}
