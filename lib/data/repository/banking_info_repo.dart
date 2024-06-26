import 'dart:convert';

import 'package:partner_app/constant/constant.dart';
import 'package:partner_app/data/model/bank_account_model.dart';
import 'package:partner_app/data/model/bank_model.dart';
import 'package:http/http.dart' as http;

abstract class BankingInfoRepository {
  Future<List<BankModel>> getAllBank();
  Future<BankAccountModel?> createBankAccount(
      {required String token, required BankAccountModel bankAccountModel});
  Future<BankAccountModel?> getBankAccount(
      {required String token, required String userId});
  Future<String?> createDeposit(
      {required String userId, required String token, required int amount});
  Future<String?> createDepositRequest(
      {required String userId,
      required String token,
      required int amount,
      required String idDeposit});
}

class BankingInfoRepositoryImplement extends BankingInfoRepository {
  @override
  Future<List<BankModel>> getAllBank() async {
    // TODO: implement getAllBank
    try {
      print('go go');

      final response = await http.get(
        Uri.parse("https://api.vietqr.io/v2/banks"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> result = jsonDecode(response.body)["data"];
        return result.map((e) => BankModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<BankAccountModel?> createBankAccount(
      {required String token,
      required BankAccountModel bankAccountModel}) async {
    // TODO: implement createBankAccount
    try {
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(
          Uri.parse(
              "${UrlApiAppUser.host}userbankaccounts/create_user_bank_account"),
          headers: headers,
          body: jsonEncode(bankAccountModel.toJson()));
      if (response.statusCode == 200) {
        return BankAccountModel.fromJson(jsonDecode(response.body)["data"]);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<BankAccountModel?> getBankAccount(
      {required String token, required String userId}) async {
    // TODO: implement getBankAccount
    try {
      var headers = {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(
          Uri.parse(
              "${UrlApiAppUser.host}userbankaccounts/get_user_bank_account_by_userid"),
          headers: headers,
          body: jsonEncode({"userId": userId}));
      if (response.statusCode == 200) {
        print(jsonDecode(response.body)["data"]);
        if (jsonDecode(response.body)["data"].length == 0) {
          return null;
        }
        return BankAccountModel.fromJson(jsonDecode(response.body)["data"][0]);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String?> createDeposit(
      {required String userId,
      required String token,
      required int amount}) async {
    // TODO: implement createPaymentLink
    try {
      final response = await http.post(
          Uri.parse("${UrlApiAppUser.host}deposits/create_deposit"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({"userId": userId, "amount": amount}));

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body)["data"]["_id"];
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String?> createDepositRequest(
      {required String userId,
      required String token,
      required int amount,
      required String idDeposit}) async {
    // TODO: implement createDepositRequest
    try {
      final response = await http.post(
          Uri.parse("${UrlApiAppUser.host}payments/create_payment_deposit"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            "_id": idDeposit,
            "userId": userId,
            "amount": amount,
            "type": 9
          }));

      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body)["data"]["checkoutUrl"];
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
