import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/sign_in/sign_in_state.dart';
import 'package:partner_app/data/fcm_api.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/user_model.dart';
import 'package:partner_app/data/repository/user_repo.dart';
import 'package:partner_app/route/app_route.dart';

class SignInPartnerCubit extends Cubit<SignInPartnerState> {
  SignInPartnerCubit() : super(SignInPartnerInitial());

  TextEditingController userName = TextEditingController(text: '');
  TextEditingController passWord = TextEditingController(text: '');
  HiveService hiveService = HiveService();
  UserRepository userRepository = UserRepositoryImplement();

  TextEditingController fullNameController = TextEditingController(text: '');
  TextEditingController phoneNumberController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  UserModel? user;
  init(context) async {
    String? id = await hiveService.getBox("id", HiveService.boxUserModel);
    print(id);
    userName.clear();
    passWord.clear();
    if (id != null) {
      Navigator.pushNamed(context, AppRouteUser.homePartner);
    }
  }

  initSignUp(context) async {
    phoneNumberController.clear();
    passwordController.clear();
    emailController.clear();
    fullNameController.clear();
    emit(SignInPartnerLoaded());
  }

  Future<void> login(BuildContext context) async {
    print("object");
    try {
      emit(SignInPartnerInitial());
      print(userName.text);
      print(passWord.text);
      final fcmToken = await FirebaseApi().getToken();
      print(fcmToken);

      UserModel? userModel = await userRepository.userSignIn(
          userName.text, passWord.text, fcmToken);
      if (userModel != null) {
        print('done');
        await hiveService.addBox(
            "token", userModel.token!, HiveService.boxUserModel);
        await hiveService.addBox(
            "id", userModel.user!.id!, HiveService.boxUserModel);
        await hiveService.addBox(
            "fullName", userModel.user!.fullName!, HiveService.boxUserModel);
        userName.clear();
        passWord.clear();
        emit(SignInPartnerLoaded());
        if (userModel.user!.freetime!.isNotEmpty) {
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
      } else {
        print('Login err');
        emit(SignInPartnerError());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  signUp(BuildContext context) async {
    UserModel? userModel = await userRepository.userSignUp(
        userName: phoneNumberController.text,
        passWord: passwordController.text,
        email: emailController.text,
        fullName: fullNameController.text);
    if (userModel != null) {
      print('done');
      print(userModel.token);
      print(userModel.user!.id);
      print(userModel.user!.fullName);
      phoneNumberController.clear();
      passwordController.clear();
      emailController.clear();
      fullNameController.clear();
      userName.clear();
      passWord.clear();
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRouteUser.signInPartner,
        (route) => false,
      );
    } else {
      print("sai roi");
    }
  }

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
