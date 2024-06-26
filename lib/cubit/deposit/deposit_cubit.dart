import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:partner_app/cubit/deposit/deposit_state.dart';
import 'package:partner_app/data/hive_service.dart';
import 'package:partner_app/data/repository/banking_info_repo.dart';
import 'package:url_launcher/url_launcher.dart';

class DepositCubit extends Cubit<DepositState> {
  DepositCubit() : super(DepositInitial());
  TextEditingController money = TextEditingController();
  BankingInfoRepository bankingInfoRepository =
      BankingInfoRepositoryImplement();
  final HiveService _hiveService = HiveService();
  init() {
    money.clear();
    emit(DepositLoaded());
  }

  createPaymentLink() async {
    print("1");
    String taskerId = (await _hiveService.getBox("id", 'userModel'))!;
    String token = (await _hiveService.getBox("token", 'userModel'))!;
    String? id = await bankingInfoRepository.createDeposit(
        userId: taskerId,
        token: token,
        amount: int.parse(money.text.replaceAll(',', '')));
    print(id);
    print("2");

    if (id != null) {
      String? launchUr = await bankingInfoRepository.createDepositRequest(
          idDeposit: id,
          amount: int.parse(
            money.text.replaceAll(',', ''),
          ),
          userId: taskerId,
          token: token);
      if (launchUr != null) {
        launchUrl(Uri.parse(launchUr), mode: LaunchMode.externalApplication);
      }
    }
  }
}
