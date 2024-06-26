import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/sign_up/sign_up_state.dart';
import 'package:partner_app/data/fcm_api.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/user_model.dart';
import 'package:partner_app/data/repository/user_repo.dart';
import 'package:partner_app/route/app_route.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  UserRepository userRepository = UserRepositoryImplement();
  HiveService hiveService = HiveService();

  TextEditingController fullNameController = TextEditingController(text: '');
  TextEditingController phoneNumberController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  init() {
    phoneNumberController.clear();
    passwordController.clear();
    emailController.clear();
    fullNameController.clear();
    emit(SignUpLoaded());
  }

  signUp(BuildContext context) async {
    final fcmToken = await FirebaseApi().getToken();
    Map<String, dynamic>? userModel = await userRepository.userSignUp(
      userName: phoneNumberController.text,
      passWord: passwordController.text,
      email: emailController.text,
      fullName: fullNameController.text,
    );
    print(userModel.toString());
    if (userModel != null && userModel["success"]) {
      phoneNumberController.clear();
      passwordController.clear();
      emailController.clear();
      fullNameController.clear();
      emit(SignUpLoaded());
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRouteUser.signInPartner,
        (route) => false,
      );
    } else {
      emit(SignUpError(error: checkInvalid(userModel!['data'])));
    }
  }

  String checkInvalid(String input) {
    switch (input) {
      case 'InvalidPhone':
        return "Số điện thoại của bạn không hợp lệ";
      case 'InvalidPassword':
        return "Mật khẩu của bạn phải trên 8 ký tự bao gồm ký tự số và ký tự chữ";
      case 'PhoneInUse':
        return "Số điện thoại này đã đăng ký";
      default:
        return "Email không hợp lệ";
    }
  }

  bool checkValidate() {
    String error = '';
    if (fullNameController.text.isEmpty) {
      error = "$error\n- Tên không được bỏ trống";
    }
    if (phoneNumberController.text.isEmpty) {
      error = "$error\n- Số điện thoại không được bỏ trống";
    }
    if (passwordController.text.isEmpty) {
      error = "$error\n- Mật khẩu không được bỏ trống";
    }
    if (error.isNotEmpty) {
      print(error);
      emit(SignUpError(error: error));
      return false;
    }
    return true;
  }
}
