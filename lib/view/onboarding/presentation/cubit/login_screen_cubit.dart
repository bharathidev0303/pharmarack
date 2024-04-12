import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core/network/interceptor/dio_interceptor.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/request_login_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/store_header_use_case.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/login_screen_state.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

import '../../di/onboarding_provider.dart';
import '../../domain/usecase/check_password_update_uescase.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  static const String _userNotValid = "user details does not exist";
  static const String _passwordNotValid = "Invalid Password";
  static const String _userPasswordNotValid =
      "user details does not exist and Invalid Password";
  final StoreHeaderUseCase _storeHeaderUseCase;
  final RequestLoginUseCase _requestLoginUseCase;
  final CheckPasswordUpdateUseCase _checkPasswordUpdateUseCase;
  final LoginScreenTextCubit loginScreenTextCubit;
  // final OnboardingOuterRoutePaths onboardingOuterRoutePaths;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreenCubit(
      StoreHeaderUseCase storeHeaderUseCase,
      RequestLoginUseCase requestLoginUseCase,
      CheckPasswordUpdateUseCase checkPasswordUpdateUseCase,
      {required this.loginScreenTextCubit})
      : _storeHeaderUseCase = storeHeaderUseCase,
        _requestLoginUseCase = requestLoginUseCase,
        _checkPasswordUpdateUseCase = checkPasswordUpdateUseCase,
        super(LoginScreenInitialState());

  Future<void> requestLogin() async {
    emit(LoginScreenLoadingState());
    final requestLoginResponse = await _requestLoginUseCase.execute(
        params: RequestLoginParams(
            userName: userNameController.text,
            password: passwordController.text));
    requestLoginResponse.fold((l) {
      if (l.error.message == _userNotValid) {
        emit(LoginScreenUsernameNotValidState());
      } else if (l.error.message == _passwordNotValid) {
        emit(LoginScreenPasswordNotValidState());
      } else if (l.error.message == _userPasswordNotValid) {
        emit(LoginScreenUsernameNotValidState());
        emit(LoginScreenPasswordNotValidState());
      } else {
        emit(LoginScreenErrorState(statusMessage: l.error.message));
      }
    }, (r) {
      if (onboardingDI.isRegistered<String>(
          instanceName: OnboardingConstants.loginUserName)) {
        onboardingDI.unregister<String>(
            instanceName: OnboardingConstants.loginUserName);
      }
      if (onboardingDI.isRegistered<String>(
          instanceName: OnboardingConstants.loginPassword)) {
        onboardingDI.unregister<String>(
            instanceName: OnboardingConstants.loginPassword);
      }
      if (onboardingDI.isRegistered<String>(
          instanceName: OnboardingConstants.mobileNumberDiConstant)) {
        onboardingDI.unregister<String>(
            instanceName: OnboardingConstants.mobileNumberDiConstant);
      }
      onboardingDI.registerSingleton<String>(userNameController.text,
          instanceName: OnboardingConstants.loginUserName);
      onboardingDI.registerSingleton<String>(passwordController.text,
          instanceName: OnboardingConstants.loginPassword);
      onboardingDI.registerSingleton<String>(r.mobileNumber ?? '9091000000',
          instanceName: OnboardingConstants.mobileNumberDiConstant);
      emit(const LoginScreenDataState());
    });
  }

  Future<void> onLoginPressed() async {
    String username = userNameController.text;
    String password = passwordController.text;
    final userEncodedInfo = base64.encode("$username:$password".codeUnits);
    DioInterceptor.updateHeaders(
        onboardingDI<Dio>(instanceName: AppConstants.legacyBaseUrlDioConstant),
        {"Authorizationdetails": 'Basic $userEncodedInfo'});
    final response = await _storeHeaderUseCase.execute(
        params: StoreHeaderParams(userEncodedInfo));
    response.fold((l) => emit(const LoginScreenErrorState()), (r) {
      requestLogin();
    });
  }

  void validateUsernameAndPassword() {
    if (state is LoginScreenPasswordNotValidState ||
        state is LoginScreenUsernameNotValidState) {
      emit(LoginScreenInitialState());
    }
    loginScreenTextCubit.validateTextFields(
        username: userNameController.text, password: passwordController.text);
  }

  Future<void> checkPasswordUpdate() async {
    emit(LoginScreenLoadingState());
    final response = await _checkPasswordUpdateUseCase.execute(
        params: CheckPasswordUpdateParams(
            username: userNameController.text.isEmpty
                ? '8236691167'
                : userNameController.text));

    response.fold((l) {
      if (l.error.message == 'Invalid user!') {
        emit(LoginScreenUsernameNotValidState());
        emit(LoginScreenPasswordNotValidState());
      } else {
        emit(const LoginScreenErrorState());
      }
    }, (r) {
      if (r.message == 'reset password mail/msg sent successfully') {
        if (onboardingDI.isRegistered<String>(
            instanceName: OnboardingConstants.mobileNumberDiConstant)) {
          onboardingDI.unregister<String>(
              instanceName: OnboardingConstants.mobileNumberDiConstant);
        }
        onboardingDI.registerSingleton<String>(r.data.mobileNumber,
            instanceName: OnboardingConstants.mobileNumberDiConstant);

        emit(CheckPasswordDialogState());
      } else if (r.message == 'password reset already processed') {
        onLoginPressed();
      } else {
        onLoginPressed();
      }
    });
  }
}
