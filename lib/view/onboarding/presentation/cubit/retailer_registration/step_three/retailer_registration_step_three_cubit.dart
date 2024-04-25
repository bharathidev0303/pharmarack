import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core/network/interceptor/dio_interceptor.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/onboarding/data/entities/retailer_Image_upload_entity.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/check_gst_number.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/retailer_registration_use_case.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/upload_drug_licence_number.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/store_header_use_case.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/retailer_registration/step_three/retailer_registration_step_three_state.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/usecase/request_login_usecase.dart';
import '../../login_screen_state.dart';

class RetailerRegistrationStepThreeCubit
    extends Cubit<RetailerRegistrationStepThreeState> {
  final RetailerRegistrationUserCase _retailerRegistrationUserCase;
  final CheckGSTNumberUseCase _checkGSTNumberUseCase;
  final RequestLoginUseCase _requestLoginUseCase;
  final StoreHeaderUseCase _storeHeaderUseCase;
  final UploadDrugLicenceUseCase _drugLicenceUseCase;

  static const String _userNotValid = "User details doesnot exist";
  static const String _passwordNotValid = "Password invalid";

  RetailerRegistrationStepThreeCubit(
    this._retailerRegistrationUserCase,
    this._checkGSTNumberUseCase,
    this._requestLoginUseCase,
    this._storeHeaderUseCase,
    this._drugLicenceUseCase,
  ) : super(RetailerRegistrationStepThreeState.initial());

  void saveUserInputFieldsData() {
    Map<String, String> reqMap = HashMap();
    reqMap[OnboardingConstants.panNumber] = state.panNumber;
    reqMap[OnboardingConstants.gstinNumber] = state.gstNumber;
    reqMap[OnboardingConstants.drugLicenseNum1] = state.drugLicenseNum1;
    reqMap[OnboardingConstants.drugLicenseNum2] = state.drugLicenseNum2;
    reqMap[OnboardingConstants.drugLicenseNum3] = state.drugLicenseNum3;
    reqMap[OnboardingConstants.whatsappConsentCheckbox] =
        state.whatsappConsentCheckbox;
    reqMap[OnboardingConstants.termsAndConditions] =
        state.privacyPolicyCheckbox;
    reqMap[OnboardingConstants.referralCode] = state.referralCode;
    _retailerRegistrationUserCase.setStepThreeRegistrationData(reqMap);
  }

  String apiErrorMessage = "";
  Future<void> registerUser() async {
    emit(state.copyWith(isLoading: true));
    SharedPreferences pref = await SharedPreferences.getInstance();
    String oneSignal = pref.get('oneSignalId').toString();
    UploadDLParams params = UploadDLParams(
        drugLicenceFilePath: state.drugLicenseFile1?.path ?? '',
        type: 'DL1',
        userId: "0");
    var response = await _drugLicenceUseCase.execute(params: params);
    response.fold((l) => left(l), (r) async {
      if (r.data != null) {
        final response = await _retailerRegistrationUserCase.execute(
            params: RetailerRegistrationParams(
                _retailerRegistrationUserCase.getRequestString(
                    oneSignal, r.data!),
                r.data!));

        response.fold((l) {
          apiErrorMessage = "Unable to register contact support";
          if (l.error.code == 406) {
            if (l.error.message == "username/mobilenumber already present" ||
                l.error.message == "DrugLicenseNumber already exist") {
              apiErrorMessage = l.error.message;
              emit(state.copyWith(isLoading: false, apiError: true));
            } else {
              emit(state.copyWith(isLoading: false, apiError: true));
            }
          } else {
            emit(state.copyWith(isLoading: false, apiError: true));
          }
        }, (r) {
          if (r.version == 1) {
            emit(state.copyWith(versionOneUser: true, apiError: false));
          } else {
            emit(state.copyWith(moveToHomePage: true, apiError: false));
            if (r.mobileNumber!.isNotEmpty) {
              requestLogin();
            }
          }
        });
      }
    });
  }

  Future<void> updateHeader() async {
    String username =
        _retailerRegistrationUserCase.regModel.newuser?.mobileNumber ?? '';
    String password =
        _retailerRegistrationUserCase.regModel.newuser?.password ?? '';
    final userEncodedInfo = base64.encode("$username:$password".codeUnits);
    DioInterceptor.updateHeaders(
        onboardingDI<Dio>(instanceName: AppConstants.legacyBaseUrlDioConstant),
        {"Authorizationdetails": 'Basic $userEncodedInfo'});
    DioInterceptor.updateHeaders(
        onboardingDI<Dio>(
            instanceName: AppConstants.cmsGatewayBaseUrlDioConstant),
        {"Authorizationdetails": 'Basic $userEncodedInfo'});
    final response = await _storeHeaderUseCase.execute(
        params: StoreHeaderParams(userEncodedInfo));
    response.fold((l) {
      emit(state.copyWith(
        isLoading: false,
      ));
    }, (r) {
      uploadUserDL();
    });
  }

  Future<void> uploadUserDL() async {
    List<Future<dynamic>> futures = [];
    const String userId = "0";
    if (state.hasDrugLicenseFile1) {
      UploadDLParams params = UploadDLParams(
          drugLicenceFilePath: state.drugLicenseFile1?.path ?? '',
          type: 'DL1',
          userId: userId);
      futures.add(_drugLicenceUseCase.execute(params: params));
    }
    if (state.hasDrugLicenseFile2) {
      UploadDLParams params = UploadDLParams(
          drugLicenceFilePath: state.drugLicenseFile2?.path ?? '',
          type: 'DL2',
          userId: userId);
      futures.add(_drugLicenceUseCase.execute(params: params));
    }
    if (state.hasDrugLicenseFile3) {
      UploadDLParams params = UploadDLParams(
          drugLicenceFilePath: state.drugLicenseFile3?.path ?? '',
          type: 'DL3',
          userId: userId);
      futures.add(_drugLicenceUseCase.execute(params: params));
    }
    Future<List<dynamic>> allResults = Future.wait(futures);

    allResults.then((value) {
      requestLogin();
    });
  }

  // Future<void> requestLogin() async {
  //   final response = await _loginUseCase.execute(params: LoginParams());
  //   response.fold((l) {
  //     /// emit error state
  //     emit(state.copyWith(isLoading: false));
  //   }, (r) {
  //     if (r.status?.statusId == 0 || r.username == null) {
  //       emit(state.copyWith(registrationStatus: false, isLoading: false));
  //     } else {
  //       emit(state.copyWith(registrationStatus: true, isLoading: false));
  //     }
  //   });
  // }

  Future<void> requestLogin() async {
    debugPrint('Loading State');
    // emit(LoginScreenLoadingState());
    final requestLoginResponse = await _requestLoginUseCase.execute(
      params: RequestLoginParams(
        userName: 'adityaMedicals',
        password: '123456',
        // userName: _retailerRegistrationUserCase.regModel.newuser!.mobileNumber.toString(),
        // password: _retailerRegistrationUserCase.regModel.newuser!.password.toString(),
      ),
    );
    requestLoginResponse.fold(
      (l) {
        if (l.error.message == _userNotValid) {
          emit(LoginScreenUsernameNotValidState()
              as RetailerRegistrationStepThreeState);
        } else if (l.error.message == _passwordNotValid) {
          debugPrint('Password Not Valid');
          // emit(LoginScreenPasswordNotValidState());
        } else {
          debugPrint('Login Screen Password Not Valid');
          // emit(const LoginScreenErrorState());
        }
      },
      (r) async {
        if (r == false) {
          debugPrint('Login Screen Error State 1');
          // emit(const LoginScreenErrorState());
        } else {
          // final userOtp = '123456';
          // final userMobileNumber = '8236691167';

          // final verifyOtpResponse = await _verifyOtpUseCase.execute(
          //     params: VerifyOtpUseCaseParams(
          //         mobileNumber: userMobileNumber,
          //         module: "login",
          //         otp: userOtp));
          // verifyOtpResponse.fold((l) => emit(OtpVerificationFailedState()),
          //     (r) {
          //   saveOtpEntity();
          // });
          // Navigator.of(context).pushNamed(
          //     onboardingDI<OnboardingOuterRoutePaths>().getOtpPath());
          emit(state.copyWith(moveToHomePage: true));
          // Navigator.of(context).pushNamed(onboardingOuterRoutePaths.getOtpPath());
        }
      },
    );
  }

  void validateGSTNumber() async {
    // emit(state.copyWith(isLoading: true));
    final response = await _checkGSTNumberUseCase.execute(
        params: VerifyGSTNumberParams(gstNumber: state.gstNumber));
    emit(state.copyWith(
        isLoading: false,
        gstNumberValidation: response.fold((l) => null, (r) {
          if (r.toLowerCase().contains('true')) {
            return true;
          } else {
            return false;
          }
        })));
  }

  void setGstNumber(String? value) {
    emit(state.copyWith(gstNumber: value, isLoading: false));
  }

  void setPanNumber(String? value) {
    emit(state.copyWith(panNumber: value, isLoading: false));
  }

  void setReferralCode(String? value) {
    emit(state.copyWith(referralCode: value, isLoading: false));
  }

  void addDrugLicense() {
    if (state.drugLicenseCount == 1) {
      state.drugLicenseNum1.isEmpty || !state.hasDrugLicenseFile1
          ? emit(state.copyWith(
              drugLicenseError: DrugLicenseError.drugLicenseError1))
          : emit(state.copyWith(
              drugLicenseCount: (state.drugLicenseCount + 1),
              drugLicenseError: DrugLicenseError.empty));
    } else if (state.drugLicenseCount == 2) {
      state.drugLicenseNum2.isEmpty || !state.hasDrugLicenseFile2
          ? emit(state.copyWith(
              drugLicenseError: DrugLicenseError.drugLicenseError2))
          : emit(state.copyWith(
              drugLicenseCount: (state.drugLicenseCount + 1),
              drugLicenseError: DrugLicenseError.empty));
    }
  }

  void setDrugLicenseFile1(File? file) {
    emit(state.copyWith(
        drugLicenseFile1: file,
        hasDrugLicenseFile1: file != null,
        drugLicenseError: DrugLicenseError.empty));
  }

  void setDrugLicenseFile2(File? file) {
    emit(state.copyWith(
        drugLicenseFile2: file,
        hasDrugLicenseFile2: file != null,
        drugLicenseError: DrugLicenseError.empty));
  }

  void setDrugLicenseFile3(File? file) {
    emit(state.copyWith(
        drugLicenseFile3: file,
        hasDrugLicenseFile3: file != null,
        drugLicenseError: DrugLicenseError.empty));
  }

  void setDrugLicenseNum1(String? value) {
    emit(state.copyWith(
      drugLicenseNum1: value,
    ));
  }

  void setDrugLicenseNum2(String? value) {
    emit(state.copyWith(
      drugLicenseNum2: value,
    ));
  }

  void setDrugLicenseNum3(String? value) {
    emit(state.copyWith(
      drugLicenseNum3: value,
    ));
  }

  void setPrivacyPolicyCheckbox(String? value) {
    emit(state.copyWith(
      privacyPolicyCheckbox: value,
    ));
  }

  void setWhatsappConsentCheckbox(String? value) {
    emit(state.copyWith(
      whatsappConsentCheckbox: value,
    ));
  }

  clearApiErrorMessage() {
    if (apiErrorMessage.isNotEmpty) {
      apiErrorMessage = "";
      emit(state.copyWith(apiError: false));
    }
    print("skjkskjls ${apiErrorMessage}");
  }

  String? dlNumberErrorText;
  String? uploadDrupLicenseErrorText;
  String? panNumberErrorText;
  String? checkBox1ErrorText;

  void checkDrugLicenseValue(String? value, String errorMessage) {
    if (value == null || value.isEmpty || value.contains(RegExp(r"^\s* " ""))) {
      dlNumberErrorText = errorMessage;
    } else {
      dlNumberErrorText = null;
    }
  }

  void checkUploadDrugLicense(String? value, String errorMessage) {
    if (value == null || value.isEmpty || value.contains(RegExp(r"^\s* " ""))) {
      uploadDrupLicenseErrorText = errorMessage;
    } else {
      uploadDrupLicenseErrorText = null;
    }
  }

  void checkPanNumberValue(String? value, String errorMessage) {
    RegExp regExp = RegExp(r"^[A-Z]{5}[0-9]{4}[A-Z]{1}$");
    if (value == null ||
        value.isEmpty ||
        value.contains(RegExp(r"^\s* " "")) ||
        value.length < 10 ||
        !regExp.hasMatch(value)) {
      panNumberErrorText = errorMessage;
    } else {
      panNumberErrorText = null;
    }
  }

  void checkTermsAndCheckBoxValue(bool? value, String errorMessage) {
    if (value == null || value == false) {
      checkBox1ErrorText = errorMessage;
    } else {
      checkBox1ErrorText = null;
    }
  }

  void softValidateFields() {
    if (state.panNumber.isNotEmpty &&
        state.privacyPolicyCheckbox == '1' &&
        state.hasDrugLicenseFile1 &&
        state.drugLicenseNum1.isNotEmpty) {
      emit(state.copyWith(isSoftEnable: true, isLoading: false));
    } else {
      emit(state.copyWith(isSoftEnable: false, isLoading: false));
    }
  }
}
