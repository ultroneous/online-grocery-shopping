import 'package:ecomm_bloc/api/models/forgotpassword_request.dart';
import 'package:ecomm_bloc/api/models/otpverify_request.dart';
import 'package:ecomm_bloc/api/models/resetPassword_request.dart';

import '../../exception/app_exception.dart';
import '../../sharedprefs/shared_prefs_helper.dart';
import '../models/login_model.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';
import '../models/signup_request.dart';
import '../retrofit/retrofit_client.dart';
import 'package:dio/dio.dart';

import '../services/locator.dart';

class AuthRepository {
  static final AuthRepository _singleton = AuthRepository._internal();

  AuthRepository._internal();

  final RetrofitClient _retrofitClient = RetrofitClient(Dio());
  final sharedPrefLocator = getIt.get<SharedPreferenceHelper>();
  factory AuthRepository() {
    return _singleton;
  }

  Future<LoginModel> requestLogin(String email, String password) async {
    // try {
    //   LoginResponse loginResponse =
    //       await _retrofitClient.requestLogin(LoginRequest(email, password));
    // } on Exception {
    //   throw AppException("Something went wrong!");
    // }
    LoginResponse loginResponse =
        await _retrofitClient.requestLogin(LoginRequest(email, password));
    if (loginResponse.status == "success" && loginResponse.userValues != null) {
      sharedPrefLocator.setValues(key: 'token', value: loginResponse.token);
      sharedPrefLocator.setValues(
          key: 'email', value: loginResponse.userValues!.email.toString());
      sharedPrefLocator.setValues(
          key: 'name', value: loginResponse.userValues!.name.toString());

      return loginResponse.userValues!;
    }

    throw AppException("Something went wrong!");
  }

  Future requestSignup(
      String name, String email, String password, String cpassword) async {
    // try {
    //   LoginResponse loginResponse = await _retrofitClient
    //       .requestSignUp(SignupRequest(name, email, password, cpassword));
    // } on Exception catch (e) {
    //   print(e.toString());
    //   throw AppException("Something went wrong!");
    // }
    LoginResponse loginResponse = await _retrofitClient
        .requestSignUp(SignupRequest(name, email, password, cpassword));
    if (loginResponse.status == "success") {
      return loginResponse.userValues!;
    }

    throw AppException("Something went wrong!");
  }

  Future forgotPassword(String email) async {
    // try {
    //   LoginResponse loginResponse = await _retrofitClient
    //       .requestSignUp(SignupRequest(name, email, password, cpassword));
    // } on Exception catch (e) {
    //   print(e.toString());
    //   throw AppException("Something went wrong!");
    // }
    LoginResponse loginResponse = await _retrofitClient
        .requestForgotpassword(ForgotPasswordRequest(email));
    if (loginResponse.status == "success") {
      return loginResponse.userValues!;
    }

    throw AppException("Something went wrong!");
  }

  Future otpverify(String id, int otp) async {
    LoginResponse loginResponse =
        await _retrofitClient.requestOtpverify(OtpVerifyRequest(id, otp));
    if (loginResponse.status == "success") {
      return loginResponse.userValues;
    }
    throw AppException("Something went wrong!");
  }

  Future resetpassword(
      String id, String newpassword, String confirmpassword) async {
    LoginResponse loginResponse = await _retrofitClient.requestResetPassword(
        ResetPasswordRequest(id, newpassword, confirmpassword));
    if (loginResponse.status == "success") {
      return loginResponse.userValues;
    }
    throw AppException("Something went wrong!");
  }
}
