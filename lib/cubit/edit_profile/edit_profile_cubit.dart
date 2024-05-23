import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/edit_profile/edit_profile_state.dart';
import 'package:partner_app/cubit/home/home_page/home_page_cubit.dart';
import 'package:partner_app/cubit/profile/profile_cubit.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/user_model.dart';
import 'package:partner_app/data/repository/user_repo.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserRepository userRepository = UserRepositoryImplement();
  final HiveService _hiveService = HiveService();
  User? userModel;
  init(BuildContext context) {
    emit(EditProfileInitial());
    userModel = BlocProvider.of<HomePageCubit>(context).usermodel;
    fullNameController.text = userModel!.fullName!;
    emailController.text = userModel!.email!;
    phoneNumberController.text = userModel!.phoneNumber!;
    emit(EditProfileLoaded());
  }

  updateProfile(BuildContext context) async {
    emit(EditProfileUpdating());
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    bool result = await userRepository.updateUser(
        id: userModel!.id!,
        phoneNumber: phoneNumberController.text,
        email: emailController.text,
        fullName: fullNameController.text,
        token: token);
    if (result) {
      print(userModel);

      // fullNameController.clear();
      // emailController.clear();
      // phoneNumberController.clear();
      // passwordController.clear();
      Future.delayed(const Duration(seconds: 2), () {
        emit(EditProfileLoaded());
        Navigator.pop(context);
      });
    } else {
      print("errr");
    }
  }
}

class ProfileCubit {}
