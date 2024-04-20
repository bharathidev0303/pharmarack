import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/login_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/verify_otp_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/error/database_error.dart';
import 'package:pharmarack/packages/core_flutter/error/local_error.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/onboarding/data/entities/otp_login_api_payload_entity.dart';
import 'package:pharmarack/view/onboarding/data/entities/retailer_Image_upload_entity.dart';
import 'package:pharmarack/view/onboarding/domain/model/delete_account_otp_model.dart';
import 'package:pharmarack/view/onboarding/domain/model/forget_password_model.dart';
import 'package:pharmarack/view/onboarding/domain/model/login_model.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/business_type.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/delete_profile_model.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/pincode_data.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/state.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/verify_otp_usecase.dart';
import '../../data/entities/forget_password_entity.dart';
import '../../data/entities/login_response_entity.dart';
import '../../data/entities/reset_password_response_entity.dart';
import '../model/registration_response_model.dart';
import '../model/retailer_registration/mobile_number.dart';
import '../model/update_retailer_model.dart';

abstract class OnboardingRepository {
  Future<Either<NetworkError, LoginModel>> requestLegacyLogin();

  Future<Either<NetworkError, LoginResponseEntity>> requestLogin(
      String userName, String password);

  Future<Either<NetworkError, VerifyOtpResponseEntity>> verifyOtp(
      VerifyOtpUseCaseParams verifyOtpUseCaseParams);

  Future<Either<DatabaseError, bool>> saveSuccessVerifyOtpResponse(
      String key, VerifyOtpResponseEntity value);

  Future<Either<DatabaseError, bool>> saveResetPasswordResponse(
      String key, ResetPasswordEntity value);

  Future<Either<DatabaseError, bool>> saveLoginData(
      String key, LoginEntity value);

  Future<Either<LocalError, bool>> saveUserEncodedInfo(String encodedString);

  Future<Either<DatabaseError, bool>> saveLoginTokenInfo(String token);

  Future<Either<NetworkError, LoginModel>> requestOtpLogin(
      OtpLoginApiPayloadEntity otpLoginApiPayloadEntity);

  Future<Either<NetworkError, ForgetPasswordModel>> requestForgetPassword(
      String mobileNumber, String email);

  Future<Either<NetworkError, String>> requestValidateOtp(
      String mobileNumber, String otp);

  Future<Either<NetworkError, ResetPasswordResponseEntity>>
      requestResetPassword(String mobileNumber, String newPassword, String otp);

  Future<Either<NetworkError, ForgetPasswordEntity>> checkPasswordUpdate(
      String username);

  Future<Either<DatabaseError, bool>> storeChangePasswordInfo(
      String oldPassword, String userName, int userId);

  Future<Either<DatabaseError, (int, String, String)>> getChangePasswordData();

  Future<Either<DatabaseError, bool>> deleteResetPasswordData();

  Future<Either<NetworkError, List<BusinessTypeModel>>> getBusinessType();

  Future<Either<NetworkError, RetailerInfoEntity>> getRetailerInfo();

  Future<Either<NetworkError, List<AddressStateModel>>> getStateList();

  Future<Either<NetworkError, PincodeDataModel>> getAddressByPinCode(
      Map<String, String> pincodeDataModel);

  Future<Either<NetworkError, MobileNumberModel>> checkMobileNumber(
      Map<String, dynamic> mobileNumber);

  Future<Either<NetworkError, String>> checkGSTNumber(
      Map<String, String> gstNumber);

  Future<Either<NetworkError, RegistrationResponseModel>> registerRetailer(
      Map<String, dynamic> registrationModel);

  Future<Either<NetworkError, RetailerImageUploadEntity>> uploadDLServer(
      FormData formData, String type, String userId);

  Future<Either<NetworkError, List<String>>> getReferralTAndCResponse();

  Future<Either<NetworkError, UpdateRetailerModel>> updateRetailerProfile(
      Map<String, dynamic> updateRetailerModel);

  Future<Either<NetworkError, DeleteProfileModel>> deleteAccount(String otp);

  Future<Either<NetworkError, DeleteAccountOtpModel>> getOtpForDeleteProfile();
}
