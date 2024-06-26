abstract class WithDrawalState {
  WithDrawalState();
}

class WithDrawalInitial extends WithDrawalState {
  WithDrawalInitial();
}

class WithDrawalLoading extends WithDrawalState {
  WithDrawalLoading();
}

class WithDrawalLoaded extends WithDrawalState {
  String? error;
  WithDrawalLoaded({this.error = ""});
}

class WithDrawalError extends WithDrawalState {
  WithDrawalError();
}
