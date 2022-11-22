
import 'package:bloc/bloc.dart';
import 'package:ecomm_bloc/api/models/login_model.dart';
import 'package:ecomm_bloc/api/repository/cart_repository.dart';
import 'package:ecomm_bloc/exception/app_exception.dart';
import 'package:meta/meta.dart';

import '../../api/repository/login_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository = AuthRepository();
  final CartRepository _cartRepository = CartRepository();
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event.email.isEmpty) {
        emit(LoginError(AppException("Please enter valid email")));
      } else if (event.password.isEmpty) {
        emit(LoginError(AppException("Please enter valid password")));
      } else {
        emit(LoginLoading());
        try {
          final loginModel =
              await _authRepository.requestLogin(event.email, event.password);
          emit(LoginSuccess(loginModel));
        } on AppException catch (e) {
          emit(LoginError(e));
        }
      }
    });
    on<SignupEvent>((event, emit) async {
      emit(SignupLoading());
      try {
        final loginModel = await _authRepository.requestSignup(
            event.name, event.email, event.password, event.cpassword);
        emit(SignupSuccess(loginModel));
      } on AppException catch (e) {
        emit(SignupError(e));
      }
    });
    on<ForgotPasswordEvent>((event, emit) async {
      emit(ForgotLoading());
      try {
        final loginModel = await _authRepository.forgotPassword(event.email);
        emit(ForgotSuccess(loginModel));
      } on AppException catch (e) {
        emit(ForgotError(e));
      }
    });
    on<OtpverifyEvent>((event, emit) async {
      emit(OtpverifyLoading());
      try {
        final loginModel = await _authRepository.otpverify(event.id, event.otp);
        emit(OtpverifySuccess(loginModel));
      } on AppException catch (e) {
        emit(OtpverifyError(e));
      }
    });
    on<ResetPasswordEvent>((event, emit) async {
      emit(ResetLoading());
      try {
        final loginModel = await _authRepository.resetpassword(
            event.id, event.newpassword, event.confirmpassword);
        emit(ResetSuccess(loginModel));
      } on AppException catch (e) {
        emit(ResetError(e));
      }
    });

    on<ChangePasswordEvent>((event, emit) async {
      emit(ChangepassLoading());
      try {
        final loginModel = await _cartRepository.changepassword(
            event.oldpassword, event.newpassword, event.confirmpassword);
        emit(ChangepassSuccess(loginModel));
      } on AppException catch (e) {
        emit(ChangepassError(e));
      }
    });
  }
}
