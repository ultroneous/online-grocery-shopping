part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final LoginModel loginModel;
  LoginSuccess(this.loginModel);
}

class LoginError extends AuthState {
  final AppException exception;
  LoginError(this.exception);
}

class SignupLoading extends AuthState {}

class SignupSuccess extends AuthState {
  final LoginModel loginModel;
  SignupSuccess(this.loginModel);
}

class SignupError extends AuthState {
  final AppException exception;
  SignupError(this.exception);
}

class ForgotLoading extends AuthState {}

class ForgotSuccess extends AuthState {
  final LoginModel loginModel;
  ForgotSuccess(this.loginModel);
}

class ForgotError extends AuthState {
  final AppException exception;
  ForgotError(this.exception);
}

class OtpverifyLoading extends AuthState {}

class OtpverifySuccess extends AuthState {
  final LoginModel loginModel;
  OtpverifySuccess(this.loginModel);
}

class OtpverifyError extends AuthState {
  final AppException exception;
  OtpverifyError(this.exception);
}

class ResetLoading extends AuthState {}

class ResetSuccess extends AuthState {
  final LoginModel loginModel;
  ResetSuccess(this.loginModel);
}

class ResetError extends AuthState {
  final AppException exception;
  ResetError(this.exception);
}

class ChangepassLoading extends AuthState {}

class ChangepassSuccess extends AuthState {
  final LoginModel loginModel;
  ChangepassSuccess(this.loginModel);
}

class ChangepassError extends AuthState {
  final AppException exception;
  ChangepassError(this.exception);
}
