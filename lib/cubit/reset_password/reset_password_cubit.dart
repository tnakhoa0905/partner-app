import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/reset_password/reset_password_state.dart';
import 'package:partner_app/data/fcm_api.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/user_model.dart';
import 'package:partner_app/route/app_route.dart';

import '../../data/repository/user_repo.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController verifyOtpController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  UserRepository userRepository = UserRepositoryImplement();
  HiveService hiveService = HiveService();

  init() {
    phoneNumberController.clear();
    verifyOtpController.clear();
    newPasswordController.clear();
  }

  veryfiPhone(BuildContext context) async {
    final completer = Completer<String>();
    FirebaseAuth? auth = FirebaseAuth.instance;
    String phoneFormat = phoneNumberController.text.replaceFirst('0', '+84');
    await auth.verifyPhoneNumber(
      timeout: const Duration(seconds: 30),
      phoneNumber: phoneFormat,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // await auth.signInWithCredential(credential).then((value) async {
        //   if (value.user != null) {
        //     print("Done !! verificationCompleted");
        //   } else {
        //     print("Failed!! verificationCompleted");
        //   }
        // }).catchError((e) {
        //   // Fluttertoast.showToast(msg: 'Something Went Wrong: ${e.toString()}');
        //   print(e);
        // });
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        Navigator.pushNamed(
          context,
          AppRouteUser.veryfiOtpPage,
          arguments: verificationId,
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  verifyOtp(
      {required String verificationId,
      required String smsCode,
      required BuildContext context}) async {
    try {
      final cred = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      var result = await FirebaseAuth.instance.signInWithCredential(cred);
      if (result.additionalUserInfo?.profile != null) {
        Navigator.pushNamed(context, AppRouteUser.changePasswordPage);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  changePassword(BuildContext context) async {
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d).{9,}$');
    UserModel? userModel = await login(context);
    if (userModel != null)
    // ignore: curly_braces_in_flow_control_structures
    if (regex.hasMatch(newPasswordController.text)) {
      print("ok");
      await userRepository.changePassword(
          userId: '',
          token: userModel.token!,
          password: newPasswordController.text);
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRouteUser.homePartner,
        (route) => false,
      );
    } else {
      print("no");
    }
    else {
      print('user ko ton tai');
    }
  }

  Future<UserModel?> login(BuildContext context) async {
    try {
      String fcmToken = '';
      String phoneFormat = phoneNumberController.text.replaceFirst('0', '+84');

      try {
        fcmToken = await FirebaseApi().getToken();
        print("fcm token$fcmToken");
      } catch (e) {}
      UserModel? userModel =
          await userRepository.userSignInByPhone(phoneFormat);
      if (userModel != null) {
        await hiveService.addBox(
            "token", userModel.token!, HiveService.boxUserModel);
        await hiveService.addBox(
            "id", userModel.user!.id!, HiveService.boxUserModel);
        await hiveService.addBox(
            "fullName", userModel.user!.fullName!, HiveService.boxUserModel);

        return userModel;
      } else {
        print('Login err');
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
