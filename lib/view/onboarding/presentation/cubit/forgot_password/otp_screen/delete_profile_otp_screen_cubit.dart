import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/otp_auth/delete_profile_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/request_delete_otp_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/request_otp_login_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/save_reset_password_data_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/store_header_use_case.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';


import '../../../../domain/usecase/save_success_verify_otp_response_usecase.dart';
import '../../../../domain/usecase/validate_otp_usecase.dart';
import '../../../../domain/usecase/verify_otp_usecase.dart';
import 'delete_profile_otp_screen_state.dart';

class DeleteAccountOtpScreenCubit extends Cubit<DeleteAccountOtpScreenState> {
  final RequestDeleteProfileUseCase _requestDeleteProfileUseCase;
  final RequestDeleteOtpUseCase _requestDeleteOtpUseCase;
  final OtpFieldCubit otpFieldCubit;
  final ResendButtonCubit resendButtonCubit;
  final ValidateOtpUseCase _validateOtpUseCase;
  final otpTextFieldController = TextEditingController();

  DeleteAccountOtpScreenCubit(
      RequestOtpLoginUseCase requestOtpLoginUseCase,
      StoreHeaderUseCase storeHeaderUseCase,
      SaveResetPasswordDataUseCase saveResetPasswordDataUseCase,
      RequestDeleteProfileUseCase requestDeleteProfileUseCase,
      RequestDeleteOtpUseCase requestDeleteOtpUseCase,
      VerifyOtpUseCase verifyOtpUseCase,
      ValidateOtpUseCase validateOtpUseCase,
      SaveSuccessVerifyOtpResponseUseCase saveSuccessVerifyOtpResponseUseCase,
      {required this.otpFieldCubit,
      required this.resendButtonCubit})
      : _requestDeleteProfileUseCase = requestDeleteProfileUseCase,
        _requestDeleteOtpUseCase = requestDeleteOtpUseCase,
        _validateOtpUseCase = validateOtpUseCase,
        super(DeleteAccountOtpScreenInitialState());

  Future<void> requestOtp(String errorMessage) async {
    emit(DeleteAccountOtpScreenLoadingState());
    final response =
        await _requestDeleteOtpUseCase.execute(params: RequestDeleteParams());

    response.fold(
        (l) =>
            emit(DeleteAccountOtpScreenErrorState(statusMessage: errorMessage)),
        (r) {
      if (r.success == true) {
        if (onboardingDI.isRegistered<String>(
            instanceName: OnboardingConstants.otpField)) {
          onboardingDI.unregister<String>(
              instanceName: OnboardingConstants.otpField);
        }
        onboardingDI.registerSingleton<String>(otpTextFieldController.text,
            instanceName: OnboardingConstants.otpField);
        emit(DeleteAccountOtpScreenSuccessState());
      } else {
        emit(DeleteAccountOtpScreenErrorState(statusMessage: r.message));
      }
      emit(DeleteAccountOtpScreenLoadingState());
    });
  }
  Future<void> requestVerifyOtp(String errorMessage) async {
    emit(DeleteAccountOtpScreenLoadingState());
    final response = await _validateOtpUseCase.execute(
        params: ValidateOtpNumberParams(
      mobileNumber: onboardingDI<String>(
          instanceName: OnboardingConstants.mobileNumberDiConstant),
      otp: otpTextFieldController.text,
    ));

    response.fold(
        (l) => emit(
            DeleteAccountOtpScreenErrorState(statusMessage: errorMessage)),
        (r) {
      if (onboardingDI.isRegistered<String>(
          instanceName: OnboardingConstants.otpField)) {
        onboardingDI.unregister<String>(
            instanceName: OnboardingConstants.otpField);
      }
      onboardingDI.registerSingleton<String>(otpTextFieldController.text,
          instanceName: OnboardingConstants.otpField);
      emit(DeleteAccountOtpScreenLoadingState());
    });
  }
  Future<void> resendOtp() async {
    emit(DeleteAccountOtpScreenLoadingState());
    resendButtonCubit.startTimer();
    otpTextFieldController.clear();
    final response =
        await _requestDeleteOtpUseCase.execute(params: RequestDeleteParams());
    response.fold((l) {
      resendButtonCubit.stopTimer();
      emit(DeleteAccountResendOtpErrorState());
    }, (r) {
      if (r.success != true) {
        resendButtonCubit.stopTimer();
        emit(DeleteAccountResendOtpErrorState());
      } else {
        emit(DeleteAccountResendOtpSuccessState());
      }
    });
  }

  void validateOtp(String otp) {
    otpFieldCubit.validateOtp(otp);
  }

  Future<void> deleteAccount(String errorMessage) async {
    final response = await _requestDeleteProfileUseCase.execute(
        params: RequestDeleteProfileParams(otp: otpTextFieldController.text));
    response.fold(
      (l) =>
          emit(DeleteAccountOtpScreenErrorState(statusMessage: errorMessage)),
      (r) {
        if (r.success != true) {
          emit(DeleteAccountOtpScreenErrorState(statusMessage: errorMessage));
        } else {
          emit(AccountDeletedSuccessState());
        }
      },
    );
  }

  void navigateToLoginScreen(BuildContext context) {
    Navigator.of(context).pop();
    // Navigator.pushNamed(
    //   context,
    //   RoutePaths.loginScreen,
    // );
  }
}
