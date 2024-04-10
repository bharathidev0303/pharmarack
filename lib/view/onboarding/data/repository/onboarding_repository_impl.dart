
import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/database_error.dart';
import 'package:pharmarack/packages/core_flutter/error/local_error.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/packages/common_entity/login_entity.dart';
import 'package:pharmarack/packages/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/common_entity/verify_otp_response_entity.dart';
import 'package:pharmarack/view/onboarding/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:pharmarack/view/onboarding/data/entities/otp_login_api_payload_entity.dart';
import 'package:pharmarack/view/onboarding/domain/model/delete_account_otp_model.dart';
import 'package:pharmarack/view/onboarding/domain/model/forget_password_model.dart';
import 'package:pharmarack/view/onboarding/domain/model/login_model.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/business_type.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/delete_profile_model.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/pincode_data.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/state.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/verify_otp_usecase.dart';


import '../../domain/model/registration_response_model.dart';
import '../../domain/model/retailer_registration/mobile_number.dart';
import '../../domain/model/update_retailer_model.dart';
import '../data_source/local_data_source/local_data_source.dart';
import '../entities/forget_password_entity.dart';
import '../entities/login_response_entity.dart';
import '../entities/reset_password_response_entity.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingRemoteDataSource _onboardingRemoteDataSource;
  final OnboardingLocalDBService _onboardingLocalDBService;

  OnboardingRepositoryImpl(
      this._onboardingRemoteDataSource, this._onboardingLocalDBService);

  @override
  Future<Either<NetworkError, LoginModel>> requestLegacyLogin() {
    return _onboardingRemoteDataSource.requestLegacyLogin();
  }

  @override
  Future<Either<DatabaseError, bool>> saveLoginData(
      String key, LoginEntity value) async {
    return _onboardingLocalDBService.saveLoginData(key, value);
  }

  @override
  Future<Either<NetworkError, ForgetPasswordModel>> requestForgetPassword(
      String mobileNumber, String email) async {
    return _onboardingRemoteDataSource.requestForgetPassword(
        mobileNumber, email);
  }

  @override
  Future<Either<NetworkError, String>> requestValidateOtp(
      String mobileNumber, String otp) {
    return _onboardingRemoteDataSource.validateOtp(mobileNumber, otp);
  }

  @override
  Future<Either<NetworkError, ForgetPasswordEntity>> checkPasswordUpdate(
      String username) async {
    return _onboardingRemoteDataSource.checkPasswordUpdate(username);
  }

  @override
  Future<Either<LocalError, bool>> saveUserEncodedInfo(String encodedString) {
    return _onboardingLocalDBService.storeUserEncodedInfo(encodedString);
  }

  @override
  Future<Either<NetworkError, LoginModel>> requestOtpLogin(
      OtpLoginApiPayloadEntity otpLoginApiPayloadEntity) {
    return _onboardingRemoteDataSource
        .requestOtpLogin(otpLoginApiPayloadEntity);
  }

  @override
  Future<Either<NetworkError, ResetPasswordResponseEntity>>
      requestResetPassword(
          String mobileNumber, String otp, String newPassword) {
    return _onboardingRemoteDataSource.requestResetPassword(
        mobileNumber, otp, newPassword);
  }

  @override
  Future<Either<DatabaseError, bool>> storeChangePasswordInfo(
      String oldPassword, String userName, int userId) {
    return _onboardingLocalDBService.storeResetPasswordData(
        oldPassword, userName, userId);
  }

  @override
  Future<Either<DatabaseError, (int, String, String)>> getChangePasswordData() {
    return _onboardingLocalDBService.getResetPasswordData();
  }

  @override
  Future<Either<DatabaseError, bool>> deleteResetPasswordData() {
    return _onboardingLocalDBService.deleteResetPasswordData();
  }

  @override
  Future<Either<NetworkError, List<BusinessTypeModel>>> getBusinessType() {
    return _onboardingRemoteDataSource.getBusinessType();
  }

  @override
  Future<Either<NetworkError, RetailerInfoEntity>> getRetailerInfo() {
    return _onboardingRemoteDataSource.getRetailerInfo();
  }

  @override
  Future<Either<NetworkError, List<AddressStateModel>>> getStateList() {
    return _onboardingRemoteDataSource.getStateList();
  }

  @override
  Future<Either<NetworkError, PincodeDataModel>> getAddressByPinCode(
      Map<String, String> pincodeDataModel) {
    return _onboardingRemoteDataSource.getAddressByPinCode(pincodeDataModel);
  }

  @override
  Future<Either<NetworkError, RegistrationResponseModel>> registerRetailer(
      Map<String, dynamic> registrationModel) {
    return _onboardingRemoteDataSource.registerRetailer(registrationModel);
  }

  @override
  Future<Either<NetworkError, MobileNumberModel>> checkMobileNumber(
      Map<String, dynamic> mobileNumber) {
    return _onboardingRemoteDataSource.checkMobileNumber(mobileNumber);
  }

  @override
  Future<Either<NetworkError, String>> checkGSTNumber(
      Map<String, String> gstNumber) {
    return _onboardingRemoteDataSource.checkGSTNumber(gstNumber);
  }

  @override
  Future<Either<NetworkError, LoginResponseEntity>> requestLogin(
      String userName, String password) {
    return _onboardingRemoteDataSource.requestLogin(userName, password);
  }

  @override
  Future<Either<DatabaseError, bool>> saveLoginTokenInfo(String token) {
    return _onboardingLocalDBService.saveLoginTokenInfo(token);
  }

  @override
  Future<Either<NetworkError, String>> uploadDLServer(
      FormData formData, String type, String userId) {
    return _onboardingRemoteDataSource.uploadDLServer(formData, type, userId);
  }

  @override
  Future<Either<NetworkError, VerifyOtpResponseEntity>> verifyOtp(
      VerifyOtpUseCaseParams verifyOtpUseCaseParams) {
    return _onboardingRemoteDataSource.verifyOtp(verifyOtpUseCaseParams);
  }

  @override
  Future<Either<DatabaseError, bool>> saveSuccessVerifyOtpResponse(
      String key, VerifyOtpResponseEntity value) {
    return _onboardingLocalDBService.saveSuccessVerifyOtpResponse(key, value);
  }

  @override
  Future<Either<DatabaseError, bool>> saveResetPasswordResponse(
      String key, ResetPasswordEntity value) {
    return _onboardingLocalDBService.saveResetPasswordResponse(key, value);
  }

  @override
  Future<Either<NetworkError, List<String>>> getReferralTAndCResponse() {
    return _onboardingRemoteDataSource.getReferraltermsandconditions();
  }

  @override
  Future<Either<NetworkError, UpdateRetailerModel>> updateRetailerProfile(
      Map<String, dynamic> updateRetailerModel) {
    return _onboardingRemoteDataSource
        .updateRetailerProfile(updateRetailerModel);
  }

  @override
  Future<Either<NetworkError, DeleteProfileModel>> deleteAccount(String otp) {
    return _onboardingRemoteDataSource.deleteAccount(otp);
  }

  @override
  Future<Either<NetworkError, DeleteAccountOtpModel>>
      getOtpForDeleteProfile() async {
    return _onboardingRemoteDataSource.getOtpForDeleteProfile();
  }
}
