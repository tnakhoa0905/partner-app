import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/banking_info/banking_info_state.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/model/bank_account_model.dart';
import 'package:partner_app/data/model/bank_model.dart';
import 'package:partner_app/data/repository/banking_info_repo.dart';
import 'package:partner_app/data/repository/withdrawals_repo.dart';

class BankingInfoCubit extends Cubit<BankingInfoState> {
  BankingInfoCubit() : super(BankingInfoInitial());
  TextEditingController stk = TextEditingController();
  TextEditingController nameBank = TextEditingController();
  TextEditingController name = TextEditingController();
  List<BankModel> listBanking = [];
  BankingInfoRepository bankingInfoRepository =
      BankingInfoRepositoryImplement();
  final HiveService _hiveService = HiveService();
  BankAccountModel? bankAccountModel;
  String error = "";
  init() {
    bankAccountModel = null;
    name.clear();
    stk.clear();
    nameBank.clear();
    getBanking();
    getBankAccount();
    emit(BankingInfoLoaded());
  }

  getBanking() async {
    listBanking = await bankingInfoRepository.getAllBank();
    emit(BankingInfoLoaded());
  }

  getBankAccount() async {
    String taskerId = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    bankAccountModel = await bankingInfoRepository.getBankAccount(
        token: token, userId: taskerId);
    if (bankAccountModel != null) {
      name.text = bankAccountModel!.userAccountName!;
      stk.text = bankAccountModel!.bankAccountNumber!;
      nameBank.text = bankAccountModel!.bankAccountName!;
      emit(BankingInfoLoaded());
    } else {
      // emit(BankingInfoLoaded(error: "Tài khoản đã tồn tại"));
    }
  }

  createBanking() async {
    print('create');
    bool validate = validateForm();
    if (validate) {
      String taskerId = (await _hiveService.getBox("id", 'userModel'))!;
      String token = (await _hiveService.getBox("token", 'userModel'))!;
      bankAccountModel = await bankingInfoRepository.createBankAccount(
          token: token,
          bankAccountModel: BankAccountModel(
              userId: taskerId,
              userAccountName: name.text,
              bankAccountName: nameBank.text,
              bankAccountNumber: stk.text));
      emit(BankingInfoLoaded());
    }
  }

  bool validateForm() {
    print('aa');
    error = "";
    if (name.text.isEmpty) {
      error = "$error\n Tên không được để trống";
    }
    if (stk.text.isEmpty) {
      error = "$error\n Số tài khoản không được để trống";
    }
    if (nameBank.text.isEmpty) {
      error = "$error\n Tên ngân hàng không được để trống";
    }

    if (error.isNotEmpty) {
      print(error);
      emit(BankingInfoLoaded(error: error));
      return false;
    }
    print(error);
    return true;
  }
}
