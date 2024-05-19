import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/home/home_page/home_page_cubit.dart';
import 'package:partner_app/cubit/profile/profile_state.dart';
import 'package:partner_app/cubit/sign_in/sign_in_cubit.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/user_model.dart';
import 'package:partner_app/route/app_route.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  ProfilePageCubit() : super(ProfilePageInitial());
  final HiveService _hiveService = HiveService();

  User? usermodel;
  init(BuildContext context) {
    usermodel = BlocProvider.of<HomePageCubit>(context).usermodel!;
  }

  logout(BuildContext context) async {
    await _hiveService.closeBox(HiveService.boxUserModel);
    Navigator.pushNamedAndRemoveUntil(
        context, AppRouteUser.splash, (Route<dynamic> route) => false);
  }
}
