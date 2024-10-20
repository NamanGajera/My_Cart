part of 'sign_up_screen_bloc.dart';

@immutable
sealed class SignUpScreenState {}

class APIFailureState extends SignUpScreenState {
  final int errorCode; // HTTP status code
  final String errorMessage; // Detailed error message

  APIFailureState(this.errorCode, this.errorMessage);

  @override
  String toString() {
    return 'APIFailureState { errorCode: $errorCode, errorMessage: "$errorMessage" }';
  }
}

class SignUpScreenInitialState extends SignUpScreenState {}

class SignUpScreenLoadingState extends SignUpScreenState{
  final bool loading;
  SignUpScreenLoadingState(this.loading);
}

class SignUpEventState extends SignUpScreenState{
  final SignUpModel signUpModel;
  SignUpEventState(this.signUpModel);
}

class LoginEventState extends SignUpScreenState{
  final LoginModel loginModel;
  LoginEventState(this.loginModel);
}
