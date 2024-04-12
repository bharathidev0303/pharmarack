import 'dart:collection';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/common_entity/login_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_model/common_success_dialog_info_model.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/retailer_registration/step_three/retailer_registration_step_three_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/retailer_registration/step_three/retailer_registration_step_three_state.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/checkbox_form_field.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/image_picker_field.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_common_button.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_validator_input_text.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/registration_stepper.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';
import 'package:pharmarack/view/onboarding/utils/onboarding_validators.dart';

import '../../../cubit/referral_t_and_c_cubit.dart';
import '../../../cubit/update_retailer_profile_cubit.dart';

class StepThreeMobileScreen extends StatefulWidget {
  const StepThreeMobileScreen({super.key});

  @override
  State<StepThreeMobileScreen> createState() => _StepThreeMobileScreenState();
}

class _StepThreeMobileScreenState extends State<StepThreeMobileScreen> {
  final _formKey = GlobalKey<FormState>();
  final cubit = onboardingDI<RetailerRegistrationStepThreeCubit>();
  final Map<String, String> reqMap = HashMap();
  final gstNumberTextController = TextEditingController();
  final panNumberTextController = TextEditingController();
  final referralCodeTextController = TextEditingController();
  final dlOneTextController = TextEditingController();
  final dlTwoTextController = TextEditingController();
  final dlThreeTextController = TextEditingController();
  final panGlobalKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    panNumberTextController.text = cubit.state.panNumber;
    gstNumberTextController.text = cubit.state.gstNumber;
    referralCodeTextController.text = cubit.state.referralCode;
    dlOneTextController.text = cubit.state.drugLicenseNum1;
    dlTwoTextController.text = cubit.state.drugLicenseNum2;
    dlThreeTextController.text = cubit.state.drugLicenseNum3;
  }

  void formatGSTNumber() {
    String value = gstNumberTextController.text;
    value = value.replaceAll('-', '');
    if (value.length == 15) {
      value =
          '${value.substring(0, 2)}-${value.substring(2, 12)}-${value.substring(12, 15)}';
      gstNumberTextController.text = value;
      cubit.setGstNumber(value);
      cubit.validateGSTNumber();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<RetailerRegistrationStepThreeCubit,
          RetailerRegistrationStepThreeState>(
        bloc: cubit,
        listener: (context, state) async => _onBlocListener(context, state),
        builder: (context, state) => _onBlocBuilder(context, state),
      ),
    );
  }

  Widget _onBlocBuilder(
    BuildContext context,
    RetailerRegistrationStepThreeState state,
  ) {
    return Container(
      color: AppColors.onboardingPageBackgroundColor,
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height * 0.95),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const RegistrationStepper(currentStep: 3),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OnboardingValidatorInputTextNew(
                            controller: dlOneTextController,
                            widgetKey:
                                const Key(OnboardingConstants.drugLicenseNum1),
                            labelText:
                                context.localizedString.drugLicenseNumber,
                            onChangeCallBack: (text) {
                              cubit.setDrugLicenseNum1(text);
                              cubit.checkDrugLicenseValue(
                                  text,
                                  context
                                      .localizedString.drugLicenseNumberError);
                              cubit.softValidateFields();
                              reqMap[OnboardingConstants.drugLicenseNum1] =
                                  text;
                              _formKey.currentState?.validate();
                            },
                            infoText:
                                context.localizedString.drugLicenseInfoText,
                            validator: (value) {
                              return cubit.dlNumberErrorText;
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9A-Za-z -]')),
                            ],
                          ),
                          const SizedBox(height: 8),
                          CustomImageFormField(
                            widgetKey:
                                const Key(OnboardingConstants.drugLicenseFile1),
                            validator: (file) {
                              return cubit.uploadDrupLicenseErrorText;
                            },
                            selectedFile: state.hasDrugLicenseFile1
                                ? state.drugLicenseFile1
                                : null,
                            onChanged: (file) {
                              cubit.setDrugLicenseFile1(file);
                              cubit.checkUploadDrugLicense(file?.path,
                                  context.localizedString.drugLicenseFileError);
                              cubit.softValidateFields();
                              _formKey.currentState?.validate();
                            },
                            labelText:
                                context.localizedString.uploadDrugLicense,
                          ),
                          const SizedBox(height: 8),
                          OnboardingValidatorInputTextNew(
                            widgetKey:
                                const Key(OnboardingConstants.gstinNumber),
                            labelText: context.localizedString.gstinNumber,
                            controller: gstNumberTextController,
                            apiValidationMessage: state.gstNumberValidation ==
                                    null
                                ? 'Invalid GSTIN'
                                : state.gstNumberValidation!
                                    ? ''
                                    : context.localizedString.gstAlreadyInUse,
                            maxLength: 17,
                            onChangeCallBack: (value) {
                              cubit.setGstNumber('');
                              reqMap[OnboardingConstants.gstinNumber] = value;
                              cubit.setGstNumber(value);
                              formatGSTNumber();
                            },
                            infoText:
                                context.localizedString.gstinNumberInfoText,
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                return OnboardingValidators().validateGstNumber(
                                    value.replaceAll('-', ''), context);
                              }
                              return null;
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9A-Za-z -]')),
                            ],
                          ),
                          const SizedBox(height: 8),
                          OnboardingValidatorInputTextNew(
                            widgetKey: const Key(OnboardingConstants.panNumber),
                            controller: panNumberTextController,
                            labelText: context.localizedString.panNumber,
                            onChangeCallBack: (value) {
                              panNumberTextController.text =
                                  value.toUpperCase();
                              value = value.toUpperCase();
                              reqMap[OnboardingConstants.panNumber] = value;
                              cubit.checkPanNumberValue(
                                  value, context.localizedString.panError);
                              cubit.setPanNumber(value);
                              cubit.softValidateFields();
                              _formKey.currentState?.validate();
                            },
                            textCapitalization: true,
                            validator: (_) {
                              return cubit.panNumberErrorText;
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9A-Za-z]')),
                            ],
                          ),
                          const SizedBox(height: 8),
                          OnboardingValidatorInputTextNew(
                            widgetKey:
                                const Key(OnboardingConstants.referralCode),
                            controller: referralCodeTextController,
                            labelText: context.localizedString.referralCode,
                            maxLength: 50,
                            onChangeCallBack: (value) {
                              reqMap[OnboardingConstants.referralCode] = value;
                              cubit.setReferralCode(value);
                            },
                            validator: (value) {
                              return null;
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50),
                              FilteringTextInputFormatter.allow(RegExp(
                                  r'[0-9A-Za-z!@#$%^&*()-_=+{}|;:",.<>/?]')),
                            ],
                          ),
                          CheckboxFormField(
                            widgetKey: const Key(
                                OnboardingConstants.privacyPolicyCheckbox),
                            title: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        context.localizedString.privacyMessage1,
                                    style: AppTextStyles.style11RegularBlack(
                                        color: AppColors.mediumGreyText),
                                  ),
                                  //launchGenericUrl(context, RetailerAppConstants.privacyPolicy);
                                  TextSpan(
                                    text:
                                        context.localizedString.privacyMessage2,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        onboardingDI<ReferralTAndCCubit>()
                                            .doReferralTandC();
                                        Navigator.pushNamed(
                                            context, '/termsAndConditions');
                                        // launchGenericUrl(
                                        //     context,
                                        //     OnboardingConstants
                                        //         .termsAndConditions);
                                      },
                                    style: AppTextStyles.style11RegularBlack(
                                            color: AppColors.blueButtonColor)
                                        .copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        context.localizedString.privacyMessage3,
                                    style: AppTextStyles.style11RegularBlack(
                                        color: AppColors.mediumGreyText),
                                  ),
                                  TextSpan(
                                    text:
                                        context.localizedString.privacyMessage4,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        onboardingDI<
                                                UpdateRetailerProfileCubit>()
                                            .doUpdateRetailerProfile();
                                        Navigator.pushNamed(
                                            context, '/privacyPolicy');
                                        // launchGenericUrl(context,
                                        //     OnboardingConstants.privacyPolicy);
                                      },
                                    style: AppTextStyles.style11RegularBlack(
                                            color: AppColors.blueButtonColor)
                                        .copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        context.localizedString.privacyMessage5,
                                    style: AppTextStyles.style11RegularBlack(
                                        color: AppColors.mediumGreyText),
                                  ),
                                ],
                              ),
                            ),
                            validator: (checked) {
                              return cubit.checkBox1ErrorText;
                            },
                            onChanged: (value) {
                              reqMap[OnboardingConstants
                                      .privacyPolicyCheckbox] =
                                  (value ?? false) ? '1' : '0';
                              cubit.setPrivacyPolicyCheckbox(
                                  (value ?? false) ? '1' : '0');
                              cubit.checkTermsAndCheckBoxValue(value,
                                  context.localizedString.agreementError);
                              cubit.softValidateFields();
                              _formKey.currentState?.validate();
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CheckboxFormField(
                            widgetKey: const Key(
                                OnboardingConstants.whatsappConsentCheckbox),
                            title: Text(
                              context.localizedString.whatsappConsentMessage,
                              maxLines: 3,
                              style: AppTextStyles.style11RegularBlack(
                                  color: AppColors.mediumGreyText),
                            ),
                            validator: (checked) {
                              return null;
                            },
                            onChanged: (value) {
                              reqMap[OnboardingConstants
                                  .whatsappConsentCheckbox] = '1';
                              // (value ?? false) ? '1' : '0';
                              cubit.setWhatsappConsentCheckbox('1');
                              // (value ?? false) ? '1' : '0');
                              cubit.softValidateFields();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      OnboardingCommonButton(
                          key: const Key(
                              OnboardingConstants.stepThreeNextButton),
                          buttonText:
                              context.localizedString.register.toUpperCase(),
                          buttonBackgroundColor: state.isSoftEnable
                              ? AppColors.blueButtonColor
                              : AppColors.blueButtonDisabledColor,
                          onPressedCallback: state.isSoftEnable
                              ? () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    cubit.saveUserInputFieldsData(reqMap);
                                    cubit.registerUser();
                                  }
                                }
                              : null),
                      const SizedBox(height: 4),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              context.localizedString.back.toUpperCase(),
                              style: AppTextStyles.blueLinkTextStyle,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onBlocListener(
    BuildContext context,
    RetailerRegistrationStepThreeState state,
  ) async {
    if (state.isLoading) {
      showProcessingRequestDialog(context);
    } else {
      CommonDialogs.closeCommonDialog(context: context);
    }

    if (state.registrationStatus) {
      /// Navigate to OTP Screen
      onboardingDI.registerSingleton<CommonSuccessDialogInfoModel>(
          CommonSuccessDialogInfoModel(
              title: context.localizedString.registrationSuccessful,
              subtitle: context.localizedString.registrationUnderProcessMsg),
          instanceName: OnboardingConstants.showDialogDiConstant);
      unregisterAllRegistrationDI();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RoutePaths.onBoardingOtp, (route) => false);
    }

    if (state.moveToHomePage) {
      if (onboardingDI.isRegistered<LoginEntity>()) {
        onboardingDI.unregister<LoginEntity>();
      }
      onboardingDI.registerSingleton<LoginEntity>(LoginEntity().copyWith(
          userId: 123,
          username: 'TestUser',
          mobileNumber: '3423123423',
          email: 'testUser@test.com'));

      if (onboardingDI.isRegistered<CommonSuccessDialogInfoModel>(
          instanceName: OnboardingConstants.showDialogDiConstant)) {
        onboardingDI.unregister<CommonSuccessDialogInfoModel>(
            instanceName: OnboardingConstants.showDialogDiConstant);
      }
      onboardingDI.registerSingleton<CommonSuccessDialogInfoModel>(
          CommonSuccessDialogInfoModel(
              title: context.localizedString.registrationSuccessful,
              subtitle: context.localizedString.registrationUnderProcessMsg),
          instanceName: OnboardingConstants.showDialogDiConstant);

      Navigator.of(context).pushNamedAndRemoveUntil(
        '/operationsPage',
        (route) => false,
      );
    }
  }

  String getErrorMessage(DrugLicenseError drugLicenseError) {
    if (drugLicenseError == DrugLicenseError.drugLicenseError1) {
      return context.localizedString.drugLicenseError1;
    } else if (drugLicenseError == DrugLicenseError.drugLicenseError2) {
      return context.localizedString.drugLicenseError2;
    }
    return '';
  }
}
