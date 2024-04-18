import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core/network/interceptor/dio_interceptor.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/verify_otp_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/onboarding/data/entities/otp_login_api_payload_entity.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/domain/model/forget_password_params.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/request_forget_password_uescase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/request_otp_login_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/save_reset_password_data_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/store_header_use_case.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/otp_screen/forgot_password_otp_screen_state.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/usecase/save_success_verify_otp_response_usecase.dart';
import '../../../../domain/usecase/validate_otp_usecase.dart';
import '../../../../domain/usecase/verify_otp_usecase.dart';

class ForgotPasswordOtpScreenCubit extends Cubit<ForgotPasswordOtpScreenState> {
  final RequestOtpLoginUseCase _requestOtpLoginUseCase;
  final RequestForgetPasswordUseCase _forgetPasswordUseCase;
  final OtpFieldCubit otpFieldCubit;
  final StoreHeaderUseCase _storeHeaderUseCase;
  final ResendButtonCubit resendButtonCubit;
  final SaveResetPasswordDataUseCase _saveResetPasswordDataUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final ValidateOtpUseCase _validateOtpUseCase;
  final SaveSuccessVerifyOtpResponseUseCase
      _saveSuccessVerifyOtpResponseUseCase;
  final otpTextFieldController = TextEditingController();

  ForgotPasswordOtpScreenCubit(
      RequestOtpLoginUseCase requestOtpLoginUseCase,
      StoreHeaderUseCase storeHeaderUseCase,
      SaveResetPasswordDataUseCase saveResetPasswordDataUseCase,
      RequestForgetPasswordUseCase requestForgetPasswordUseCase,
      VerifyOtpUseCase verifyOtpUseCase,
      ValidateOtpUseCase validateOtpUseCase,
      SaveSuccessVerifyOtpResponseUseCase saveSuccessVerifyOtpResponseUseCase,
      {required this.otpFieldCubit,
      required this.resendButtonCubit})
      : _requestOtpLoginUseCase = requestOtpLoginUseCase,
        _forgetPasswordUseCase = requestForgetPasswordUseCase,
        _storeHeaderUseCase = storeHeaderUseCase,
        _saveResetPasswordDataUseCase = saveResetPasswordDataUseCase,
        _verifyOtpUseCase = verifyOtpUseCase,
        _validateOtpUseCase = validateOtpUseCase,
        _saveSuccessVerifyOtpResponseUseCase =
            saveSuccessVerifyOtpResponseUseCase,
        super(ForgotPasswordOtpScreenInitialState());

  Future<void> requestVerifyOtp(String errorMessage) async {
    emit(ForgotPasswordOtpScreenLoadingState());
    final response = await _validateOtpUseCase.execute(
        params: ValidateOtpNumberParams(
      mobileNumber: onboardingDI<String>(
          instanceName: OnboardingConstants.mobileNumberDiConstant),
      otp: otpTextFieldController.text,
    ));

    response.fold(
        (l) => emit(
            ForgotPasswordOtpScreenErrorState(statusMessage: errorMessage)),
        (r) {
      if (onboardingDI.isRegistered<String>(
          instanceName: OnboardingConstants.otpField)) {
        onboardingDI.unregister<String>(
            instanceName: OnboardingConstants.otpField);
      }
      onboardingDI.registerSingleton<String>(otpTextFieldController.text,
          instanceName: OnboardingConstants.otpField);
      emit(const ForgotPasswordOtpScreenDataState());
    });
  }

  Future<void> requestVerifyOtpOld(String errorMessage) async {
    emit(ForgotPasswordOtpScreenLoadingState());
    SharedPreferences pref = await SharedPreferences.getInstance();
    String oneSignal = pref.get('oneSignalId').toString();
    final response = await _verifyOtpUseCase.execute(
        params: VerifyOtpUseCaseParams(
            mobileNumber: onboardingDI<String>(
                instanceName: OnboardingConstants.mobileNumberDiConstant),
            module: "login",
            otp: otpTextFieldController.text,
            oneSignalId: oneSignal));
    response.fold(
      (l) =>
          emit(ForgotPasswordOtpScreenErrorState(statusMessage: errorMessage)),
      (r) {
        saveOtpEntity();
      },
    );
  }

  void saveOtpEntity() async {
    if (onboardingDI.isRegistered<String>(
        instanceName: OnboardingConstants.otpField)) {
      onboardingDI.unregister<String>(
          instanceName: OnboardingConstants.otpField);
    }
    onboardingDI.registerSingleton<String>(otpTextFieldController.text,
        instanceName: OnboardingConstants.otpField);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('reset_otp', otpTextFieldController.text);
    final saveSuccessOtpResponse =
        await _saveSuccessVerifyOtpResponseUseCase.execute(
            params: SaveSuccessVerifyOtpResponseUseCaseParams(
                onboardingDI<VerifyOtpResponseEntity>(
                    instanceName:
                        OnboardingConstants.verifyOtpResponseDiConstant)));
    saveSuccessOtpResponse.fold(
        (l) => emit(const ForgotPasswordOtpScreenErrorState(
            statusMessage: 'errorMessage')), (r) {
      emit(const ForgotPasswordOtpScreenDataState());
    });
  }

  Future<void> requestOtpLogin(String errorMessage) async {
    emit(ForgotPasswordOtpScreenLoadingState());
    final userEncodedInfo = base64.encode(
        "${onboardingDI<String>(instanceName: OnboardingConstants.mobileNumberDiConstant)}:${otpTextFieldController.text}"
            .codeUnits);
    DioInterceptor.updateHeaders(
      onboardingDI<Dio>(instanceName: AppConstants.legacyBaseUrlDioConstant),
      {"Authorizationdetails": 'Basic $userEncodedInfo'},
    );
    final saveHeader = await _storeHeaderUseCase.execute(
        params: StoreHeaderParams(userEncodedInfo));
    saveHeader.fold((l) {
      emit(ForgotPasswordOtpScreenErrorState(statusMessage: errorMessage));
    }, (r) {
      otpLogin(errorMessage);
    });
  }

  Future<void> otpLogin(String errorMessage) async {
    final response = await _requestOtpLoginUseCase.execute(
        params: RequestOtpLoginParams(
            otpLoginApiPayloadEntity: OtpLoginApiPayloadEntity(
      gcmRegistrationId: '',
      isOtp: 'true',
      appId: '2',
      newApp: 'true',
      devicePlatform: (kIsWeb)
          ? "web"
          : (Platform.isIOS)
              ? "ios"
              : "android",
    )));
    response.fold(
        (l) => emit(
            ForgotPasswordOtpScreenErrorState(statusMessage: errorMessage)),
        (r) {
      if (r.username == null) {
        emit(ForgotPasswordOtpScreenErrorState(
            statusMessage: r.status?.statusMessage));
      } else {
        saveResetPasswordData(r.userId ?? 0, r.username ?? "", errorMessage);
      }
    });
  }

  Future<void> saveResetPasswordData(
      int userId, String userName, String errorMessage) async {
    final response = await _saveResetPasswordDataUseCase.execute(
        params: SaveResetPasswordDataParams(
            oldPassword: otpTextFieldController.text,
            userId: userId,
            userName: userName));
    response.fold(
        (l) => emit(
            ForgotPasswordOtpScreenErrorState(statusMessage: errorMessage)),
        (r) {
      emit(const ForgotPasswordOtpScreenDataState());
    });
  }

  Future<void> resendOtp() async {
    emit(ForgotPasswordOtpScreenLoadingState());
    resendButtonCubit.startTimer();
    otpTextFieldController.clear();
    final response = await _forgetPasswordUseCase.execute(
      params: RequestForgetPasswordParams(
        forgetPasswordParams: ForgetPasswordParams(
            mobileNumber: onboardingDI<String>(instanceName: "mobile_number"),
            email: ""),
      ),
    );
    response.fold((l) {
      resendButtonCubit.stopTimer();
      emit(ForgotPasswordResendOtpErrorState());
    }, (r) {
      if (r.success != true) {
        resendButtonCubit.stopTimer();
        emit(ForgotPasswordResendOtpErrorState());
      } else {
        emit(ForgotPasswordResendOtpSuccessState());
      }
    });
  }

  void validateOtp(String otp) {
    if (state is ForgotPasswordOtpScreenErrorState) {
      emit(ForgotPasswordOtpScreenIntialState());
    }
    otpFieldCubit.validateOtp(otp);
  }
}
