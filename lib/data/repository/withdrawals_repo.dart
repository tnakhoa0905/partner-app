import 'dart:convert';

import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/data/model/withdrawals_model.dart';
import 'package:http/http.dart' as http;

abstract class WithdrawalsRepository {
  Future<List<WithdrawalsModel>> getAllWal(
      {required String userId, required String token});
}

class WithdrawalsRepositoryImplement extends WithdrawalsRepository {
  @override
  Future<List<WithdrawalsModel>> getAllWal(
      {required String userId, required String token}) async {
    // TODO: implement getAllWal
    try {
      print('go go');
      print(userId);
      final response =
          await http.post(Uri.parse(UrlApiAppUser.getAllWithdrawalas),
              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
                'Authorization': 'Bearer $token',
              },
              body: jsonEncode({
                "userId": userId,
              }));
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('WithdrawalsModel');
        List<dynamic> result = jsonDecode(response.body)["data"];

        return result.map((e) => WithdrawalsModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
