abstract class BankingInfoState {
  BankingInfoState();
}

class BankingInfoInitial extends BankingInfoState {
  BankingInfoInitial();
}

class BankingInfoLoaded extends BankingInfoState {
  String? error;
  BankingInfoLoaded({this.error = ""});
}

class BankingInfoError extends BankingInfoState {
  BankingInfoError();
}
