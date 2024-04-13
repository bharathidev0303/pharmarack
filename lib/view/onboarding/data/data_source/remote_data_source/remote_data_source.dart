import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core/network/interceptor/dio_interceptor.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/login_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/verify_otp_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/onboarding/data/api_service/onboarding_api_service.dart';
import 'package:pharmarack/view/onboarding/data/api_service/onboarding_legacy_api_service.dart';
import 'package:pharmarack/view/onboarding/data/entities/otp_login_api_payload_entity.dart';
import 'package:pharmarack/view/onboarding/data/entities/verify_otp_request_entity.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/domain/model/delete_account_otp_model.dart';
import 'package:pharmarack/view/onboarding/domain/model/forget_password_model.dart';
import 'package:pharmarack/view/onboarding/domain/model/login_model.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/business_type.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/delete_profile_model.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/mobile_number.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/pincode_data.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/state.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/verify_otp_usecase.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';
import 'package:pharmarack/packages/storage_utils/storage_constants.dart';
import 'package:pharmarack/packages/storage_utils/storage_factory.dart';

import '../../../domain/model/registration_response_model.dart';
import '../../../domain/model/update_retailer_model.dart';
import '../../entities/delete_profile_entity.dart';
import '../../entities/forget_password_entity.dart';
import '../../entities/login_response_entity.dart';
import '../../entities/reset_password_api_payload_entity.dart';
import '../../entities/reset_password_response_entity.dart';

class OnboardingRemoteDataSource {
  final OnboardingLegacyApiService _onboardingLegacyApiService;
  final OnboardingApiService _onboardingApiService;

  OnboardingRemoteDataSource(
      this._onboardingLegacyApiService, this._onboardingApiService);

  Future<Either<NetworkError, LoginModel>> requestLegacyLogin() async {
    final response =
        await safeApiCall(_onboardingLegacyApiService.requestLogin());
    return response.fold((l) => left(l), (r) {
      final LoginEntity parsedJson = LoginEntity.fromJson(json.decode(r.data));
      setLoginEntity(parsedJson);
      return right(LoginModel.from(parsedJson));
    });
  }

  Future<Either<NetworkError, LoginResponseEntity>> requestLogin(
      String userName, String password) async {
    final response = await safeApiCall(
        _onboardingApiService.requestLogin(userName, password));
    return response.fold((l) => left(l), (r) {
      if (r.data.data!.mobileNumber == null) {
        return right(r.data.data!);
      } else {
        if (onboardingDI.isRegistered<String>(
            instanceName: OnboardingConstants.loginMobileNumberDiConstant)) {
          onboardingDI.unregister<String>(
              instanceName: OnboardingConstants.loginMobileNumberDiConstant);
        }
        onboardingDI.registerSingleton<String>(r.data.data!.mobileNumber!,
            instanceName: OnboardingConstants.loginMobileNumberDiConstant);
        return right(r.data.data!);
      }
    });
  }

  Future<Either<NetworkError, RetailerInfoEntity>> getRetailerInfo() async {
    final retailerInfoResponse =
        await safeApiCall(_onboardingApiService.getRetailerInfo());

    return retailerInfoResponse.fold((l) => left(l), (r) {
      if (onboardingDI.isRegistered<RetailerInfoEntity>()) {
        onboardingDI.unregister<RetailerInfoEntity>();
      }
      onboardingDI.registerSingleton<RetailerInfoEntity>(r.data.data!);

      return right(r.data.data!);
    });
  }

  Future<Either<NetworkError, VerifyOtpResponseEntity>> verifyOtp(
      VerifyOtpUseCaseParams verifyOtpUseCaseParams) async {
    final response = await safeApiCall(_onboardingApiService.verifyOtp(
        VerifyOtpRequestEntity(
                mobileNo: verifyOtpUseCaseParams.mobileNumber,
                moduleName: verifyOtpUseCaseParams.module,
                otp: verifyOtpUseCaseParams.otp)
            .toJson()));
    return response.fold((l) {
      if (l.error.code == 406) {
        left(l.error.message);
      }
      return left(l);
    }, (r) async {
      final verifyOtpResponse = r;
      if (onboardingDI.isRegistered<VerifyOtpResponseEntity>(
          instanceName: OnboardingConstants.verifyOtpResponseDiConstant)) {
        onboardingDI.unregister<VerifyOtpResponseEntity>(
            instanceName: OnboardingConstants.verifyOtpResponseDiConstant);
      }
      onboardingDI.registerSingleton<VerifyOtpResponseEntity>(r.data.data!,
          instanceName: OnboardingConstants.verifyOtpResponseDiConstant);
      DioInterceptor.updateHeaders(
          onboardingDI<Dio>(instanceName: AppConstants.baseUrlDioConstant),
          {"Authorization": r.data.data!.token!});
      DioInterceptor.updateHeaders(
          onboardingDI<Dio>(
              instanceName: AppConstants.cmsGatewayBaseUrlDioConstant),
          {"Authorization": r.data.data!.token!});

      // final retailerInfoResponse  = getRetailerInfo();
      // if (verifyOtpResponse.data.data!.userData?.isAuthorized == 0) {}

      // final retailerInfoResponse =
      //     await safeApiCall(_onboardingApiService.getRetailerInfo());
      //Todo: Need to remove this call once complete new api migration is done
      // final oldLoginInfoResponse =
      //     await safeApiCall(_onboardingLegacyApiService.requestLogin());
      // oldLoginInfoResponse.fold((l) => null, (r) {
      //   if (onboardingDI.isRegistered<LoginEntity>()) {
      //     onboardingDI.unregister<LoginEntity>();
      //   }
      //   onboardingDI.registerSingleton<LoginEntity>(
      //       LoginEntity.fromJson(json.decode(r.data)));
      // });
      // return retailerInfoResponse.fold((l) => left(l), (r) {
      //   if (onboardingDI.isRegistered<RetailerInfoEntity>()) {
      //     onboardingDI.unregister<RetailerInfoEntity>();
      //   }
      //   onboardingDI.registerSingleton<RetailerInfoEntity>(r.data.data!);
      return right(verifyOtpResponse.data.data!);
      // });
    });
  }

  Future<Either<NetworkError, ForgetPasswordModel>> requestForgetPassword(
      String mobileNumber, String email) async {
    final response = await safeApiCall(
        _onboardingApiService.forgetPassword(mobileNumber, email));
    return response.fold((l) => left(l), (r) {
      return right(ForgetPasswordModel.from(r.data));
    });
  }

  Future<Either<NetworkError, String>> validateOtp(
      String mobileNumber, String otp) async {
    final response =
        await safeApiCall(_onboardingApiService.validateOtp(mobileNumber, otp));

    return response.fold((l) => left(l), (r) {
      return right(r.data.data!);
    });
  }

  Future<Either<NetworkError, ForgetPasswordEntity>> checkPasswordUpdate(
      String username) async {
    final response =
        await safeApiCall(_onboardingApiService.checkPasswordUpdate(username));
    return response.fold((l) => left(l), (r) {
      return right(r.data);
    });
  }

  Future<Either<NetworkError, LoginModel>> requestOtpLogin(
      OtpLoginApiPayloadEntity otpLoginApiPayloadEntity) async {
    final response = await safeApiCall(_onboardingLegacyApiService
        .requestOtpLogin(otpLoginApiPayloadEntity.toJson()));
    return response.fold((l) => left(l), (r) => right(LoginModel.from(r.data)));
  }

  Future<Either<NetworkError, ResetPasswordResponseEntity>>
      requestResetPassword(
          String mobileNumber, String otp, String newPassword) async {
    final response = await safeApiCall(_onboardingApiService
        .requestResetPassword(ResetPasswordApiPayloadEntity(
                mobileNumber: mobileNumber, otp: otp, newPassword: newPassword)
            .toJson()));

    return response.fold((l) => left(l), (r) => right(r.data));
  }

  Future<Either<NetworkError, List<BusinessTypeModel>>>
      getBusinessType() async {
    final response = await safeApiCall(_onboardingApiService.getBusinessType());

    return response.fold((l) => left(l), (r) {
      return right(r.data.data!.map((e) => BusinessTypeModel.from(e)).toList());
    });
  }

  Future<Either<NetworkError, List<AddressStateModel>>> getStateList() async {
    final response = await safeApiCall(_onboardingApiService.getStateList());
    return response.fold((l) => left(l), (r) {
      return right(r.data.data!.map((e) => AddressStateModel.from(e)).toList());
    });
  }

  Future<Either<NetworkError, PincodeDataModel>> getAddressByPinCode(
      Map<String, String> pincodeDataModel) async {
    final response = await safeApiCall(
        _onboardingApiService.getAddressByPincode(pincodeDataModel));

    return response.fold((l) => left(l), (r) {
      return right(PincodeDataModel.from(r.data.data!));
    });
  }

  Future<Either<NetworkError, RegistrationResponseModel>> registerRetailer(
      Map<String, dynamic> registrationRequestModel) async {
    final response = await safeApiCall(
        _onboardingApiService.registerRetailer(registrationRequestModel));

    return response.fold((l) => left(l), (r) {
      return right(r.data.data!);
    });
  }

  Future<Either<NetworkError, MobileNumberModel>> checkMobileNumber(
      Map<String, dynamic> mobileNumber) async {
    final response = await safeApiCall(
        _onboardingApiService.checkMobileNumber(mobileNumber));

    return response.fold((l) => left(l), (r) {
      return right(MobileNumberModel.from(r.data));
    });
  }

  Future<Either<NetworkError, String>> checkGSTNumber(
      Map<String, String> gstNumber) async {
    final response =
        await safeApiCall(_onboardingApiService.checkGSTNumber(gstNumber));

    return response.fold((l) => left(l), (r) {
      return right(r.data.data!);
    });
  }

  Future<Either<NetworkError, String>> uploadDLServer(
      FormData formData, String type, String userId) async {
    final response = await safeApiCall(
        _onboardingApiService.uploadDLServer(formData, type, userId));

    return response.fold((l) => left(l), (r) {
      return right(r.data.data!);
    });
  }

  Future<Either<NetworkError, List<String>>>
      getReferraltermsandconditions() async {
    final response = await safeApiCall(
        _onboardingApiService.getReferraltermsandconditions());
    return response.fold((l) => left(l), (r) {
      return right(r.data.data!);
    });
  }

  Future<Either<NetworkError, UpdateRetailerModel>> updateRetailerProfile(
      Map<String, dynamic> requestBody) async {
    final response = await safeApiCall(
        _onboardingApiService.updateRetailerProfile(requestBody));

    return response.fold((l) => left(l), (r) {
      return right(r.data!);
    });
  }

  Future<Either<NetworkError, DeleteProfileModel>> deleteAccount(
      String otp) async {
    String? loginToken = await StorageFactory.getStorage(isSecure: true)
        .getItem(key: StorageConstants.authToken);
    final response = await safeApiCall(
        _onboardingApiService.deleteAccount(otp, loginToken!));
    return response.fold((l) => left(l), (r) {
      return right(DeleteProfileModel.fromJson(json.decode(r.data as String)));
    });
  }

  Future<Either<NetworkError, DeleteAccountOtpModel>>
      getOtpForDeleteProfile() async {
    final response =
        await safeApiCall(_onboardingApiService.getOtpForDeleteProfile());

    return response.fold((l) => left(l), (r) {
      return right(r.response.data!);
    });
  }
}
