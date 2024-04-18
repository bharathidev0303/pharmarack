import 'package:flutter/material.dart';

class OnboardingConstants {
  static const String usernameField = "userNameField";
  static const String passwordField = "passwordField";
  static const String loginButton = "loginButton";
  static const String otpField = "otpField";
  static const String sendOtpButton = "SendOtpButton";
  static const String mobileNumberTextField = "mobileNumberTextField";
  static const String commonTextField = "commonTextField";
  static const String commonHintText = "commonHintText";
  static const String continuePasswordButton = "continuePasswordButton";
  static const String newPasswordField = "newPasswordField";
  static const String confirmNewPasswordField = "confirmNewPasswordField";
  static const String otpButtonField = "otpButtonField";
  static const String changePasswordScreenErrorText =
      "changePasswordScreenErrorText";
  static const String tokenDiConstant = "tokenDiConstant";
  static const String otpScreenTextField = "otpScreenTextField";
  static const String resendButton = "resendButton";
  static const String continueOtpButton = "continueOtpButton";
  static const String mobileNumberDiConstant = "mobile_number";
  static const String loginMobileNumberDiConstant =
      "loginMobileNumberDiConstant";
  static const String loginUserName = "loginUserName";
  static const String loginPassword = "loginPassword";
  static const String verifyOtpResponseDiConstant =
      "verifyOtpResponseDiConstant";
  static const String resetPasswordResponseDiConstant =
      "resetPasswordResponseDiConstant";
  static const String showDialogDiConstant = "showDialog";
  static const String stepOneNextButton = "stepOneNextButton";
  static const String stepOneBackButton = "stepOneBackButton";
  static const String stepTwoNextButton = "stepOneBackButton";
  static const String stepTwoBackButton = "stepOneBackButton";
  static const String stepThreeNextButton = "stepThreeNextButton";

  /// Data source constants
  static const String loginDataKey = "loginData";
  static const String mobileNumber = "mobileNumber";
  static const String userEncodedHeaderKey = "userEncodedHeaderKey";
  static const String otpResponseEntityKey = "otpResponseEntityKey";
  static const String resendPasswordResponseEntityKey =
      "resendPasswordResponseEntityKey";
  static const String module = "login";

  /// Keys
  static const keyCurrentPwd = Key('currentPwd');
  static const keyNewPwd = Key('newPwd');
  static const keyConfirmPwd = Key('confirmPwd');

  /// Registration constants
  /// Step - 1
  static const String typeOfBusiness = "typeOfBusiness";
  static const String nameOfShopFirm = "nameOfShopFirm";
  static const String nameOfOwner = "nameOfOwner";
  static const String shopAddress = "shopAddress";
  static const String pincode = "pincode";
  static const String area = "area";
  static const String region = "region";
  static const String city = "city";
  static const String state = "state";
  static const String regionId = "regionId";
  static const String stateId = "stateId";

  /// Step - 2
  static const String registrationMobileNumber = "registrationMobileNumber";
  static const String registrationEmail = "registrationEmail";
  static const String pharmacistName = "pharmacistName";
  static const String pharmacistNumber = "pharmacistNumber";
  static const String pharmacistName2 = "pharmacistName2";
  static const String pharmacistNumber2 = "pharmacistNumber2";
  static const String pharmacistName3 = "pharmacistName3";
  static const String pharmacistNumber3 = "pharmacistNumber3";
  static const String password = "password";
  static const String addPharmacistButton = "addPharmacistButton";
  static const String addPharmacistErrorText = "addPharmacistErrorText";

  /// Step - 3
  static const String gstinNumber = "gstinNumber";
  static const String panNumber = "panNumber";
  static const String referralCode = "referralCode";
  static const String privacyPolicyCheckbox = "privacyPolicyCheckbox";
  static const String whatsappConsentCheckbox = "whatsappConsentCheckbox";
  static const String drugLicenseNum1 = "drugLicenseNum1";
  static const String drugLicenseNum2 = "drugLicenseNum2";
  static const String drugLicenseNum3 = "drugLicenseNum3";
  static const String drugLicenseFile1 = "drugLicenseFile1";
  static const String drugLicenseFile2 = "drugLicenseFile2";
  static const String drugLicenseFile3 = "drugLicenseFile3";
  static const String removeFileButton = "removeFileButton";
  static const String areaSelectionDialog = "areaSelectionDialog";

  /// Need to redirect user to privacy policy url
  static const privacyPolicy = 'https://pharmarack.com/privacypolicy';
  static const termsAndConditions =
      'https://pharmarack.com/terms_and_conditions';

  ///Edit Profile
  static const String name = "name";
  static const String telephoneNumber = "telephoneNumber";
  static const String pan = "pan";
  static const String upiId = "upiId";
  static const String bankNme = "bankNme";
  static const String accountType = "accountType";
  static const String accountNumber = "accountNumber";
  static const String accountHolderName = "accountHolderName";
  static const String ifsc = "ifsc";
  static const String oneSignalDashboardKey =
      '31d03b5b-bee9-4c20-8abd-0c19e37bc61c';
}

enum VerificationStatus { emptyOtp, otpMatch, otpMismatch }

enum DrugLicenseError { drugLicenseError1, drugLicenseError2, empty }

enum AddPharmacistError { addRetailerError1, addRetailerError2, empty }
