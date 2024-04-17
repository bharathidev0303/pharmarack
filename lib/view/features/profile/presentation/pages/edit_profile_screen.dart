import 'dart:collection';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_buttons/common_dialog_button.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/image_picker_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dialog_card_two_button.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/core_flutter/utils/image_picker_util.dart';
import 'package:pharmarack/view/features/profile/presentation/constants/edit_profile_constants.dart';
import 'package:pharmarack/view/features/profile/presentation/constants/my_profile_constants.dart';
import 'package:pharmarack/view/features/profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:pharmarack/view/features/profile/presentation/cubit/edit_profile_state.dart';
import 'package:pharmarack/view/features/profile/presentation/pages/profile_page.dart';
import 'package:pharmarack/view/features/widgets/validator_disabled_input_text_new.dart';
import 'package:pharmarack/view/features/widgets/validator_enabled_input_text.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_drop_down.dart';
import 'package:pharmarack/view/onboarding/utils/onboarding_validators.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final editProfileCubit = getIt<EditProfileCubit>();
  final retailerInfoEntity = getIt<RetailerInfoEntity>();
  final Map<String, String> reqMap = HashMap();

  @override
  void initState() {
    _initiateEditProfielDetails();
    editProfileCubit.initialStateEmit();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(51),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                spreadRadius: 6,
                blurRadius: 6,
                offset: Offset(0, -3),
              ),
            ],
          ),
          child: AppBar(
            title: const Text('Edit Profile'),
            iconTheme: const IconThemeData(
              color: AppColors.blueButtonColor,
            ),
            titleSpacing: 0.0,
            bottomOpacity: 0.1,
            backgroundColor: AppColors.appBarColor,
            surfaceTintColor: Colors.transparent,
            elevation: 0.0,
            scrolledUnderElevation: 0.0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: InkWell(
                  child: Text(
                    context.localizedString.delete,
                    style: AppTextStyles.blueLinkTextStyle,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.white,
                          surfaceTintColor: Colors.white,
                          insetPadding: EdgeInsets.zero,
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                                width: ResponsiveWrapper.of(context).isMobile
                                    ? MediaQuery.of(context).size.width * 0.9
                                    : 360,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            context
                                                .localizedString.deleteAccount,
                                            style: AppTextStyles
                                                .dialogTitleStyle16W400
                                                .copyWith(
                                                    color: AppColors
                                                        .blackTextFieldText,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: AppAssets.png.close.image(
                                              width: 24,
                                              height: 24,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        context.localizedString
                                            .deleteAlertContentMessage,
                                        style: AppTextStyles.style12W500Black(
                                                color: AppColors.mediumGreyText)
                                            .copyWith(
                                                fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: CommonDialogButton(
                                                text: 'DELETE',
                                                textStyle: AppTextStyles
                                                    .style12W500Black(
                                                        color: AppColors
                                                            .blueButtonColor),
                                                buttonColor: AppColors
                                                    .secondaryButtonColor,
                                                onPressed: () async {
                                                  Navigator.of(context).pop();
                                                  Navigator.of(context)
                                                      .pushNamedAndRemoveUntil(
                                                    RoutePaths
                                                        .deleteAccountOtpScreen,
                                                    (route) => false,
                                                  );
                                                }),
                                          ),
                                          const SizedBox(
                                            width: 9,
                                          ),
                                          Expanded(
                                            child: CommonDialogButton(
                                                text: 'CANCEL',
                                                textStyle: AppTextStyles
                                                    .style12W500Black(
                                                        color: AppColors.white),
                                                buttonColor:
                                                    AppColors.blueButtonColor,
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                }),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt.get<EditProfileCubit>(),
        child: BlocConsumer<EditProfileCubit, EditProfileState>(
          builder: (context, state) => _buildEditProfile(context, state),
          listener: (context, state) => _onBlocListener(context, state),
        ),
      ),
    );
  }

  _buildEditProfile(BuildContext context, EditProfileState state) {
    return Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: DialogCardTwoButton(
              cancelActionText: context.localizedString.dialogCommonCancelText,
              saveActionText: context.localizedString.updateProfile,
              onClickSaveAction: () async {
                var validateReqFields =
                    await editProfileCubit.validateReqFields(context, reqMap);

                if (validateReqFields == 0) {
                  editProfileCubit.saveUserInputFieldsData(reqMap);
                }
                // if (_formKey.currentState?.validate() ?? false) {
                //   if (selectedFile != null && MyProfileConstants.drugLicenseNumber!=null) {
                //
                // cubit.saveUserInputFieldsData(reqMap);
                //     print('FILE SUCK Success'); // Both conditions are met, print success
                //   } else {
                //     print('FILE SUCK False'); // Either selectedFile is null or drugLicenseNumber1 is empty, print false
                //   }
                // }
              },
              onClickCancelAction: () => Navigator.of(context).pop(),
              body: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      //loginId
                      ValidatorDisabledInputTextNew(
                        labelText: context.localizedString.loginId,
                        defaultValue: reqMap[EditProfileConstants.loginIdField],
                        key: MyProfileConstants.keyLoginId,
                        onChangeCallBack: (value) {},
                        enable: false,
                        validator: (value) {
                          return OnboardingValidators()
                              .validateNotNullOrEmptyOrSpaces(
                                  value, context.localizedString.loginId);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      //businessType
                      OnboardingDropDownNew(
                        defaultValue:
                            reqMap[EditProfileConstants.businessTypeField],
                        enable: false,
                        labelText: context.localizedString.businessType,
                        onChangeCallBack: (value) {},
                        dropdownItems: [], // Add your dropdown items here
                        validator: (value) {
                          return null;
                        },
                        key: MyProfileConstants.keyBusinessType,
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //shop/Firm full name
                      ValidatorDisabledInputTextNew(
                        defaultValue:
                            reqMap[EditProfileConstants.retailerNameField],
                        key: const ValueKey(MyProfileConstants.keyShopFullName),
                        labelText: context.localizedString.nameOfShopFirm,
                        enable: false,
                        onChangeCallBack: (value) {},
                        validator: (value) {
                          return OnboardingValidators()
                              .validateNotNullOrEmptyOrSpaces(value,
                                  context.localizedString.shopFirmFullName);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //name EDITABLE
                      ValidatorEnabledInputTextNew(
                        //controller: nameTextController,
                        isEditable: true,
                        labelText: context.localizedString.name,
                        defaultValue:
                            reqMap[EditProfileConstants.retailerNameField],
                        key: MyProfileConstants.keyName,
                        onChangeCallBack: (text) {
                          reqMap[EditProfileConstants.retailerNameField] = text;
                          editProfileCubit.checkNameValue(
                              text, context.localizedString.ownerNameError);
                          _formKey.currentState?.validate();
                        },
                        enable: true,
                        validator: (value) {
                          return editProfileCubit.nameErrorText;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //shopAddress
                      ValidatorDisabledInputTextNew(
                        enable: false,
                        labelText: context.localizedString.shopAddress,
                        defaultValue:
                            reqMap[EditProfileConstants.shopFullAddressField],
                        key: MyProfileConstants.keyShopAddress,
                        onChangeCallBack: (value) {},
                        validator: (value) {
                          return OnboardingValidators()
                              .validateNotNullOrEmptyOrSpaces(value,
                                  context.localizedString.shopAddressError);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //pincode
                      ValidatorDisabledInputTextNew(
                        labelText: context.localizedString.pinCode,
                        defaultValue: reqMap[EditProfileConstants.pincodeField],
                        key: MyProfileConstants.keyPinCode,
                        enable: false,
                        onChangeCallBack: (value) {},
                        validator: (value) {
                          return OnboardingValidators()
                              .validateNotNullOrEmptyOrSpaces(
                                  value, context.localizedString.pincodeError);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //city
                      ValidatorDisabledInputTextNew(
                        labelText: context.localizedString.city,
                        defaultValue: reqMap[EditProfileConstants.cityField],
                        key: MyProfileConstants.keyCity,
                        onChangeCallBack: (value) {
                          reqMap[EditProfileConstants.cityField] = value;
                        },
                        enable: false,
                        validator: (value) {
                          return OnboardingValidators()
                              .validateNotNullOrEmptyOrSpaces(
                                  value, context.localizedString.cityError);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //state
                      OnboardingDropDownNew(
                        defaultValue:
                            reqMap[EditProfileConstants.stateNameField],
                        enable: false,
                        labelText: context.localizedString.state,
                        onChangeCallBack: (value) {},
                        dropdownItems: [], // Add your dropdown items here
                        validator: (value) {
                          return null;
                        },
                        key: MyProfileConstants.keyState,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      //emailId
                      ValidatorDisabledInputTextNew(
                        labelText: context.localizedString.emailId,
                        defaultValue:
                            reqMap[EditProfileConstants.mobileNumberField],
                        key: MyProfileConstants.keyMobileNumber,
                        onChangeCallBack: (value) {},
                        enable: false,
                        validator: (value) {
                          return OnboardingValidators()
                              .validateNotNullOrEmptyOrSpaces(value,
                                  context.localizedString.mobileNumLengthError);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //mobile number
                      ValidatorDisabledInputTextNew(
                        labelText: context.localizedString.mobileNo,
                        defaultValue: reqMap[EditProfileConstants.emailField],
                        key: MyProfileConstants.keyEmailId,
                        onChangeCallBack: (value) {},
                        enable: false,
                        validator: (value) {
                          return OnboardingValidators()
                              .validateNotNullOrEmptyOrSpaces(
                                  value, context.localizedString.emailError);
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //telephone EDITABLE
                      ValidatorEnabledInputTextNew(
                        //controller: telephoneTextController,
                        labelText: context.localizedString.telephoneNo,
                        isEditable: true,
                        defaultValue:
                            reqMap[EditProfileConstants.telephoneField],
                        key: MyProfileConstants.keyTelephoneNumber,
                        textInputType: TextInputType.phone,
                        maxLength: 10,
                        onChangeCallBack: (text) {
                          if (text.trim().length == 10 || text.isEmpty) {
                            reqMap[EditProfileConstants.telephoneField] = text;
                          }
                        },
                        enable: true,
                        validator: (value) {
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //dl one EDITABLE
                      ValidatorEnabledInputTextNew(
                        widgetKey: MyProfileConstants.keyDrugLicenseNumber,
                        defaultValue:
                            reqMap[EditProfileConstants.licenseNumberField],
                        validator: (value) {
                          return editProfileCubit.drugLicenseNumberErrorText;
                        },
                        onChangeCallBack: (value) {
                          reqMap[EditProfileConstants.licenseNumberField] =
                              value;
                          editProfileCubit.checkdrugLicenseNumberValue(value,
                              context.localizedString.drugLicenseNumberError);
                          _formKey.currentState?.validate();
                        },
                        labelText: context.localizedString.drugLicenseNumber,
                      ),

                      const SizedBox(
                        height: 8,
                      ),

                      //gst
                      OnboardingDropDownNew(
                        defaultValue:
                            reqMap[EditProfileConstants.gSTINOptionField],
                        enable: false,
                        labelText: context.localizedString.gst,
                        onChangeCallBack: (value) {},
                        dropdownItems: [], // Add your dropdown items here
                        validator: (value) {
                          return null;
                        },
                        key: MyProfileConstants.keyGstin,
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //pan number EDITABLE
                      ValidatorEnabledInputTextNew(
                        isEditable: true,
                        labelText: context.localizedString.panNumber,
                        defaultValue:
                            reqMap[EditProfileConstants.panNumberField],
                        key: MyProfileConstants.keyPanNumber,
                        onChangeCallBack: (value) {
                          editProfileCubit.checkPanNumberValue(
                              value, context.localizedString.panError);
                          _formKey.currentState?.validate();
                        },
                        enable: true,
                        validator: (value) {
                          return editProfileCubit.panNumberErrorText;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9A-Za-z]')),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //upiId EDITABLE
                      ValidatorEnabledInputTextNew(
                        //controller: upiIdTextController,
                        isEditable: true,
                        labelText: context.localizedString.upiId,
                        defaultValue: reqMap[EditProfileConstants.uPIIdField],
                        key: MyProfileConstants.keyUpiId,
                        onChangeCallBack: (value) {
                          reqMap[EditProfileConstants.uPIIdField] = value;
                          editProfileCubit.checkUPIValue(
                              value, context.localizedString.upiIdError);
                          _formKey.currentState?.validate();
                        },
                        enable: true,
                        validator: (value) {
                          return editProfileCubit.upiErrorText;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //bank name EDITABLE
                      ValidatorEnabledInputTextNew(
                        //controller: bankNameTextController,
                        isEditable: true,
                        labelText: context.localizedString.bankName,
                        defaultValue:
                            reqMap[EditProfileConstants.bankNameField],
                        key: MyProfileConstants.keyBankName,
                        onChangeCallBack: (value) {
                          reqMap[EditProfileConstants.bankNameField] = value;
                        },
                        enable: true,
                        validator: (value) {
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[A-Za-z]')),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //account type EDITABLE
                      ValidatorEnabledInputTextNew(
                        //controller: accountTypeTextController,
                        isEditable: true,
                        labelText: context.localizedString.accountType,
                        defaultValue:
                            reqMap[EditProfileConstants.accountTypeField],
                        key: MyProfileConstants.keyAccountType,
                        onChangeCallBack: (value) {
                          reqMap[EditProfileConstants.accountTypeField] = value;
                        },
                        enable: true,
                        validator: (value) {
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[A-Za-z]')),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //bank account number EDITABLE
                      ValidatorEnabledInputTextNew(
                        //controller: bankAccountNumberTextController,
                        isEditable: true,
                        labelText: context.localizedString.bankAccountNumber,
                        defaultValue:
                            reqMap[EditProfileConstants.bankAcNumberField],
                        key: MyProfileConstants.keyBankAccountNumber,
                        onChangeCallBack: (value) {
                          reqMap[EditProfileConstants.bankAcNumberField] =
                              value;
                        },
                        enable: true,
                        validator: (value) {
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //account holder name EDITABLE
                      ValidatorEnabledInputTextNew(
                        //controller: accountHolderNameTextEditingController,
                        isEditable: true,
                        labelText: context.localizedString.accountHolderName,
                        defaultValue:
                            reqMap[EditProfileConstants.bankAcNameField],
                        key: MyProfileConstants.keyAccountHolderName,
                        onChangeCallBack: (value) {
                          reqMap[EditProfileConstants.bankAcNameField] = value;
                        },
                        enable: true,
                        validator: (value) {
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[A-Za-z]')),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      //ifsc EDITABLE
                      ValidatorEnabledInputTextNew(
                        //controller: ifscTextEditingController,
                        isEditable: true,
                        labelText: context.localizedString.ifsc,
                        defaultValue: reqMap[EditProfileConstants.iFSCField],
                        key: MyProfileConstants.keyIfscCode,
                        onChangeCallBack: (value) {
                          reqMap[EditProfileConstants.iFSCField] = value;
                        },
                        enable: true,
                        validator: (value) {
                          return null;
                        },
                      ),

                      const SizedBox(height: 25),
                      //DL Image BOX
                      reqMap[EditProfileConstants.drugLicenseImageField] != null
                          ? SizedBox(
                              height: 300,
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        final selection =
                                            await showImagePickerDialog(context,
                                                closeClick: () {});
                                        await handleMediaSelection(selection);
                                      },
                                      child: Row(
                                        children: [
                                          const Row(
                                            children: [
                                              Icon(
                                                Icons.camera_alt_sharp,
                                                color:
                                                    AppColors.blueButtonColor,
                                              ),
                                              Text(
                                                  'Upload/Capture Drug License or Bill Copy'),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 45,
                                          ),
                                          state.drugLicenseFileUploaded == true
                                              ? InkWell(
                                                  onTap: () {
                                                    clearDrugLicenceFile();
                                                  },
                                                  child: const Icon(
                                                    Icons.close,
                                                    color: AppColors
                                                        .blueButtonColor,
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 16),
                                state.drugLicenseFileUploaded == true
                                    ? Container(
                                        height: 240,
                                        decoration: BoxDecoration(
                                            border: state.drugLicenseFileError ==
                                                        null ||
                                                    state.drugLicenseFileError ==
                                                        ""
                                                ? Border.all(
                                                    color: AppColors
                                                        .blackTextFieldText)
                                                : Border.all(
                                                    color: AppColors
                                                        .redErrorColor),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        alignment: Alignment.center,
                                        child: state.drugLicenseNewFile != null
                                            ? Image.file(File(
                                                state.drugLicenseNewFile!.path))
                                            : const Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Please Upload Drug License or Bill Copy',
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .redErrorColor,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                      )
                                    : Container(
                                        height: 240,
                                        decoration: BoxDecoration(
                                            border: state.drugLicenseFileError ==
                                                        null ||
                                                    state.drugLicenseFileError ==
                                                        ""
                                                ? Border.all(
                                                    color: AppColors
                                                        .blackTextFieldText)
                                                : Border.all(
                                                    color: AppColors
                                                        .redErrorColor),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        alignment: Alignment.center,
                                        child: reqMap[EditProfileConstants
                                                    .drugLicenseImageField] !=
                                                null
                                            ? CachedNetworkImage(
                                                imageUrl: reqMap[
                                                        EditProfileConstants
                                                            .drugLicenseImageField] ??
                                                    "",
                                                fit: BoxFit.fill,
                                                placeholder: (_, __) {
                                                  return const Center(
                                                    child: SpinKitFadingCircle(
                                                      color: AppColors
                                                          .blueButtonColor,
                                                      size: 50.0,
                                                    ),
                                                  );
                                                },
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    state.drugLicenseFileError ==
                                                            null
                                                        ? const Text(
                                                            'Image Not Found',
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .black, // Text color
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          )
                                                        : const Text(
                                                            'Please Upload Drug License or Bill Copy',
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .redErrorColor,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                  ],
                                                ),
                                              )
                                            : const Center(
                                                child: Text(
                                                  'Image Not Found',
                                                  style: TextStyle(
                                                    color: Colors
                                                        .black, // Text color
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                      ),
                                const SizedBox(height: 16),
                              ]),
                            )
                          : Container(),
                      const SizedBox(height: 25),
                    ],
                  ))),
        ));
  }

  _onBlocListener(BuildContext context, EditProfileState state) {
    if (state.userMessages.contains(UserMessage.updateProfileLoading)) {
      showProcessingRequestDialog(context, userRootNavigator: false);
    } else if (state.userMessages.contains(UserMessage.updateProfileSuccess)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
      showSuccessDialog(
        context,
        title: "Profile Updated!",
        subtitle: "Your profile has been updated successfully.",
      );
    } else if (state.userMessages.contains(UserMessage.updateProfileFailure)) {
      CommonDialogs.closeCommonDialog(context: context);
      showFailedRequestDialog(context, title: "Unable to update");
    }
  }

  clearDrugLicenceFile() {
    reqMap[EditProfileConstants.drugLicenseImageField] = "";
    editProfileCubit.checkDrugLicenseNewFile(null, "");
  }

  Future handleMediaSelection(
    selection,
  ) async {
    if (selection == null) return null;

    final file = selection == MediaSelection.gallery
        ? await ImagePickerUtil.pickImageFromGallery()
        : await ImagePickerUtil.pickImageFromCamera();

    if (file != null) {
      reqMap[EditProfileConstants.drugLicenseImageField] = file.path ?? "";
      editProfileCubit.checkDrugLicenseNewFile(
          file, context.localizedString.drugLicenseFileError);
      _formKey.currentState?.validate();
    }

    return null;
  }

  _initiateEditProfielDetails() {
    reqMap[EditProfileConstants.loginIdField] =
        (retailerInfoEntity.userId ?? "").toString();
    reqMap[EditProfileConstants.retailerNameField] =
        retailerInfoEntity.displayRetailers![0].retailerName ?? "";
    reqMap[EditProfileConstants.businessTypeField] =
        retailerInfoEntity.displayRetailers![0].businessTypeName ?? "";
    reqMap[EditProfileConstants.shopFullAddressField] = makeShopeFullAddress(
        retailerInfoEntity.userdetail!.address1,
        retailerInfoEntity.userdetail!.address2,
        retailerInfoEntity.userdetail!.city!);
    reqMap[EditProfileConstants.cityField] =
        retailerInfoEntity.userdetail!.city ?? "";
    reqMap[EditProfileConstants.pincodeField] =
        (retailerInfoEntity.userdetail!.pincode ?? "").toString();
    reqMap[EditProfileConstants.regionIdField] =
        (retailerInfoEntity.displayRetailers![0].regionId ?? "").toString();
    reqMap[EditProfileConstants.stateIdField] =
        (retailerInfoEntity.displayRetailers![0].stateId ?? "").toString();
    reqMap[EditProfileConstants.stateNameField] =
        retailerInfoEntity.displayRetailers![0].stateName ?? "";
    reqMap[EditProfileConstants.firstNameField] =
        retailerInfoEntity.firstname ?? "";
    reqMap[EditProfileConstants.lastNameField] =
        retailerInfoEntity.lastname ?? "";
    reqMap[EditProfileConstants.emailField] = retailerInfoEntity.email ?? "";
    reqMap[EditProfileConstants.mobileNumberField] =
        retailerInfoEntity.mobileNumber ?? "";
    reqMap[EditProfileConstants.gSTINNumberField] =
        (retailerInfoEntity.displayRetailers![0].gstinNumber ?? "").toString();
    reqMap[EditProfileConstants.gSTINOptionField] =
        retailerInfoEntity.displayRetailers![0].gstinOption ?? "";
    reqMap[EditProfileConstants.telephoneField] =
        retailerInfoEntity.telephone ?? "";
    reqMap[EditProfileConstants.retailerIdField] =
        (retailerInfoEntity.displayRetailers![0].retailerId ?? "").toString();
    reqMap[EditProfileConstants.retailerNameField] =
        retailerInfoEntity.displayRetailers![0].retailerName ?? "";
    reqMap[EditProfileConstants.address1Field] =
        retailerInfoEntity.userdetail!.address1 ?? "";
    reqMap[EditProfileConstants.address2Field] =
        retailerInfoEntity.userdetail!.address2 ?? "";
    reqMap[EditProfileConstants.licenseNumberField] =
        (retailerInfoEntity.displayRetailers![0].licenseNumber ?? "")
            .toString();
    reqMap[EditProfileConstants.panNumberField] =
        (retailerInfoEntity.displayRetailers![0].panNumber ?? "").toString();

    reqMap[EditProfileConstants.uPIIdField] =
        retailerInfoEntity.retailerPaymentConfig![0].upiId ?? "";
    reqMap[EditProfileConstants.bankNameField] =
        retailerInfoEntity.retailerPaymentConfig![0].bankName ?? "";
    reqMap[EditProfileConstants.bankAcNameField] =
        retailerInfoEntity.retailerPaymentConfig![0].bankAcName ?? "";
    reqMap[EditProfileConstants.bankAcNumberField] =
        retailerInfoEntity.retailerPaymentConfig![0].bankAcNumber ?? "";
    reqMap[EditProfileConstants.bankAccountTypeField] =
        retailerInfoEntity.retailerPaymentConfig![0].bankAccountType ?? "";
    reqMap[EditProfileConstants.accountTypeField] =
        retailerInfoEntity.retailerPaymentConfig![0].bankAccountType ?? "";
    reqMap[EditProfileConstants.iFSCField] =
        retailerInfoEntity.retailerPaymentConfig![0].ifsc ?? "";
    reqMap[EditProfileConstants.drugLicenseImageField] =
        retailerInfoEntity.displayImages![0].imageUrl ?? "";
    reqMap[EditProfileConstants.contactPersonField] =
        retailerInfoEntity.stores?.isNotEmpty ?? false
            ? retailerInfoEntity.stores![0].contactPerson.toString()
            : retailerInfoEntity.username.toString();
  }

  makeShopeFullAddress(address1, address2, city) {
    final shopAddress =
        "${address1 != null || address1 != "" ? address1 + "," : ""} ${address2 != null || address2 != "" ? address2 + "," : ""} ${city != null || city != "" ? city : ""}";
    return shopAddress;
  }
}
