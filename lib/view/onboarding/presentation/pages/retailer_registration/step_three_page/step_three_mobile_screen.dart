import 'dart:collection';


import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/common_entity/login_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
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
                              cubit.softValidateFields();
                              reqMap[OnboardingConstants.drugLicenseNum1] =
                                  text;
                            },
                            infoText:
                                context.localizedString.drugLicenseInfoText,
                            validator: (value) {
                              return OnboardingValidators()
                                  .validateNotNullOrEmpty(
                                      value,
                                      context.localizedString
                                          .drugLicenseNumberError);
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
                              return OnboardingValidators()
                                  .validateImageFormField(
                                      file,
                                      context.localizedString
                                          .drugLicenseFileError);
                            },
                            selectedFile: state.hasDrugLicenseFile1
                                ? state.drugLicenseFile1
                                : null,
                            onChanged: (file) {
                              cubit.setDrugLicenseFile1(file);
                              cubit.softValidateFields();
                            },
                            labelText:
                                context.localizedString.uploadDrugLicense,
                          ),
                          const Visibility(
                              visible: false, child: SizedBox(height: 8)),
                          if (state.drugLicenseCount >= 2)
                            Visibility(
                              visible: false,
                              child: Column(
                                children: [
                                  OnboardingValidatorInputTextNew(
                                    controller: dlTwoTextController,
                                    widgetKey: const Key(
                                        OnboardingConstants.drugLicenseNum2),
                                    labelText: context
                                        .localizedString.drugLicenseNumber2,
                                    onChangeCallBack: (text) {
                                      cubit.setDrugLicenseNum2(text);
                                      reqMap[OnboardingConstants
                                          .drugLicenseNum2] = text;
                                    },
                                    validator: (value) {
                                      if (state.hasDrugLicenseFile2) {
                                        return OnboardingValidators()
                                            .validateNotNullOrEmpty(
                                                value,
                                                context.localizedString
                                                    .drugLicenseNumberError);
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  CustomImageFormField(
                                    widgetKey: const Key(
                                        OnboardingConstants.drugLicenseFile2),
                                    validator: (file) {
                                      if (state.drugLicenseNum2.isNotEmpty) {
                                        return OnboardingValidators()
                                            .validateImageFormField(
                                                file,
                                                context.localizedString
                                                    .drugLicenseFileError);
                                      }
                                      return null;
                                    },
                                    selectedFile: state.hasDrugLicenseFile2
                                        ? state.drugLicenseFile2
                                        : null,
                                    onChanged: (file) {
                                      cubit.setDrugLicenseFile2(file);
                                    },
                                    labelText: context
                                        .localizedString.uploadDrugLicense2,
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                          if (state.drugLicenseCount >= 3)
                            Visibility(
                              visible: false,
                              child: Column(
                                children: [
                                  OnboardingValidatorInputTextNew(
                                    controller: dlThreeTextController,
                                    widgetKey: const Key(
                                        OnboardingConstants.drugLicenseNum3),
                                    labelText: context
                                        .localizedString.drugLicenseNumber3,
                                    onChangeCallBack: (text) {
                                      cubit.setDrugLicenseNum3(text);
                                      reqMap[OnboardingConstants
                                          .drugLicenseNum3] = text;
                                    },
                                    validator: (value) {
                                      if (state.hasDrugLicenseFile3) {
                                        return OnboardingValidators()
                                            .validateNotNullOrEmpty(
                                                value,
                                                context.localizedString
                                                    .drugLicenseNumberError);
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  CustomImageFormField(
                                    widgetKey: const Key(
                                        OnboardingConstants.drugLicenseFile3),
                                    validator: (file) {
                                      if (state.drugLicenseNum3.isNotEmpty) {
                                        return OnboardingValidators()
                                            .validateImageFormField(
                                                file,
                                                context.localizedString
                                                    .drugLicenseFileError);
                                      }
                                      return null;
                                    },
                                    onChanged: (file) {
                                      cubit.setDrugLicenseFile3(file);
                                    },
                                    selectedFile: state.hasDrugLicenseFile3
                                        ? state.drugLicenseFile3
                                        : null,
                                    labelText: context
                                        .localizedString.uploadDrugLicense3,
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                          if (state.drugLicenseCount != 3)
                            Visibility(
                              visible: false,
                              child: InkWell(
                                onTap: () {
                                  cubit.addDrugLicense();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.add,
                                      size: 14,
                                      color: AppColors.blueButtonColor,
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      context.localizedString.addMoreDrugLicense
                                          .toUpperCase(),
                                      style: AppTextStyles.style11RegularBlack(
                                          color: AppColors.blueButtonColor,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          if (state.drugLicenseError != DrugLicenseError.empty)
                            Center(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    getErrorMessage(state.drugLicenseError),
                                    style: context.textStyles.header11Medium
                                        ?.copyWith(
                                            color: AppColors.redErrorColor,
                                            overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
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
                              reqMap[OnboardingConstants.panNumber] = value;
                              cubit.setPanNumber(value);
                              cubit.softValidateFields();
                            },
                            textCapitalization: true,
                            validator: (value) {
                              return OnboardingValidators()
                                  .validatePanNumber(value, context);
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
                              return OnboardingValidators()
                                  .validateCheckboxChecked(checked,
                                      context.localizedString.agreementError);
                            },
                            onChanged: (value) {
                              reqMap[OnboardingConstants
                                      .privacyPolicyCheckbox] =
                                  (value ?? false) ? '1' : '0';
                              cubit.setPrivacyPolicyCheckbox(
                                  (value ?? false) ? '1' : '0');
                              cubit.softValidateFields();
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
      // onboardingDI.registerSingleton<CommonSuccessDialogInfoModel>(
      //     CommonSuccessDialogInfoModel(
      //         title: context.localizedString.registrationSuccessful,
      //         subtitle: context.localizedString.registrationUnderProcessMsg),
      //     instanceName: OnboardingConstants.showDialogDiConstant);
      // unregisterAllRegistrationDI();
      // Navigator.of(context).pushNamedAndRemoveUntil(
      //     onboardingDI<OnboardingOuterRoutePaths>().getOtpPath(),
      //     (route) => false);
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
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/operationsPage',
        (route) => false,
      );
      // onboardingDI<OnboardingOuterRoutePaths>().getDashBoardPath(),
      // (route) => false);
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
