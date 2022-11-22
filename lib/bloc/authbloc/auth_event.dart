part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email, password;
  LoginEvent(this.email, this.password);
}

class SignupEvent extends AuthEvent {
  final String name, email, password, cpassword;
  SignupEvent(this.name, this.email, this.password, this.cpassword);
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;
  ForgotPasswordEvent(this.email);
}

class OtpverifyEvent extends AuthEvent {
  final String id;
  final int otp;
  OtpverifyEvent(this.id, this.otp);
}

class ResetPasswordEvent extends AuthEvent {
  final String id, newpassword, confirmpassword;
  ResetPasswordEvent(this.id, this.newpassword, this.confirmpassword);
}

class ChangePasswordEvent extends AuthEvent {
  final String oldpassword, newpassword, confirmpassword;
  ChangePasswordEvent(this.oldpassword, this.newpassword, this.confirmpassword);
}
