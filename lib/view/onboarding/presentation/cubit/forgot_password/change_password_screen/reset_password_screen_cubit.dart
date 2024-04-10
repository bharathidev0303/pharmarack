import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core/network/interceptor/dio_interceptor.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/delete_reset_password_data_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/get_reset_password_data_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/login_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/otp_auth/save_login_data_use_case.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/request_reset_password_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/store_header_use_case.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/change_password_screen/reset_password_state.dart';

import 'package:shared_preferences/shared_preferences.dart';


import '../../../../data/entities/reset_password_response_entity.dart';
import '../../../../domain/model/reset_password_model.dart';
import '../../../../domain/usecase/get_retailer_info_usecase.dart';
import '../../../../domain/usecase/request_login_usecase.dart';
import '../../../../domain/usecase/save_reset_password_response_usecase.dart';
import '../../../../domain/usecase/save_success_verify_otp_response_usecase.dart';
import '../../../../utils/constants.dart';
import '../../common/input_text_state.dart';
import '../../login_screen_state.dart';

class ResetPasswordScreenCubit extends Cubit<ResetPasswordScreenState> {
  final NewPasswordFieldCubit newPasswordFieldCubit;
  final ConfirmNewPasswordCubit confirmNewPasswordCubit;
  final RequestResetPasswordUseCase _requestResetPasswordUseCase;
  final LoginUseCase _loginUseCase;
  final StoreHeaderUseCase _storeHeaderUseCase;
  final SaveLoginDataUseCase _saveLoginDataUseCase;
  final GetResetPasswordDataUseCase _getResetPasswordDataUseCase;
  final DeleteResetPasswordDataUseCase _deleteResetPasswordDataUseCase;
  final SaveResetPasswordResponseUseCase _saveResetPasswordResponseUseCase;
  final GetRetailerInfoUseCase _getRetailerInfoUseCase;
  final RequestLoginUseCase _requestLoginUseCase;
  final newPasswordFieldController = TextEditingController();
  final confirmNewPasswordFieldController = TextEditingController();

  ResetPasswordScreenCubit(
      RequestResetPasswordUseCase requestChangePasswordUseCase,
      LoginUseCase loginUseCase,
      StoreHeaderUseCase storeHeaderUseCase,
      SaveLoginDataUseCase saveLoginDataUseCase,
      GetResetPasswordDataUseCase getResetPasswordDataUseCase,
      DeleteResetPasswordDataUseCase deleteResetPasswordDataUseCase,
      RequestLoginUseCase requestLoginUseCase,
      SaveResetPasswordResponseUseCase saveResetPasswordResponseUseCase,
      GetRetailerInfoUseCase getRetailerInfoUseCase,
      {required this.newPasswordFieldCubit,
      required this.confirmNewPasswordCubit})
      : _requestResetPasswordUseCase = requestChangePasswordUseCase,
        _loginUseCase = loginUseCase,
        _storeHeaderUseCase = storeHeaderUseCase,
        _saveLoginDataUseCase = saveLoginDataUseCase,
        _getResetPasswordDataUseCase = getResetPasswordDataUseCase,
        _deleteResetPasswordDataUseCase = deleteResetPasswordDataUseCase,
        _requestLoginUseCase = requestLoginUseCase,
        _saveResetPasswordResponseUseCase = saveResetPasswordResponseUseCase,
        _getRetailerInfoUseCase = getRetailerInfoUseCase,
        super(ResetPasswordScreenInitialState());

  Future<void> doResetPassword() async {
    String? sumittedOTP =
        onboardingDI<String>(instanceName: OnboardingConstants.otpField);
    emit(ResetPasswordScreenLoadingState());
    final response = await _requestResetPasswordUseCase.execute(
        params: RequestResetPasswordParams(
            mobileNumber: onboardingDI<String>(
                instanceName: OnboardingConstants.mobileNumberDiConstant),
            otp: sumittedOTP,
            newPassword: newPasswordFieldController.text));
    response.fold(
        (l) =>
            emit(ResetPasswordScreenErrorState(statusMessage: l.error.message)),
        (r) {
      if (r.entity!.users?.isAuthorized == 0) {
        emit(ResetPasswordUnAuthorizeState());
      }
      if (r.statusCode == 200 && r.entity?.users?.isAuthorized == 1) {
        storeNewHeader(
            onboardingDI<String>(
                instanceName: OnboardingConstants.mobileNumberDiConstant),
            'error',
            r.entity!);
      } else {
        emit(ResetPasswordScreenErrorState(statusMessage: r.message));
      }
    });
  }

  Future<void> storeNewHeader(
      String userName, String errorMessage, ResetPasswordEntity token) async {
    final userEncodedInfo =
        base64.encode("$userName:${newPasswordFieldController.text}".codeUnits);
    DioInterceptor.updateHeaders(
        onboardingDI<Dio>(instanceName: AppConstants.legacyBaseUrlDioConstant),
        {"Authorizationdetails": 'Basic $userEncodedInfo'});
    final saveHeaders = await _storeHeaderUseCase.execute(
        params: StoreHeaderParams(userEncodedInfo));
    saveHeaders.fold(
        (l) => emit(ResetPasswordScreenErrorState(statusMessage: errorMessage)),
        (r) {
      saveOtpEntity(token);
      // emit(const ResetPasswordScreenDataState());
      // loginWithNewPassword(errorMessage);
      // requestLogin();
    });
  }

  void saveOtpEntity(ResetPasswordEntity token) async {
    if (onboardingDI.isRegistered<ResetPasswordEntity>(
        instanceName: OnboardingConstants.resetPasswordResponseDiConstant)) {
      onboardingDI.unregister<ResetPasswordEntity>(
          instanceName: OnboardingConstants.resetPasswordResponseDiConstant);
    }
    onboardingDI.registerSingleton<ResetPasswordEntity>(token,
        instanceName: OnboardingConstants.resetPasswordResponseDiConstant);
    DioInterceptor.updateHeaders(
        onboardingDI<Dio>(instanceName: AppConstants.baseUrlDioConstant),
        {"Authorization": token.token!});
    DioInterceptor.updateHeaders(
        onboardingDI<Dio>(
            instanceName: AppConstants.cmsGatewayBaseUrlDioConstant),
        {"Authorization": token.token!});

    final saveResetPasswordResponse =
        await _saveResetPasswordResponseUseCase.execute(
            params: SaveResetPasswordResponseUseCaseParams(
                onboardingDI<ResetPasswordEntity>(
                    instanceName:
                        OnboardingConstants.resetPasswordResponseDiConstant)));
    saveResetPasswordResponse.fold(
        (l) => emit(
            const ResetPasswordScreenErrorState(statusMessage: 'errorMessage')),
        (r) {
      // emit(const ForgotPasswordOtpScreenDataState());
      getRetailerInfo();
    });
  }

  Future<void> getRetailerInfo() async {
    final getRetailerInfoResponse =
        await _getRetailerInfoUseCase.execute(params: GetRetailerInfoParams());
    getRetailerInfoResponse.fold((l) {
      if (l.error.code == 401) {}
      emit(ResetPasswordScreenErrorState(statusMessage: l.error.message));
    }, (r) {
      if (onboardingDI.isRegistered<RetailerInfoEntity>()) {
        onboardingDI.unregister<RetailerInfoEntity>();
      }
      onboardingDI.registerSingleton<RetailerInfoEntity>(r);
      emit(const ResetPasswordScreenDataState());
    });
  }

  Future<void> requestLogin() async {
    emit(ResetPasswordScreenLoadingState());
    final requestLoginResponse = await _requestLoginUseCase.execute(
        params: RequestLoginParams(
            userName: onboardingDI<String>(
                instanceName: OnboardingConstants.mobileNumberDiConstant),
            password: newPasswordFieldController.text));
    requestLoginResponse.fold(
      (l) {},
      (r) {
        if (r == false) {
          emit(const ResetPasswordScreenErrorState(statusMessage: 'r.message'));
        } else {
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
          onboardingDI.registerSingleton<String>('ashwin',
              // userNameController.text,
              instanceName: OnboardingConstants.loginUserName);
          onboardingDI.registerSingleton<String>(
              newPasswordFieldController.text,
              instanceName: OnboardingConstants.loginPassword);
          emit(const ResetPasswordScreenDataState());
        }
      },
    );
  }

  void validateConfirmNewPassword(
      String newPassword, String confirmNewPassword) {
    confirmNewPasswordCubit.validateConfirmPassword(
        newPassword, confirmNewPassword);
  }

  // Future<void> getResetPasswordDataAndChangePassword(
  //     String errorMessage) async {
  //   emit(ResetPasswordScreenLoadingState());
  //   final getChangePasswordData = await _getResetPasswordDataUseCase.execute(
  //       params: GetResetPasswordDataParams());
  //   getChangePasswordData.fold((l) {
  //     emit(ResetPasswordScreenErrorState(statusMessage: errorMessage));
  //   }, (r) {
  //     changePassword(r.$1, r.$2, r.$3, errorMessage);
  //   });
  // }

  // Future<void> changePassword(int userId, String userName, String oldPassword,
  //     String errorMessage) async {
  //   if (newPasswordFieldCubit
  //       .validateNewPassword(newPasswordFieldController.text)) {
  //     final response = await _requestResetPasswordUseCase.execute(
  //         params: RequestResetPasswordParams(
  //             mobileNumber: "",
  //             otp: "",
  //             newPassword: newPasswordFieldController.text));
  //     response.fold((l) {
  //       emit(ResetPasswordScreenErrorState(statusMessage: errorMessage));
  //     }, (r) {
  //       if (r.statusCode == 200) {
  //         deleteResetPasswordData(userName, errorMessage);
  //       } else {
  //         emit(ResetPasswordScreenErrorState(statusMessage: r.message));
  //       }
  //     });
  //   } else {
  //     emit(ResetPasswordScreenErrorState(statusMessage: errorMessage));
  //   }
  // }

  // Future<void> deleteResetPasswordData(
  //     String userName, String errorMessage) async {
  //   final deleteResetPasswordData = await _deleteResetPasswordDataUseCase
  //       .execute(params: DeleteResetPasswordDataParams());
  //   deleteResetPasswordData.fold((l) {
  //     emit(ResetPasswordScreenErrorState(statusMessage: errorMessage));
  //   }, (r) {
  //     if (r == true) {
  //       storeNewHeader(userName, errorMessage);
  //     } else {
  //       emit(ResetPasswordScreenErrorState(statusMessage: errorMessage));
  //     }
  //   });
  // }

  // Future<void> storeNewHeader(String userName, String errorMessage) async {
  //   final userEncodedInfo =
  //       base64.encode("$userName:${newPasswordFieldController.text}".codeUnits);
  //   DioInterceptor.updateHeaders(
  //       onboardingDI<Dio>(instanceName: AppConstants.legacyBaseUrlDioConstant),
  //       {"Authorizationdetails": 'Basic $userEncodedInfo'});
  //   final saveHeaders = await _storeHeaderUseCase.execute(
  //       params: StoreHeaderParams(userEncodedInfo));
  //   saveHeaders.fold(
  //       (l) => emit(ResetPasswordScreenErrorState(statusMessage: errorMessage)),
  //       (r) {
  //     loginWithNewPassword(errorMessage);
  //   });
  // }

  // Future<void> loginWithNewPassword(String errorMessage) async {
  //   final response = await _loginUseCase.execute(params: LoginParams());
  //   response.fold((l) {
  //     emit(ResetPasswordScreenErrorState(statusMessage: errorMessage));
  //   }, (r) {
  //     saveNewLoginInfo(onboardingDI<LoginEntity>(), errorMessage);
  //   });
  // }

  // Future<void> saveNewLoginInfo(
  //     LoginEntity loginEntity, String errorMessage) async {
  //   final saveNewLoginInfo = await _saveLoginDataUseCase.execute(
  //       params:
  //           SaveLoginDataParams(loginEntity, StorageConstants.loginDataKey));
  //   saveNewLoginInfo.fold((l) {
  //     emit(ResetPasswordScreenErrorState(statusMessage: errorMessage));
  //   }, (r) {
  //     emit(const ResetPasswordScreenDataState());
  //   });
  // }
}
