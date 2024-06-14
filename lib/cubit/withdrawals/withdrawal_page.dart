import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/withdrawals/withdrawals_state.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:partner_app/data/model/withdrawals_model.dart';
import 'package:partner_app/data/repository/withdrawals_repo.dart';

class WithDrawalCubit extends Cubit<WithDrawalState> {
  WithDrawalCubit() : super(WithDrawalInitial());
  TextEditingController money = TextEditingController();
  TextEditingController stk = TextEditingController();
  TextEditingController nameBank = TextEditingController();
  TextEditingController name = TextEditingController();
  WithdrawalsRepository withdrawalsRepository =
      WithdrawalsRepositoryImplement();
  final HiveService _hiveService = HiveService();
  List<WithdrawalsModel> listWithdraw = [];
  List<WithdrawalsModel> listWithdrawDone = [];
  init() async {
    money.text = '';
    stk.text = '';
    nameBank.text = '';
    name.text = '';
    emit(WithDrawalLoaded());
  }

  initWithdraw() async {
    String userId = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    listWithdrawDone = [];
    listWithdraw = [];
    List<WithdrawalsModel> listWithdrawResult =
        await withdrawalsRepository.getAllWal(userId: userId, token: token);
    for (var element in listWithdrawResult) {
      if (element.status == 0) {
        listWithdraw.add(element);
      } else {
        listWithdrawDone.add(element);
      }
    }
    emit(WithDrawalLoaded());
  }

  orderWithDrawal(BuildContext context) async {
    String idUser = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    try {
      final response = await http.post(
          Uri.parse(
              "https://apitasks.pdteam.net/withdrawals/create_withdrawal_request"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            "userId": idUser, //id partner
            "amount": int.parse(money.text),
            "accountNumber": stk.text,
            "bank": nameBank.text,
            "bankAccountName": name.text
          }));
      print(response.statusCode);
      print(jsonDecode(response.body)["data"]);
      if (response.statusCode == 200) {
        print('ccccc');
        print(jsonDecode(response.body)["data"]);
        print(true);
        initWithdraw();
        emit(WithDrawalLoaded());
        Navigator.pop(context);
        // return;
      } else {
        print(false);
        emit(WithDrawalError());
      }

      // return false;
    } catch (e) {
      throw Exception(e);
    }
  }
}
