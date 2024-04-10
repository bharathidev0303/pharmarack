
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';

class OnboardingEndpoints {
  static const String legacyLogin = "/admin/api/login";
  static const String login = "/user/api/${AppConstants.apiVersion}/login";
  static const String refreshToken =
      "/user/api/${AppConstants.apiVersion}/refreshToken";
  static const String verifyOtp =
      "/user/api/${AppConstants.apiVersion}/verifyOtp";
  static const String getRetailerInfo =
      "/user/api/${AppConstants.apiVersion}/get-retailer-info";
  static const String verifyMobileNumber = "/admin/api/VerifyMobileNumber";
  static const String requestResetPassword =
      "/user/api/${AppConstants.apiVersion}/reset-password";
  static const String requestForgetPassword =
      "/user/api/${AppConstants.apiVersion}/forgot-password";
  static const String requestvalidateOtp =
      "/user/api/${AppConstants.apiVersion}/validateOtp";
  static const String checkPasswordUpdateStatus =
      "/user/api/${AppConstants.apiVersion}/checkPasswordUpdateStatus";
  static const String changePassword =
      "/user/api/${AppConstants.apiVersion}/changePassword";
  static const String getBusinessType =
      "/user/api/${AppConstants.apiVersion}/GetBusinessTypes";
  static const String getStateList =
      "/user/api/${AppConstants.apiVersion}/States";
  static const String getAddressByPincode =
      "/user/api/${AppConstants.apiVersion}/GetRegistrationDetailesByPincode";
  static const String registerRetailer =
      "/user/api/${AppConstants.apiVersion}/register-retailer";
  static const String checkMobileNumberExists =
      "/user/api/${AppConstants.apiVersion}/CheckMobileNumberExists";
  static const String checkGSTINExists =
      "/user/api/${AppConstants.apiVersion}/CheckGSTINExists";
  static const String uploadDL =
      "/user/api/${AppConstants.apiVersion}/RetailerImageUpload";
  static const String getReferraltermsandconditions =
      "/user/api/${AppConstants.apiVersion}/getReferraltermsandconditions";
  static const String updateRetailerProfile =
      "/user/api/${AppConstants.apiVersion}/UpdateRetailerProfile";
  static const String deleteUserAccount =
      "/user/api/${AppConstants.apiVersion}/deleteUserAccount";
  static const String getOtpForDeleteProfile =
      "/user/api/${AppConstants.apiVersion}/getOtpForDeleteProfile";
}
