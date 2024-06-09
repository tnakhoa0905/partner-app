import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/withdrawals/withdrawals_cubit.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WithDrawalCubit extends Cubit<WithDrawalState> {
  WithDrawalCubit() : super(WithDrawalInitial());
  TextEditingController money = TextEditingController();
  TextEditingController stk = TextEditingController();
  TextEditingController nameBank = TextEditingController();
  TextEditingController name = TextEditingController();
  final HiveService _hiveService = HiveService();

  init() async {
    money.text = '';
    stk.text = '';
    nameBank.text = '';
    name.text = '';
    emit(WithDrawalLoaded());
  }

  orderWithDrawal(BuildContext context) async {
    String idUser = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    try {
      final response = await http.post(
          Uri.parse("https://apitasks.pdteam.net/payments/create_payment_link"),
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
      if (response.statusCode == 200) {
        print('ccccc');
        print(jsonDecode(response.body)["data"]);
        // return true;
      }
      // return false;
    } catch (e) {
      throw Exception(e);
    }
    emit(WithDrawalLoaded());
    Navigator.pop(context);
  }
}
