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
      emit(SignInPartnerError());
      throw Exception(e);
    }
  }
}
