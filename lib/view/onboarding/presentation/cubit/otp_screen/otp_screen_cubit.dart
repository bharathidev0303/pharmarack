import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/request_login_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/save_success_verify_otp_response_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/verify_otp_usecase.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/otp_screen/otp_screen_state.dart';
import 'package:pharmarack/view/onboarding/presentation/navigation/onboarding_outer_route_paths.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';
import 'package:pharmarack/packages/storage_utils/storage_constants.dart';

import '../../../domain/usecase/get_retailer_info_usecase.dart';

class OtpScreenCubit extends Cubit<OtpScreenState> {
  /// Parameterised Variables
  final VerifyOtpUseCase _verifyOtpUseCase;
  final RequestLoginUseCase _requestLoginUseCase;
  final SaveSuccessVerifyOtpResponseUseCase
      _saveSuccessVerifyOtpResponseUseCase;
  final GetRetailerInfoUseCase _getRetailerInfoUseCase;
  final OtpFieldCubit otpFieldCubit;
  final ResendButtonCubit resendButtonCubit;

  final otpFieldController = TextEditingController();

  final FlutterSecureStorage _secureStorage;

  // final OnboardingOuterRoutePaths _onboardingOuterRoutePaths;

  OtpScreenCubit(
      VerifyOtpUseCase verifyOtpUseCase,
      RequestLoginUseCase requestLoginUseCase,
      SaveSuccessVerifyOtpResponseUseCase saveSuccessVerifyOtpResponseUseCase,
      GetRetailerInfoUseCase getRetailerInfoUseCase,
      // OnboardingOuterRoutePaths paths,
      this._secureStorage,
      {required this.otpFieldCubit,
      required this.resendButtonCubit})
      : _verifyOtpUseCase = verifyOtpUseCase,
        _requestLoginUseCase = requestLoginUseCase,
        _getRetailerInfoUseCase = getRetailerInfoUseCase,
        _saveSuccessVerifyOtpResponseUseCase =
            saveSuccessVerifyOtpResponseUseCase,
        // _onboardingOuterRoutePaths = paths,
        super(OtpScreenInitialState());

  void resendOtp() async {
    resendButtonCubit.startTimer();
    otpFieldController.clear();
    emit(OtpScreenLoadingState());
    final userName =
        onboardingDI<String>(instanceName: OnboardingConstants.loginUserName);
    final password =
        onboardingDI<String>(instanceName: OnboardingConstants.loginPassword);
    final response = await _requestLoginUseCase.execute(
        params: RequestLoginParams(userName: userName, password: password));
    response.fold((l) {
      emit(OtpScreenErrorState());
    }, (r) {
      if (r == false) {
        emit(OtpScreenErrorState());
      } else {
        emit(OtpScreenDataState());
      }
    });
  }

  void validateOtp() {
    otpFieldCubit.validateOtp(otpFieldController.text);
  }

  void verifyOtp() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? storedValue = prefs.getString('delete_account_initiated');

    // if (storedValue == 'true') {
    //   emit(OtpVerificationDeleteAccountState());
    // } else {
    //   emit(OtpScreenLoadingState());
    //   final userOtp = otpFieldController.text;
    //   final userMobileNumber = onboardingDI<String>(
    //       instanceName: OnboardingConstants.loginMobileNumberDiConstant);
    //   final verifyOtpResponse = await _verifyOtpUseCase.execute(
    //       params: VerifyOtpUseCaseParams(
    //           mobileNumber: userMobileNumber, module: "login", otp: userOtp));
    //   verifyOtpResponse.fold((l) {
    //     emit(OtpVerificationFailedState(statusMessage: l.error.message));
    //   }, (r) {
    //     if (r.userData?.isAuthorized == 0) {
    //       emit(OtpPageUnAuthorizedDetectState());
    //     }
    //     saveOtpEntity();
    //   });
    // }
  }

  Future<void> getRetailerInfo() async {
    final getRetailerInfoResponse =
        await _getRetailerInfoUseCase.execute(params: GetRetailerInfoParams());
    getRetailerInfoResponse.fold((l) {
      if (l.error.code == 401) {
        emit(OtpPageUnAuthorizedDetectState());
      }
      emit(OtpScreenErrorState());
    }, (r) {
      if (onboardingDI.isRegistered<RetailerInfoEntity>()) {
        onboardingDI.unregister<RetailerInfoEntity>();
      }
      onboardingDI.registerSingleton<RetailerInfoEntity>(r);
      emit(OtpVerificationSuccessState());
    });
  }

  void saveOtpEntity() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? storedValue = prefs.getString('delete_account_initiated');
    // final saveSuccessOtpResponse =
    //     await _saveSuccessVerifyOtpResponseUseCase.execute(
    //         params: SaveSuccessVerifyOtpResponseUseCaseParams(
    //             onboardingDI<VerifyOtpResponseEntity>(
    //                 instanceName:
    //                     OnboardingConstants.verifyOtpResponseDiConstant)));
    // saveSuccessOtpResponse.fold((l) => emit(OtpScreenErrorState()), (r) async {
    //   try {
    //     getRetailerInfo();

    //     // getRetailerInfo()
    //   } on Exception catch (_) {
    //     emit(OtpPageUnAuthorizedDetectState());
    //   }
    //   // try {
    //   //   final getRetailerInfoResponse =
    //   //   await _getRetailerInfoUseCase.execute(params: GetRetailerInfoParams());
    //   //   getRetailerInfoResponse.fold((l) {
    //   //     if (l.error.code == 401) {
    //   //       emit(OtpPageUnAuthorizedDetectState());
    //   //     }
    //   //     emit(OtpScreenErrorState());
    //   //   }, (r) {
    //   //     if (onboardingDI.isRegistered<RetailerInfoEntity>()) {
    //   //       onboardingDI.unregister<RetailerInfoEntity>();
    //   //     }
    //   //     onboardingDI.registerSingleton<RetailerInfoEntity>(r);
    //   //     emit(OtpVerificationSuccessState());
    //   //   });
    //   // } on Exception catch (_) {
    //   //   emit(OtpPageUnAuthorizedDetectState());
    //   // }
    //   if (storedValue == 'true') {
    //     emit(OtpVerificationDeleteAccountState());
    //   }
    // });
  }

  void deleteAccount() async {
    try {
      const url =
          'https://pharmretail-modernization-dev-api.pharmarack.com/user/api/v1/deleteUserAccount';

      final authToken =
          await _secureStorage.read(key: StorageConstants.authToken);
      debugPrint('AUTHORIZATION: ${authToken.toString()}');
      final response = await http.delete(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': authToken.toString()
        },
      );

      if (response.statusCode == 200) {
        emit(OtpVerificationDeleteAccountSuccessState());
      } else {
        emit(OtpScreenErrorState());
      }
    } catch (e) {
      emit(OtpScreenErrorState());
    }
  }

  void navigateToDashboard(BuildContext context) {
    Navigator.of(context).pop();
    // Navigator.of(context).pushNamedAndRemoveUntil(
    //     _onboardingOuterRoutePaths.getDashBoardPath(), (route) => false);
  }

  void navigateToLoginScreen(BuildContext context) {
    Navigator.of(context).pop();
    // Navigator.pushNamed(
    //   context,
    //   RoutePaths.loginScreen,
    // );
  }
}
