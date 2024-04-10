import 'dart:collection';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/retailer_registration/step_two/retailer_registration_step_two_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/retailer_registration/step_two/retailer_registration_step_two_state.dart';
import 'package:pharmarack/view/onboarding/presentation/navigation/onboarding_outer_route_paths.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_common_button.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_validator_input_text.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/registration_stepper.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';
import 'package:pharmarack/view/onboarding/utils/onboarding_validators.dart';


class StepTwoMobileScreen extends StatefulWidget {
  const StepTwoMobileScreen({super.key});

  @override
  State<StepTwoMobileScreen> createState() => _StepTwoMobileScreenState();
}

class _StepTwoMobileScreenState extends State<StepTwoMobileScreen> {
  final cubit = onboardingDI<RetailerRegistrationStepTwoCubit>();
  final formKey = GlobalKey<FormState>();
  final Map<String, String> reqMap = HashMap();
  final mobileNumberTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final prNameOneTextController = TextEditingController();
  final prNameTwoTextController = TextEditingController();
  final prNameThreeTextController = TextEditingController();
  final prNumOneTextController = TextEditingController();
  final prNumTwoTextController = TextEditingController();
  final prNumThreeTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setOldValues();
  }

  void setOldValues() {
    mobileNumberTextController.text = cubit.state.mobileNumber;
    emailTextController.text = cubit.state.email;
    prNameOneTextController.text = cubit.state.pharmacistName1;
    prNameTwoTextController.text = cubit.state.pharmacistName2;
    prNameThreeTextController.text = cubit.state.pharmacistName3;
    prNumOneTextController.text = cubit.state.pharmacistNum1;
    prNumTwoTextController.text = cubit.state.pharmacistNum2;
    prNumThreeTextController.text = cubit.state.pharmacistNum3;
    passwordTextController.text = cubit.state.password;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<RetailerRegistrationStepTwoCubit,
          RetailerRegistrationStepTwoState>(
        bloc: cubit,
        builder: (context, state) => _onBlocBuilder(context, state),
        listener: (context, state) => _onBlocListener(context, state),
      ),
    );
  }

  Widget _onBlocBuilder(
      BuildContext context, RetailerRegistrationStepTwoState state) {
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
                  const RegistrationStepper(currentStep: 2),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OnboardingValidatorInputTextNew(
                            widgetKey: const Key(
                                OnboardingConstants.registrationMobileNumber),
                            labelText: context.localizedString.mobileNo,
                            maxLength: 10,
                            controller: mobileNumberTextController,
                            textInputType: TextInputType.number,
                            apiValidationMessage: state.mobileNumberValidation,
                            onChangeCallBack: (text) {
                              cubit.setMobileNumber(text);
                              if (text.trim().length == 10 || text.isEmpty) {
                                reqMap[OnboardingConstants
                                    .registrationMobileNumber] = text;
                                cubit.validateMainMobileNumber();
                              }
                              formKey.currentState!.validate();
                            },
                            validator: (value) {
                              return OnboardingValidators()
                                  .validateMobileNumber(
                                value,
                                context,
                              );
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r'[\s-,.]')),
                            ],
                          ),
                          const SizedBox(height: 8),
                          OnboardingValidatorInputTextNew(
                            widgetKey: const Key(
                                OnboardingConstants.registrationEmail),
                            labelText: context.localizedString.email,
                            controller: emailTextController,
                            onChangeCallBack: (value) {
                              reqMap[OnboardingConstants.registrationEmail] =
                                  value;
                              cubit.setUpEmailId(value);
                              formKey.currentState!.validate();
                            },
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                return OnboardingValidators()
                                    .validateEmail(value, context);
                              }
                              return null;
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(50),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9a-zA-Z.@]')),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Column(
                            children: [
                              /// First Pharmacists
                              if (state.pharmacistCount >= 1)
                                Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    OnboardingValidatorInputTextNew(
                                      widgetKey: const Key(
                                          OnboardingConstants.pharmacistName),
                                      labelText: context
                                          .localizedString.pharmacistName,
                                      controller: prNameOneTextController,
                                      onChangeCallBack: (value) {
                                        reqMap[OnboardingConstants
                                            .pharmacistName] = value;
                                        cubit.setPharmacistName1(value);
                                        formKey.currentState!.validate();
                                      },
                                      validator: (value) {
                                        return null;
                                      },
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(50),
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[a-zA-Z ]')),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    OnboardingValidatorInputTextNew(
                                      widgetKey: const Key(
                                          OnboardingConstants.pharmacistNumber),
                                      labelText: context
                                          .localizedString.pharmacistNumber,
                                      controller: prNumOneTextController,
                                      onChangeCallBack: (value) {
                                        reqMap[OnboardingConstants
                                            .pharmacistNumber] = value;
                                        cubit.setPharmacistNum1(value);
                                        if (value.length == 10 ||
                                            value.isEmpty) {
                                          cubit.validatePharmacistNumberOne();
                                        }
                                        formKey.currentState!.validate();
                                      },
                                      apiValidationMessage:
                                          state.pharmacistNum1Validation,
                                      textInputType: TextInputType.number,
                                      validator: (value) {
                                        /// optional field only check
                                        /// if populated
                                        if (value != null && value.isNotEmpty) {
                                          return OnboardingValidators()
                                              .validateMobileNumber(
                                            value,
                                            context,
                                          );
                                        }
                                        return null;
                                      },
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(10),
                                        FilteringTextInputFormatter.deny(
                                            RegExp(r'[\s-,.]')),
                                      ],
                                    ),
                                  ],
                                ),

                              /// Second Pharmacists
                              if (state.pharmacistCount >= 2)
                                Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    OnboardingValidatorInputTextNew(
                                      widgetKey: const Key(
                                          OnboardingConstants.pharmacistName2),
                                      labelText: context
                                          .localizedString.pharmacistName2,
                                      controller: prNameTwoTextController,
                                      onChangeCallBack: (value) {
                                        reqMap[OnboardingConstants
                                            .pharmacistName2] = value;

                                        cubit.setPharmacistName2(value);
                                      },
                                      validator: (value) {
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 8),
                                    OnboardingValidatorInputTextNew(
                                      widgetKey: const Key(OnboardingConstants
                                          .pharmacistNumber2),
                                      labelText: context
                                          .localizedString.pharmacistNumber2,
                                      controller: prNumTwoTextController,
                                      onChangeCallBack: (value) {
                                        reqMap[OnboardingConstants
                                            .pharmacistNumber2] = value;
                                        cubit.setPharmacistNum2(value);
                                        if (value.length == 10) {
                                          // cubit.validatePharmacistNumberTwo();
                                        }
                                      },
                                      maxLength: 10,
                                      apiValidationMessage:
                                          !state.pharmacistNum2Validation
                                              ? context.localizedString
                                                  .mobileAlreadyInUse
                                              : '',
                                      textInputType: TextInputType.number,
                                      validator: (value) {
                                        /// optional field only check
                                        /// if populated
                                        if (value != null && value.isNotEmpty) {
                                          return OnboardingValidators()
                                              .validateMobileNumber(
                                            value,
                                            context,
                                          );
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),

                              /// Third Pharmacists
                              if (state.pharmacistCount >= 3)
                                Column(
                                  children: [
                                    const SizedBox(height: 8),
                                    OnboardingValidatorInputTextNew(
                                      widgetKey: const Key(
                                          OnboardingConstants.pharmacistName3),
                                      labelText: context
                                          .localizedString.pharmacistName3,
                                      controller: prNameThreeTextController,
                                      onChangeCallBack: (value) {
                                        reqMap[OnboardingConstants
                                            .pharmacistName3] = value;
                                        cubit.setPharmacistName3(value);
                                      },
                                      validator: (value) {
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 8),
                                    OnboardingValidatorInputTextNew(
                                      widgetKey: const Key(OnboardingConstants
                                          .pharmacistNumber3),
                                      labelText: context
                                          .localizedString.pharmacistNumber3,
                                      controller: prNumThreeTextController,
                                      onChangeCallBack: (value) {
                                        reqMap[OnboardingConstants
                                            .pharmacistNumber3] = value;
                                        cubit.softValidateFields(reqMap);
                                        cubit.setPharmacistNum3(value);
                                        if (value.length == 10) {
                                          // cubit.validatePharmacistNumberThree();
                                        }
                                      },
                                      maxLength: 10,
                                      apiValidationMessage:
                                          !state.pharmacistNum3Validation
                                              ? context.localizedString
                                                  .mobileAlreadyInUse
                                              : '',
                                      textInputType: TextInputType.number,
                                      validator: (value) {
                                        /// optional field only check
                                        /// if populated
                                        if (value != null && value.isNotEmpty) {
                                          return OnboardingValidators()
                                              .validateMobileNumber(
                                            value,
                                            context,
                                          );
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          OnboardingValidatorInputTextNew(
                            widgetKey: const Key(OnboardingConstants.password),
                            labelText: context.localizedString
                                .onboardingLoginPasswordHintText,
                            controller: passwordTextController,
                            onChangeCallBack: (value) {
                              if (state.isAnNumberAnUpperLowerCase &&
                                  state.isAtLeastSixLetter &&
                                  state.isNoSpaceStartEnd &&
                                  state.isSpecialChar) {
                                reqMap[OnboardingConstants.password] = value;
                                cubit.setPasswordFulfilledFlag(true);
                                cubit.softValidateFields(reqMap);
                                cubit.setPassword(value);
                              }
                              cubit.passwordChecks(value);
                            },
                            validator: (_) {
                              return null;
                            },
                            isPasswordField: true,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(32),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[A-Za-z0-9@._-]')),
                              FilteringTextInputFormatter.deny(' '),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text('Your Password must contain',
                              style: AppTextStyles.style11W500MedGrey(
                                  color: AppColors.blackTextFieldText)),
                          const SizedBox(
                            height: 10,
                          ),
                          passwordCheckItem(
                              state.isAtLeastSixLetter, 'At least 6 letters'),
                          passwordCheckItem(state.isAnNumberAnUpperLowerCase,
                              'At least a number, an uppercase & a lowercase letter'),
                          passwordCheckItem(state.isSpecialChar,
                              'At least one special character (For ex: @, - , _ , . )'),
                          passwordCheckItem(
                              state.isNoSpaceStartEnd, 'No space allow'),
                          if (state.pharmacistCount != 3)
                            Visibility(
                              visible: false,
                              child: InkWell(
                                key: const Key(
                                    OnboardingConstants.addPharmacistButton),
                                onTap: () {
                                  cubit.addPharmacist();
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
                                      context.localizedString.addMorePharmacists
                                          .toUpperCase(),
                                      style: AppTextStyles.style11RegularBlack(
                                          color: AppColors.blueButtonColor,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          if (state.addPharmacistError !=
                              AddPharmacistError.empty)
                            Center(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    getErrorMessage(state.addPharmacistError),
                                    style: context.textStyles.header11Medium
                                        ?.copyWith(
                                            color: AppColors.redErrorColor,
                                            overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: OnboardingCommonButton(
                        key: const Key(OnboardingConstants.stepTwoNextButton),
                        buttonText: context.localizedString.next.toUpperCase(),
                        buttonBackgroundColor: state.softValidate
                            ? AppColors.blueButtonColor
                            : AppColors.blueButtonDisabledColor,
                        onPressedCallback: state.softValidate
                            ? () {
                                if ((formKey.currentState?.validate() ??
                                    false)) {
                                  cubit.saveUserInputFieldsData();
                                  Navigator.pushNamed(
                                      context,
                                      onboardingDI<RoutePaths>()
                                          .getRetailerRegistrationStepThreePath());
                                }
                              }
                            : null),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: InkWell(
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
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget passwordCheckItem(bool state, String str) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          state
              ? Transform.scale(
                  scale: 0.8,
                  child: const Icon(
                    Icons.check_circle_sharp,
                    color: AppColors.greenErrorTextColor,
                  ),
                )
              : Transform.scale(
                  scale: 0.8,
                  child: const Icon(
                    Icons.cancel,
                    color: AppColors.hintTextColor,
                  ),
                ),
          const SizedBox(width: 2),
          Text(str,
              style: AppTextStyles.style11W500MedGrey(
                  color: state
                      ? AppColors.greenErrorTextColor
                      : AppColors.hintTextColor)),
        ],
      ),
    );
  }

  String getErrorMessage(AddPharmacistError addPharmacistError) {
    if (addPharmacistError == AddPharmacistError.addRetailerError1) {
      return context.localizedString.firstPharmacistError;
    } else if (addPharmacistError == AddPharmacistError.addRetailerError2) {
      return context.localizedString.secondPharmacistError;
    }
    return '';
  }

  Future<void> _onBlocListener(
    BuildContext context,
    RetailerRegistrationStepTwoState state,
  ) async {}
}
