abstract class SignUpState {
  SignUpState();
}

class SignUpInitial extends SignUpState {
  SignUpInitial();
}

class SignUpLoaded extends SignUpState {
  SignUpLoaded();
}

class SignUpError extends SignUpState {
  String? error;
  SignUpError({this.error});
}
