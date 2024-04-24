import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pharmarack/auth/user_auth_manager.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/login_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/features/profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:pharmarack/view/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:pharmarack/view/onboarding/data/api_service/change_password_api_service.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/change_password_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/delete_reset_password_data_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/get_reset_password_data_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/login_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/match_saved_password_use_case.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/otp_auth/delete_profile_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/otp_auth/save_login_data_use_case.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/request_delete_otp_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/request_forget_password_uescase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/request_login_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/request_otp_login_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/request_reset_password_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/check_gst_number.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/check_mobile_number.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/get_address_by_pincode.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/get_business_type_use_case.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/get_state_list_use_case.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/retailer_registration_use_case.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/update_retailer_profile_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/upload_drug_licence_number.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/save_reset_password_data_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/save_success_verify_otp_response_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/store_header_use_case.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/store_login_token_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/verify_otp_usecase.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/change_password_screen/reset_password_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/forget_password_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/forgot_password/otp_screen/forget_password_otp_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/otp_screen/otp_screen_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/retailer_registration/step_one/retailer_registration_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/retailer_registration/step_three/retailer_registration_step_three_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/retailer_registration/step_two/retailer_registration_step_two_cubit.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/repository/change_password_repository.dart';
import '../domain/usecase/check_password_update_uescase.dart';
import '../domain/usecase/get_retailer_info_usecase.dart';
import '../domain/usecase/referral_terms_and_condition_usecase.dart';
import '../domain/usecase/save_reset_password_response_usecase.dart';
import '../domain/usecase/validate_otp_usecase.dart';
import '../presentation/cubit/change_password_cubit.dart';
import '../presentation/cubit/forgot_password/otp_screen/delete_profile_otp_screen_cubit.dart';
import '../presentation/cubit/login_screen_cubit.dart';
import '../presentation/cubit/referral_t_and_c_cubit.dart';

final onboardingDI = GetIt.instance;
ProfileCubit profileScreenCubit = ProfileCubit();

final loginUseCaseProvider = onboardingDI.registerSingleton<LoginUseCase>(
    LoginUseCase(onboardingDI<OnboardingRepository>()));

final requestLoginUseCaseProvider =
    onboardingDI.registerSingleton<RequestLoginUseCase>(
        RequestLoginUseCase(onboardingDI<OnboardingRepository>()));

final storeTokenUseCaseProvider =
    onboardingDI.registerSingleton<StoreLoginTokenUseCase>(
        StoreLoginTokenUseCase(onboardingDI<OnboardingRepository>()));

final storeHeaderUseCaseProvider =
    onboardingDI.registerSingleton<StoreHeaderUseCase>(
        StoreHeaderUseCase(onboardingDI<OnboardingRepository>()));

final saveLoginDataUseCaseProvider =
    onboardingDI.registerSingleton<SaveLoginDataUseCase>(
        SaveLoginDataUseCase(onboardingDI<OnboardingRepository>()));

final saveResetPasswordDataUseCaseProvider =
    onboardingDI.registerSingleton<SaveResetPasswordDataUseCase>(
        SaveResetPasswordDataUseCase(
            onboardingRepository: onboardingDI<OnboardingRepository>()));

final requestResetPasswordUseCaseProvider =
    onboardingDI.registerSingleton<RequestForgetPasswordUseCase>(
        RequestForgetPasswordUseCase(
            onboardingRepository: onboardingDI<OnboardingRepository>()));

final requestDeleteAccountOtpUseCaseProvider = onboardingDI
    .registerSingleton<RequestDeleteOtpUseCase>(RequestDeleteOtpUseCase(
        onboardingRepository: onboardingDI<OnboardingRepository>()));

final requestDeleteProfileUseCaseProvider = onboardingDI
    .registerSingleton<RequestDeleteProfileUseCase>(RequestDeleteProfileUseCase(
        onboardingRepository: onboardingDI<OnboardingRepository>()));

final requestOtpLoginUseCaseProvider = onboardingDI
    .registerSingleton<RequestOtpLoginUseCase>(RequestOtpLoginUseCase(
        onboardingRepository: onboardingDI<OnboardingRepository>()));

final requestChangePasswordUseCaseProvider = onboardingDI
    .registerSingleton<RequestResetPasswordUseCase>(RequestResetPasswordUseCase(
        onboardingRepository: onboardingDI<OnboardingRepository>()));

final getResetPasswordDataUseCaseProvider = onboardingDI
    .registerSingleton<GetResetPasswordDataUseCase>(GetResetPasswordDataUseCase(
        onboardingRepository: onboardingDI<OnboardingRepository>()));

final checkPasswordUpdateUseCaseProvider = onboardingDI
    .registerSingleton<CheckPasswordUpdateUseCase>(CheckPasswordUpdateUseCase(
        onboardingRepository: onboardingDI<OnboardingRepository>()));

final deleteResetPasswordDataUseCaseProvider =
    onboardingDI.registerSingleton<DeleteResetPasswordDataUseCase>(
        DeleteResetPasswordDataUseCase(
            onboardingRepository: onboardingDI<OnboardingRepository>()));

final verifyOtpUseCaseProvider =
    onboardingDI.registerSingleton<VerifyOtpUseCase>(VerifyOtpUseCase(
        onboardingRepository: onboardingDI<OnboardingRepository>()));

final validateOTPData = onboardingDI.registerSingleton<ValidateOtpUseCase>(
    ValidateOtpUseCase(onboardingDI<OnboardingRepository>()));

final saveOtpResponseData = onboardingDI.registerSingleton<
        SaveSuccessVerifyOtpResponseUseCase>(
    SaveSuccessVerifyOtpResponseUseCase(onboardingDI<OnboardingRepository>()));

final saveResetPasswordResponseData =
    onboardingDI.registerSingleton<SaveResetPasswordResponseUseCase>(
        SaveResetPasswordResponseUseCase(onboardingDI<OnboardingRepository>()));

final getRetailerInfoUseCaseProvider =
    onboardingDI.registerSingleton<GetRetailerInfoUseCase>(
        GetRetailerInfoUseCase(onboardingDI<OnboardingRepository>()));

void initDependency() {
  onboardingDI
      .registerFactory<LoginScreenTextCubit>(() => LoginScreenTextCubit());

  onboardingDI.registerFactory<LoginScreenCubit>(() => LoginScreenCubit(
        storeHeaderUseCaseProvider,
        requestLoginUseCaseProvider,
        checkPasswordUpdateUseCaseProvider,
        loginScreenTextCubit: onboardingDI<LoginScreenTextCubit>(),
      ));
}

void initOtpDependency() {
  onboardingDI.registerFactory<OtpFieldCubit>(() => OtpFieldCubit());
  onboardingDI.registerFactory<ResendButtonCubit>(() => ResendButtonCubit());
  FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
  onboardingDI.registerFactory<OtpScreenCubit>(
    () => OtpScreenCubit(
      verifyOtpUseCaseProvider,
      requestLoginUseCaseProvider,
      saveOtpResponseData,
      getRetailerInfoUseCaseProvider,
      flutterSecureStorage,
      otpFieldCubit: onboardingDI<OtpFieldCubit>(),
      resendButtonCubit: onboardingDI<ResendButtonCubit>(),
    ),
  );
}

void initForgotPasswordOtpDependency() {
  onboardingDI.registerFactory<OtpFieldCubit>(() => OtpFieldCubit());
  onboardingDI.registerFactory<ResendButtonCubit>(() => ResendButtonCubit());
  onboardingDI.registerFactory<ForgotPasswordOtpScreenCubit>(
    () => ForgotPasswordOtpScreenCubit(
      requestOtpLoginUseCaseProvider,
      storeHeaderUseCaseProvider,
      saveResetPasswordDataUseCaseProvider,
      requestResetPasswordUseCaseProvider,
      verifyOtpUseCaseProvider,
      validateOTPData,
      saveOtpResponseData,
      otpFieldCubit: onboardingDI<OtpFieldCubit>(),
      resendButtonCubit: onboardingDI<ResendButtonCubit>(),
    ),
  );
}

void initDeleteAccountOtpDependency() {
  onboardingDI.registerFactory<OtpFieldCubit>(() => OtpFieldCubit());
  onboardingDI.registerFactory<ResendButtonCubit>(() => ResendButtonCubit());
  onboardingDI.registerFactory<DeleteAccountOtpScreenCubit>(
    () => DeleteAccountOtpScreenCubit(
      requestOtpLoginUseCaseProvider,
      storeHeaderUseCaseProvider,
      saveResetPasswordDataUseCaseProvider,
      requestDeleteProfileUseCaseProvider,
      requestDeleteAccountOtpUseCaseProvider,
      verifyOtpUseCaseProvider,
      validateOTPData,
      saveOtpResponseData,
      otpFieldCubit: onboardingDI<OtpFieldCubit>(),
      resendButtonCubit: onboardingDI<ResendButtonCubit>(),
    ),
  );
}

void initChangePasswordScreenDependency() {
  onboardingDI
      .registerFactory<NewPasswordFieldCubit>(() => NewPasswordFieldCubit());
  onboardingDI.registerFactory<ConfirmNewPasswordCubit>(
      () => ConfirmNewPasswordCubit());
  onboardingDI.registerFactory<ResetPasswordScreenCubit>(() =>
      ResetPasswordScreenCubit(
          requestChangePasswordUseCaseProvider,
          loginUseCaseProvider,
          storeHeaderUseCaseProvider,
          saveLoginDataUseCaseProvider,
          getResetPasswordDataUseCaseProvider,
          deleteResetPasswordDataUseCaseProvider,
          requestLoginUseCaseProvider,
          saveResetPasswordResponseData,
          getRetailerInfoUseCaseProvider,
          newPasswordFieldCubit: onboardingDI<NewPasswordFieldCubit>(),
          confirmNewPasswordCubit: onboardingDI<ConfirmNewPasswordCubit>()));
}

void initForgotPasswordScreenDependency() {
  onboardingDI
      .registerFactory<MobileNumberFieldCubit>(() => MobileNumberFieldCubit());
  onboardingDI.registerFactory<ForgotPasswordScreenCubit>(
    () => ForgotPasswordScreenCubit(
      requestResetPasswordUseCaseProvider,
      onboardingDI<MobileNumberFieldCubit>(),
    ),
  );
}

void setLoginEntity(LoginEntity loginEntity) {
  if (!onboardingDI.isRegistered<LoginEntity>()) {
    onboardingDI.registerSingleton<LoginEntity>(loginEntity);
  }
}

void initChangePasswordDependency(GetIt getIt) {
  getIt.registerFactory<ChangePasswordApiService>(
    () => ChangePasswordApiService(
        getIt.get<Dio>(instanceName: AppConstants.baseUrlDioConstant)),
  );
  getIt.registerFactory<ChangePasswordRepository>(
    () => ChangePasswordRepository(
      getIt.get<ChangePasswordApiService>(),
    ),
  );
  getIt.registerFactory<ChangePasswordUseCase>(
    () => ChangePasswordUseCase(
      getIt.get<ChangePasswordRepository>(),
      getIt.get<RetailerInfoEntity>(),
      getIt.get<UserAuthManager>(
          instanceName: AppConstants.legacyBaseUrlUserAuthManager),
    ),
  );
  getIt.registerFactory<MatchSavedPasswordUseCase>(
    () => MatchSavedPasswordUseCase(getIt.get<UserAuthManager>(
        instanceName: AppConstants.legacyBaseUrlUserAuthManager)),
  );
  getIt.registerFactory<ChangePasswordCubit>(
    () => ChangePasswordCubit(
      getIt.get<ChangePasswordUseCase>(),
      getIt.get<MatchSavedPasswordUseCase>(),
    ),
  );
}

void initProfileCubit() {
  if (!getIt.isRegistered<ProfileCubit>()) {
    getIt.registerSingleton<ProfileCubit>(ProfileCubit());
  }
  if (!getIt.isRegistered<EditProfileCubit>()) {
    getIt.registerSingleton<EditProfileCubit>(EditProfileCubit(
        UpdateRetailerProfileUsecase(onboardingRepository: onboardingDI()),
        UploadDrugLicenceUseCase(onboardingDI())));
  }
}

void clearProfileCubit() {
  getIt.unregister<ProfileCubit>();
  getIt.unregister<EditProfileCubit>();
}

/// Common data use case
final retailerRegistrationUserCase =
    onboardingDI.registerSingleton<RetailerRegistrationUserCase>(
        RetailerRegistrationUserCase(onboardingDI<OnboardingRepository>()));

/// Business Type List
final getBusinessTypeUseCase =
    onboardingDI.registerSingleton<GetBusinessTypeUseCase>(
        GetBusinessTypeUseCase(onboardingDI<OnboardingRepository>()));

/// Get Address By PinCode
final getAddressByPincodeUseCase =
    onboardingDI.registerSingleton<GetAddressByPinCodeUseCase>(
        GetAddressByPinCodeUseCase(onboardingDI<OnboardingRepository>()));

/// States
final getGetStatesUseCase = onboardingDI.registerSingleton<GetStatesUseCase>(
    GetStatesUseCase(onboardingDI<OnboardingRepository>()));

/// Check mobile number
final checkMobilNumberUseCase =
    onboardingDI.registerSingleton<CheckMobileNumberUseCase>(
        CheckMobileNumberUseCase(onboardingDI<OnboardingRepository>()));

/// Check GST number
final checkGSTNumberUseCase =
    onboardingDI.registerSingleton<CheckGSTNumberUseCase>(
        CheckGSTNumberUseCase(onboardingDI<OnboardingRepository>()));

/// Upload drug licence UploadDrugLicenceUseCase
final uploadDLUseCase =
    onboardingDI.registerSingleton<UploadDrugLicenceUseCase>(
        UploadDrugLicenceUseCase(onboardingDI<OnboardingRepository>()));

/// Refferal Terms and Condition Usecase
final referralTAndCUseCase =
    onboardingDI.registerSingleton<ReferralTermsAndConditionUsecase>(
        ReferralTermsAndConditionUsecase(onboardingDI<OnboardingRepository>()));

/// Update Retailer Profile Usecase
// final updateRetailerUseCase = onboardingDI.registerSingleton(
//     UpdateRetailerProfileUsecase(onboardingRepository: onboardingDI()));

void initRetailerRegistrationDI() {
  if (!onboardingDI.isRegistered<RetailerRegistrationStepOneCubit>()) {
    /// Main Cubit
    onboardingDI.registerFactory<RetailerRegistrationStepOneCubit>(
      () => RetailerRegistrationStepOneCubit(
          getBusinessTypeUseCase,
          getGetStatesUseCase,
          getAddressByPincodeUseCase,
          retailerRegistrationUserCase),
    );
  }
}

void initRetailerRegistrationStepTwoDI() {
  if (!onboardingDI.isRegistered<RetailerRegistrationStepTwoCubit>()) {
    onboardingDI.registerSingleton<RetailerRegistrationStepTwoCubit>(
        RetailerRegistrationStepTwoCubit(
            retailerRegistrationUserCase, checkMobilNumberUseCase));
  }
}

void initRetailerRegistrationStepThreeDI() {
  if (!onboardingDI.isRegistered<RetailerRegistrationStepThreeCubit>()) {
    onboardingDI.registerSingleton<RetailerRegistrationStepThreeCubit>(
        RetailerRegistrationStepThreeCubit(
            retailerRegistrationUserCase,
            checkGSTNumberUseCase,
            requestLoginUseCaseProvider,
            storeHeaderUseCaseProvider,
            uploadDLUseCase));
  }
}

void initReferralTAndC() {
  if (!onboardingDI.isRegistered<ReferralTAndCCubit>()) {
    onboardingDI.registerSingleton(ReferralTAndCCubit(
      referralTAndCUseCase,
    ));
  }
}

// void initUpdateRetailerProfile() {
//   if (!onboardingDI.isRegistered<UpdateRetailerProfileCubit>()) {
//     onboardingDI.registerSingleton(UpdateRetailerProfileCubit(
//       updateRetailerUseCase,
//     ));
//   }
// }

unregisterAllRegistrationDI() {
  unregisterIfRegistered<RetailerRegistrationUserCase>();
  unregisterIfRegistered<GetBusinessTypeUseCase>();
  unregisterIfRegistered<GetAddressByPinCodeUseCase>();
  unregisterIfRegistered<GetStatesUseCase>();
  unregisterIfRegistered<CheckMobileNumberUseCase>();
  unregisterIfRegistered<CheckGSTNumberUseCase>();
  unregisterIfRegistered<RetailerRegistrationStepOneCubit>();
  unregisterIfRegistered<RetailerRegistrationStepTwoCubit>();
  unregisterIfRegistered<RetailerRegistrationStepThreeCubit>();
  unregisterIfRegistered<ReferralTAndCCubit>();
  unregisterIfRegistered<ProfileCubit>();
  // unregisterIfRegistered<EditProfileCubit>();
}

void unregisterIfRegistered<T extends Object>() {
  if (onboardingDI.isRegistered<T>()) {
    onboardingDI.unregister<T>();
  }
}

Future<void> initOneSignal() async {
  late final SharedPreferences _prefs;

  final _prefsFuture = SharedPreferences.getInstance().then((v) => _prefs = v);
  OneSignal.Debug.setLogLevel(
    kDebugMode ? OSLogLevel.verbose : OSLogLevel.none,
  );

  OneSignal.initialize(OnboardingConstants.oneSignalDashboardKey);
  Future.delayed(const Duration(seconds: 3), () {
    final id = OneSignal.User.pushSubscription.id;
    if (id != null) {
      _prefs.setString('oneSignalId', id);
    }
  });

  await OneSignal.Notifications.requestPermission(true);
}

getOneSignalId() async {
  OneSignal.initialize(OnboardingConstants.oneSignalDashboardKey);
  Future.delayed(const Duration(seconds: 3), () {
    final id = OneSignal.User.pushSubscription.id;
    return id;
  });
  await OneSignal.Notifications.requestPermission(true);
}
