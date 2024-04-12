import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/retailer_registration/step_one/retailer_registration_cubit.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/retailer_registration/step_one/retailer_registration_state.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/area_selection_dialog.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_common_button.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_drop_down.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_validator_input_text.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/registration_stepper.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

import '../../../widgets/city_selection_dialog.dart';
import '../../../widgets/region_selection_dialog.dart';

class StepOneMobileScreen extends StatefulWidget {
  const StepOneMobileScreen({super.key});

  @override
  State<StepOneMobileScreen> createState() => _StepOneMobileScreenState();
}

class _StepOneMobileScreenState extends State<StepOneMobileScreen> {
  final cubit = onboardingDI<RetailerRegistrationStepOneCubit>();
  final _formKey = GlobalKey<FormState>();

  final addressStateState = GlobalKey<FormFieldState>();

  final TextEditingController cityTextController = TextEditingController();

  final TextEditingController areaTextController = TextEditingController();

  final TextEditingController regionTextController = TextEditingController();

  final Map<String, String> reqMap = HashMap();

  @override
  void initState() {
    super.initState();
    cubit.getDropDownData();

    areaTextController.addListener(() {
      reqMap[OnboardingConstants.area] = areaTextController.text;
      cubit.softValidateFields(reqMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RetailerRegistrationStepOneCubit>(
      create: (context) => cubit,
      child: BlocConsumer<RetailerRegistrationStepOneCubit,
          RetailerRegistrationState>(
        bloc: cubit,
        listener: (context, state) async {
          await _onBlocListener(context, state);
        },
        builder: (context, state) => _onBlocBuilder(context, state),
      ),
    );
  }

  Widget _onBlocBuilder(
    BuildContext context,
    RetailerRegistrationState state,
  ) {
    return Container(
      color: AppColors.onboardingPageBackgroundColor,
      child: Stack(
        children: [
          SingleChildScrollView(
            key: const Key('singleChildScrollView'),
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                children: [
                  const RegistrationStepper(currentStep: 1),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OnboardingDropDownNew(
                            defaultValue:
                                '${context.localizedString.select} ${context.localizedString.typeOfBusiness}',
                            labelText: context.localizedString.typeOfBusiness,
                            onChangeCallBack: (value) {
                              reqMap[OnboardingConstants.typeOfBusiness] =
                                  value ?? '';
                              cubit.softValidateFields(reqMap);
                              cubit.checkDropDownValue(value,
                                  context.localizedString.businessTypeError);
                            },
                            dropdownItems: state.businessTypes
                                .map(
                                  (e) => DropdownMenuEntry(
                                      value: (e.businessTypeId ?? 0).toString(),
                                      label: e.businessTypeName ?? ''),
                                )
                                .toList(),
                            validator: (_) {
                              return cubit.dropDownErrorText;
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          OnboardingValidatorInputTextNew(
                            // hintText:
                            //     '${context.localizedString.select} ${context.localizedString.nameOfShopFirm}',
                            key: const ValueKey(
                                OnboardingConstants.nameOfShopFirm),
                            labelText: context.localizedString.nameOfShopFirm,
                            onChangeCallBack: (value) {
                              reqMap[OnboardingConstants.nameOfShopFirm] =
                                  value;
                              cubit.softValidateFields(reqMap);
                              cubit.checkShopOrFirmValue(
                                  value, context.localizedString.shopNameError);
                              _formKey.currentState?.validate();
                            },
                            validator: (_) {
                              return cubit.shopErrorText;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[A-Za-z0-9 ]')),
                            ],
                          ),
                          const SizedBox(height: 8),
                          OnboardingValidatorInputTextNew(
                            // hintText:
                            //     '${context.localizedString.select} ${context.localizedString.nameOfTheOwner}',
                            key:
                                const ValueKey(OnboardingConstants.nameOfOwner),
                            labelText: context.localizedString.nameOfTheOwner,
                            onChangeCallBack: (value) {
                              reqMap[OnboardingConstants.nameOfOwner] = value;
                              cubit.softValidateFields(reqMap);
                              cubit.checkOwnerValue(value,
                                  context.localizedString.ownerNameError);
                              _formKey.currentState?.validate();
                            },
                            validator: (_) {
                              return cubit.ownerErrorText;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[A-Za-z0-9 ]')),
                            ],
                          ),
                          const SizedBox(height: 8),
                          OnboardingValidatorInputTextNew(
                            // hintText:
                            //     '${context.localizedString.select} ${context.localizedString.shopAddress}',
                            key:
                                const ValueKey(OnboardingConstants.shopAddress),
                            labelText: context.localizedString.shopAddress,
                            onChangeCallBack: (value) {
                              reqMap[OnboardingConstants.shopAddress] = value;
                              cubit.softValidateFields(reqMap);
                              cubit.checkShopAddressValue(
                                  value,
                                  context.localizedString.addressError,
                                  1,
                                  context.localizedString.addressLengthError);
                              _formKey.currentState?.validate();
                            },
                            validator: (_) {
                              return cubit.shopAddressErrorText;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(
                                  r'[A-Za-z0-9!"#$%&()*+,-./:;<>=?@[\]^`{}|~ ]')),
                            ],
                          ),
                          const SizedBox(height: 8),
                          OnboardingValidatorInputTextNew(
                            // hintText:
                            //     '${context.localizedString.select} ${context.localizedString.pinCode}',
                            key: const ValueKey(OnboardingConstants.pincode),
                            labelText: context.localizedString.pinCode,
                            maxLength: 6,
                            textInputType: TextInputType.number,
                            onChangeCallBack: (text) {
                              if (text.trim().length == 6) {
                                reqMap[OnboardingConstants.region] = "";
                                cubit.getAddressByPincode(text, _formKey);
                                reqMap[OnboardingConstants.pincode] = text;
                              }

                              cubit.softValidateFields(reqMap);
                              cubit.checkPinCodeValue(
                                text,
                                context.localizedString.pincodeError,
                                6,
                                context.localizedString.pincodeError,
                              );
                              _formKey.currentState?.validate();
                            },
                            validator: (_) {
                              return cubit.pinCodeErrorText;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r'[\s,.-]')),
                            ],
                          ),
                          const SizedBox(height: 8),
                          InkWell(
                            onTap: () async {
                              AreaSelectionDialog.showAreaDialog(
                                  parentContext: context,
                                  areaSuggestions:
                                      state.pincodeData.registrationAreas ?? [],
                                  title: context.localizedString.selectArea,
                                  onValueSelected: (registrationData) {
                                    cubit.onAreaSelected(registrationData);
                                    cubit.softValidateFields(reqMap);
                                  });
                            },
                            child: Stack(children: [
                              OnboardingValidatorInputTextNew(
                                hintText:
                                    '${context.localizedString.select} ${context.localizedString.area}',
                                key: const ValueKey(OnboardingConstants.area),
                                controller: areaTextController
                                  ..text = state.area,
                                labelText: context.localizedString.area,
                                onChangeCallBack: (text) {
                                  reqMap[OnboardingConstants.area] = text;
                                  cubit.updateAreaValue(text);
                                  cubit.softValidateFields(reqMap);
                                  cubit.checkAreaValue(
                                      text, context.localizedString.areaError);
                                  _formKey.currentState?.validate();
                                },
                                validator: (value) {
                                  return cubit.areaErrorText;
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[A-Za-z0-9 ]')),
                                ],
                              ),
                              Positioned(
                                right: 0,
                                top: 24,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AppAssets.svg.icDown.svg(
                                    key: const Key(OnboardingConstants
                                        .areaSelectionDialog),
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                          const SizedBox(height: 8),
                          InkWell(
                              onTap: () async {
                                CitySelectionDialog.showCityDialog(
                                    parentContext: context,
                                    citySuggestions:
                                        state.pincodeData.registrationCities ??
                                            [],
                                    title: context.localizedString.selectCity,
                                    onValueSelected: (registrationData) {
                                      cubit.updateCityValue(
                                          registrationData.cityName ?? '');
                                      reqMap[OnboardingConstants.city] =
                                          registrationData.cityName ?? '';
                                      cubit.softValidateFields(reqMap);
                                    });
                              },
                              child: AbsorbPointer(
                                child: Stack(children: [
                                  OnboardingValidatorInputTextNew(
                                    key: const ValueKey(
                                        OnboardingConstants.city),
                                    controller: cityTextController
                                      ..text = state.city,
                                    labelText: context.localizedString.city,
                                    hintText:
                                        '${context.localizedString.select} ${context.localizedString.city}',
                                    validator: (_) {
                                      return cubit.cityErrorText;
                                    },
                                    onChangeCallBack: (value) {
                                      reqMap[OnboardingConstants.city] = value;
                                      cubit.updateCityValue(value);
                                      cubit.softValidateFields(reqMap);
                                      cubit.checkCityValue(value,
                                          context.localizedString.cityError);
                                      _formKey.currentState?.validate();
                                    },
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(RegExp(
                                          r'[A-Za-z0-9!"#$%&()*+,-./:;<>=?@[\]^`{}|~ ]')),
                                    ],
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 24,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: AppAssets.svg.icDown
                                          .svg(height: 16, width: 16),
                                    ),
                                  ),
                                ]),
                              )),
                          const SizedBox(height: 8),
                          Visibility(
                            visible:
                                (state.pincodeData.registrationRegion != null &&
                                        state.pincodeData.registrationRegion!
                                                .length >=
                                            2)
                                    ? true
                                    : false,
                            child: InkWell(
                              onTap: () async {
                                RegionSelectionDialog.showRegionDialog(
                                    parentContext: context,
                                    regionSuggestions:
                                        state.pincodeData.registrationRegion ??
                                            [],
                                    title: context.localizedString.selectRegion,
                                    onValueSelected: (registrationData) {
                                      cubit.updateRegionValue(
                                          registrationData.regionName ?? '');
                                      reqMap[OnboardingConstants.region] =
                                          registrationData.regionName ?? '';
                                      cubit.softValidateFields(reqMap);
                                    });
                              },
                              child: AbsorbPointer(
                                child: Stack(
                                  children: [
                                    OnboardingValidatorInputTextNew(
                                      key: const ValueKey(
                                          OnboardingConstants.region),
                                      controller: regionTextController
                                        ..text = state.region,
                                      labelText: context.localizedString.region,
                                      hintText:
                                          '${context.localizedString.select} ${context.localizedString.region}',
                                      validator: (value) {
                                        return cubit.regionErrorText;
                                      },
                                      onChangeCallBack: (value) {
                                        cubit.checkRegionValue(
                                          value,
                                          context.localizedString.regionError,
                                        );
                                        _formKey.currentState?.validate();
                                        cubit.softValidateFields(reqMap);
                                      },
                                      enable: state.pincodeData
                                              .registrationRegion?.isEmpty ??
                                          false,
                                    ),
                                    if ((state.pincodeData.registrationRegion
                                                ?.length ??
                                            0) >
                                        1)
                                      Positioned(
                                        right: 0,
                                        top: 24,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: AppAssets.svg.icDown.svg(
                                            height: 20,
                                            width: 20,
                                            package: "core_flutter",
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          BlocBuilder<RetailerRegistrationStepOneCubit,
                                  RetailerRegistrationState>(
                              builder: (context, state) {
                            return OnboardingDropDownNew(
                              defaultValue:
                                  '${context.localizedString.select} ${context.localizedString.state}',

                              labelText: context.localizedString.state,
                              onChangeCallBack: (text) {
                                reqMap[OnboardingConstants.state] = text ?? '';
                                reqMap[OnboardingConstants.stateId] =
                                    text ?? '';
                                cubit.softValidateFields(reqMap);
                                cubit.checkStateValue(
                                    text, context.localizedString.stateError);
                                _formKey.currentState?.validate();
                              },
                              enable: state.enableStateDropdown,
                              // defaultValue: state.stateName,
                              dropdownItems: state.addressStates
                                  .map((e) => DropdownMenuEntry(
                                      label: e.stateName ?? '',
                                      value: (e.stateId ?? 0).toString()))
                                  .toList(),
                              dropDownState: addressStateState,
                              validator: (_) {
                                return cubit.stateErrorText;
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                  OnboardingCommonButton(
                      key: const Key(OnboardingConstants.stepOneNextButton),
                      buttonText: context.localizedString.next.toUpperCase(),
                      buttonBackgroundColor: state.softValidate
                          ? AppColors.blueButtonColor
                          : AppColors.blueButtonDisabledColor,
                      onPressedCallback: state.softValidate
                          ? () {
                              if ((_formKey.currentState?.validate() ??
                                      false) &&
                                  (state.pincodeData.registrationAreas
                                          ?.isNotEmpty ??
                                      false)) {
                                if (reqMap[OnboardingConstants.regionId] ==
                                        null ||
                                    reqMap[OnboardingConstants.regionId] ==
                                        "") {
                                  SetRegionDefaultSate(state);
                                }

                                cubit.saveUserInputFieldsData(reqMap);

                                print("valuesdata ${reqMap}");
                                Navigator.pushNamed(context,
                                    RoutePaths.retailerRegistrationStepTwo);
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
          ),
        ],
      ),
    );
  }

  Future<void> _onBlocListener(
    BuildContext context,
    RetailerRegistrationState state,
  ) async {
    if (state.isLoading) {
      showProcessingRequestDialog(context);
    } else {
      CommonDialogs.closeCommonDialog(context: context);
    }

    if (state.pincodeData.registrationState?.first != null) {
      var stateId =
          state.pincodeData.registrationState?.first.stateId.toString() ?? '';
      var regId =
          state.pincodeData.registrationState?.first.regionId.toString() ?? '';

      reqMap[OnboardingConstants.regionId] = regId;
      reqMap[OnboardingConstants.stateId] = stateId;

      ///set values on UI
      addressStateState.currentState?.didChange(stateId);
      cubit.softValidateFields(reqMap);
    }
  }

  void SetRegionDefaultSate(RetailerRegistrationState state) async {
    if (state.pincodeData.registrationRegion?.first != null) {
      var regId =
          state.pincodeData.registrationRegion?.first.regionId.toString() ?? '';
      reqMap[OnboardingConstants.regionId] = regId;

      cubit.softValidateFields(reqMap);
    }
  }
}
