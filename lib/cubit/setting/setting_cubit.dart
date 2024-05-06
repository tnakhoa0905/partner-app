import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/setting/setting_state.dart';
import 'package:partner_app/cubit/sign_in/sign_in_cubit.dart';
import 'package:partner_app/data/model/user_model.dart';

class SettingPageCubit extends Cubit<SettingPageState> {
  SettingPageCubit() : super(SettingPageInitial());
  List<int> listCalendar = [];
  UserModel? usermodel;
  init(BuildContext context) {
    usermodel = BlocProvider.of<SignInPartnerCubit>(context).user!;
    listCalendar = BlocProvider.of<SignInPartnerCubit>(context)
        .user!
        .user!
        .freetime as List<int>;
    print(listCalendar);
  }
}
