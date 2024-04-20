import 'package:dio/dio.dart' hide Headers;
import 'package:pharmarack/packages/core_flutter/common_entity/common_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/get_refresh_token_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/verify_otp_response_entity.dart';

import 'package:pharmarack/view/onboarding/data/endpoints_constants/onboarding_endpoints.dart';
import 'package:pharmarack/view/onboarding/data/endpoints_constants/onboarding_options.dart';
import 'package:pharmarack/view/onboarding/data/entities/delete_account_otp_entity.dart';
import 'package:pharmarack/view/onboarding/data/entities/login_response_entity.dart';
import 'package:pharmarack/view/onboarding/data/entities/retailer_Image_upload_entity.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/delete_profile_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../domain/model/registration_response_model.dart';
import '../../domain/model/update_retailer_model.dart';
import '../entities/forget_password_entity.dart';
import '../entities/reset_password_response_entity.dart';
import '../entities/retailer_registration/business_type.dart';
import '../entities/retailer_registration/mobile_number.dart';
import '../entities/retailer_registration/pincode_data.dart';
import '../entities/retailer_registration/state.dart';

part 'onboarding_api_service.g.dart';

@RestApi()
abstract class OnboardingApiService {
  factory OnboardingApiService(Dio dio) = _OnboardingApiService;

  @Headers(
      <String, String>{'Content-Type': 'application/x-www-form-urlencoded'})
  @FormUrlEncoded()
  @POST(OnboardingEndpoints.login)
  Future<HttpResponse<CommonResponseEntity<LoginResponseEntity>>> requestLogin(
    @Field(OnBoardingOptions.userName) String userName,
    @Field(OnBoardingOptions.password) String password,
  );

  @Headers(<String, String>{'Content-Type': 'application/json'})
  @POST(OnboardingEndpoints.verifyOtp)
  Future<HttpResponse<CommonResponseEntity<VerifyOtpResponseEntity>>> verifyOtp(
      @Body() Map<String, dynamic> requestBody);

  @Headers(<String, String>{'Content-Type': 'application/json'})
  @GET(OnboardingEndpoints.getRetailerInfo)
  Future<HttpResponse<CommonResponseEntity<RetailerInfoEntity>>>
      getRetailerInfo();

  @Headers(
      <String, String>{'Content-Type': 'application/x-www-form-urlencoded'})
  @FormUrlEncoded()
  @POST(OnboardingEndpoints.refreshToken)
  Future<HttpResponse<CommonResponseEntity<GetRefreshTokenResponseEntity>>>
      refreshToken(
    @Field(OnBoardingOptions.refreshToken) String refreshToken,
    @Field(OnBoardingOptions.userID) int userId,
  );

  @Headers(<String, String>{'Content-Type': 'application/json'})
  @GET(OnboardingEndpoints.getBusinessType)
  Future<HttpResponse<CommonResponseEntity<List<BusinessType>>>>
      getBusinessType();

  @Headers(<String, String>{'Content-Type': 'application/json'})
  @GET(OnboardingEndpoints.getStateList)
  Future<HttpResponse<CommonResponseEntity<List<AddressState>>>> getStateList();

  @Headers(<String, String>{'Content-Type': 'application/json'})
  @POST(OnboardingEndpoints.getAddressByPincode)
  Future<HttpResponse<CommonResponseEntity<PincodeData>>> getAddressByPincode(
      @Body() Map<String, String> requestBody);

  @Headers(<String, String>{'Content-Type': 'application/json'})
  @POST(OnboardingEndpoints.checkMobileNumberExists)
  Future<HttpResponse<MobileNumberEntity>> checkMobileNumber(
    @Body() Map<String, dynamic> requestBody,
  );

  @RestApi(baseUrl: "https://pharmretail-modernization-dev-web.pharmarack.com")
  @Headers(<String, String>{'Content-Type': 'application/json'})
  @POST(OnboardingEndpoints.checkGSTINExists)
  Future<HttpResponse<CommonResponseEntity<String>>> checkGSTNumber(
    @Body() Map<String, String> requestBody,
  );

  // @Headers(<String, String>{'Content-Type': 'multipart/form-data'})
  @Headers(<String, String>{'Content-Type': 'application/json'})
  @POST(OnboardingEndpoints.uploadDL)
  Future<HttpResponse<RetailerImageUploadEntity>> uploadDLServer(
    @Body() FormData formData,
    @Query("type") String type,
    @Query("UserId") String userId,
  );

  @Headers(<String, String>{'Content-Type': 'application/json'})
  @POST(OnboardingEndpoints.registerRetailer)
  Future<HttpResponse<CommonResponseEntity<RegistrationResponseModel>>>
      registerRetailer(
    @Body() Map<String, dynamic> requestBody,
  );

  @Headers(
      <String, String>{'Content-Type': 'application/x-www-form-urlencoded'})
  @POST(OnboardingEndpoints.requestForgetPassword)
  Future<HttpResponse<ForgetPasswordEntity>> forgetPassword(
    @Field(OnBoardingOptions.mobileNumber) String mobileNumber,
    @Field(OnBoardingOptions.email) String email,
  );

  @RestApi(baseUrl: "https://pharmretail-modernization-dev-web.pharmarack.com")
  @Headers(<String, String>{'Content-Type': 'application/json'})
  @POST(OnboardingEndpoints.requestvalidateOtp)
  Future<HttpResponse<CommonResponseEntity>> validateOtp(
    @Field(OnBoardingOptions.mobile_number) String mobileNumber,
    @Field(OnBoardingOptions.otp) String otp,
  );

  @Headers(<String, String>{'Content-Type': 'application/json'})
  @POST(OnboardingEndpoints.checkPasswordUpdateStatus)
  Future<HttpResponse<ForgetPasswordEntity>> checkPasswordUpdate(
    @Field(OnBoardingOptions.userName) String username,
  );

  @Headers(<String, String>{'Content-Type': 'application/json'})
  @FormUrlEncoded()
  @POST(OnboardingEndpoints.requestResetPassword)
  Future<HttpResponse<ResetPasswordResponseEntity>> requestResetPassword(
    @Body() Map<String, dynamic> requestBody,
  );

  @Headers(<String, String>{'Content-Type': 'application/json'})
  @GET(OnboardingEndpoints.getReferraltermsandconditions)
  Future<HttpResponse<CommonResponseEntity<List<String>>>>
      getReferraltermsandconditions();

  @Headers(<String, String>{'Content-Type': 'application/json'})
  @POST(OnboardingEndpoints.updateRetailerProfile)
  Future<HttpResponse<UpdateRetailerModel>> updateRetailerProfile(
    @Body() Map<String, dynamic> requestBody,
  );

  @Headers(<String, String>{
    'Content-Type': 'application/json',
  })
  @POST(OnboardingEndpoints.deleteUserAccount)
  Future<HttpResponse<DeleteProfileModel>> deleteAccount(
    @Field(OnBoardingOptions.otp) String otp,
    @Header('Authorization') String token,
  );

  @Headers(<String, String>{'Content-Type': 'application/json'})
  @GET(OnboardingEndpoints.getOtpForDeleteProfile)
  Future<HttpResponse<DeleteAccountOtpEntity>> getOtpForDeleteProfile();
}
