part of 'sign_up_screen_bloc.dart';

@immutable
sealed class SignUpScreenEvent {}

class SignUpScreenInitialEvent extends SignUpScreenEvent{}

class SignUpEvent extends SignUpScreenEvent{
  final Map<String,dynamic> signUpBody;
  SignUpEvent(this.signUpBody);
}

class LoginEvent extends SignUpScreenEvent{
  final Map<String,dynamic> loginBody;
  LoginEvent(this.loginBody);
}
