import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/sign_in/sign_in_state.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/user_model.dart';
import 'package:partner_app/data/repository/user_repo.dart';
import 'package:partner_app/route/app_route.dart';

class SignInPartnerCubit extends Cubit<SignInPartnerState> {
  SignInPartnerCubit() : super(SignInPartnerInitial());

  TextEditingController userName = TextEditingController(text: '0123456789');
  TextEditingController passWord = TextEditingController(text: 'khoakhoa');
  HiveService hiveService = HiveService();
  UserRepository userRepository = UserRepositoryImplement();

  TextEditingController fullNameController = TextEditingController(text: '');
  TextEditingController phoneNumberController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  init(context) async {
    String? id = await hiveService.getBox("id", HiveService.boxUserModel);
    print(id);
    if (id != null) {
      Navigator.pushNamed(context, AppRouteUser.homePartner);
    }
  }

  Future<void> login(BuildContext context) async {
    try {
      emit(SignInPartnerInitial());
      print(userName.text);
      print(passWord.text);
      // String? deviceId = await _getId();
      // print(deviceId);
      UserModel? userModel =
          await userRepository.userSignIn(userName.text, passWord.text);
      if (userModel != null) {
        print('done');
        print(userModel.token);
        print(userModel.user!.id);
        print(userModel.user!.fullName);
        await hiveService.addBox(
            "token", userModel.token!, HiveService.boxUserModel);
        await hiveService.addBox(
            "id", userModel.user!.id!, HiveService.boxUserModel);
        await hiveService.addBox(
            "fullName", userModel.user!.fullName!, HiveService.boxUserModel);

        emit(SignInPartnerLoaded());
        Navigator.pushNamed(context, AppRouteUser.homePartner);
      } else {
        print('Login err');
        emit(SignInPartnerError());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // signUp(BuildContext context) async {
  //   UserModel? userModel = await userRepository.userSignUp(
  //       userName: phoneNumberController.text,
  //       passWord: passwordController.text,
  //       email: emailController.text,
  //       fullName: fullNameController.text);
  //   if (userModel != null) {
  //     print('done');
  //     print(userModel.token);
  //     print(userModel.user!.id);
  //     print(userModel.user!.fullName);
  //     await hiveService.addBox(
  //         "token", userModel.token!, HiveService.boxUserModel);
  //     await hiveService.addBox(
  //         "id", userModel.user!.id!, HiveService.boxUserModel);
  //     await hiveService.addBox(
  //         "fullName", userModel.user!.fullName!, HiveService.boxUserModel);

  //     emit(SignInLoaded());
  //     Navigator.pushNamed(context, AppRouteUser.home);
  //   }
  // }

  // Future<String?> _getId() async {
  //   var deviceInfo = DeviceInfoPlugin();
  //   if (Platform.isIOS) {
  //     // import 'dart:io'
  //     var iosDeviceInfo = await deviceInfo.iosInfo;
  //     return iosDeviceInfo.identifierForVendor; // unique ID on iOS
  //   } else if (Platform.isAndroid) {
  //     var androidDeviceInfo = await deviceInfo.androidInfo;
  //     return androidDeviceInfo.id; // unique ID on Android
  //   }
  //   return null;
  // }
}
