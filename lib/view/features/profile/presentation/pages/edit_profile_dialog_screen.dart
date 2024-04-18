import 'dart:collection';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_buttons/common_dialog_button.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/image_picker_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dialog_card_two_button.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/text_input_field.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/core_flutter/utils/image_picker_util.dart';
import 'package:pharmarack/view/features/profile/presentation/constants/my_profile_constants.dart';
import 'package:pharmarack/view/features/profile/presentation/cubit/edit_profile_cubit.dart';
// import 'package:pharmarack/view/features/profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:pharmarack/view/features/profile/presentation/cubit/edit_profile_state.dart';
import 'package:pharmarack/view/features/profile/presentation/pages/profile_page.dart';
import 'package:pharmarack/view/features/widgets/validator_disabled_input_text_new.dart';
import 'package:pharmarack/view/features/widgets/validator_enabled_input_text.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/widgets/onboarding_drop_down.dart';
import 'package:pharmarack/view/onboarding/utils/onboarding_validators.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class EditProfileDialogScreen extends StatefulWidget {
  final String loginId;
  final String businessTypeName;
  final String shopFirmFullName;
  final String shopAddress;
  final String pinCode;
  final String city;
  final String stateName;
  final String telephone;
  final String drugLicenseNumber;
  final String drugLicenseNumber2;
  final String drugLicenseNumber3;
  final String gstin;
  final String panNumber;
  final String upiId;
  final String bankName;
  final String accountType;
  final String bankAccountNumber;
  final String bankHolderName;
  final String ifscCode;
  final String userFullName;
  final String emailId;
  final String mobileNumber;
  final String imageUrl;
  final int displayImagesLength;

  const EditProfileDialogScreen({
    super.key,
    required this.userFullName,
    required this.emailId,
    required this.loginId,
    required this.businessTypeName,
    required this.shopFirmFullName,
    required this.shopAddress,
    required this.pinCode,
    required this.city,
    required this.stateName,
    required int stateId,
    required this.telephone,
    required this.drugLicenseNumber,
    required this.drugLicenseNumber2,
    required this.drugLicenseNumber3,
    required this.gstin,
    required this.panNumber,
    required this.upiId,
    required this.bankName,
    required this.accountType,
    required this.bankAccountNumber,
    required this.bankHolderName,
    required this.ifscCode,
    required this.mobileNumber,
    required this.imageUrl,
    required this.displayImagesLength,
  });

  @override
  State<EditProfileDialogScreen> createState() =>
      _EditProfileDialogScreenState();
}

class _EditProfileDialogScreenState extends State<EditProfileDialogScreen> {
  final cubit = onboardingDI<EditProfileCubit>();
  final nameTextController = TextEditingController();
  final telephoneTextController = TextEditingController();
  final dlOneTextController = TextEditingController();
  final dlTwoTextController = TextEditingController();
  final dlThreeTextController = TextEditingController();
  final panNumberTextController = TextEditingController();
  final upiIdTextController = TextEditingController();
  final bankNameTextController = TextEditingController();
  final accountTypeTextController = TextEditingController();
  final bankAccountNumberTextController = TextEditingController();
  final accountHolderNameTextEditingController = TextEditingController();
  final ifscTextEditingController = TextEditingController();
  final Map<String, String> reqMap = HashMap();
  final _formKey = GlobalKey<FormState>();

  // List<File> selectedFile=[];

  @override
  void initState() {
    super.initState();
    // panNumberTextController.text = cubit.state.panNumber;
    // dlOneTextController.text = cubit.state.drugLicenseNum1;
    // dlTwoTextController.text = cubit.state.drugLicenseNum2;
    // dlThreeTextController.text = cubit.state.drugLicenseNum3;
    // upiIdTextController.text = cubit.state.upiId;
    // bankNameTextController.text = cubit.state.bankName;
    // accountTypeTextController.text = cubit.state.accountType;
    // bankAccountNumberTextController.text = cubit.state.accountNumber;
    // accountHolderNameTextEditingController.text = cubit.state.accountHolderName;
    // ifscTextEditingController.text = cubit.state.ifsc;
    // nameTextController.text = cubit.state.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        context.localizedString.deleteAccount,
                                        style: AppTextStyles
                                            .dialogTitleStyle16W400
                                            .copyWith(
                                                color: AppColors
                                                    .blackTextFieldText,
                                                fontWeight: FontWeight.bold),
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
                                        .copyWith(fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CommonDialogButton(
                                            text: 'DELETE',
                                            textStyle:
                                                AppTextStyles.style12W500Black(
                                                    color: AppColors
                                                        .blueButtonColor),
                                            buttonColor:
                                                AppColors.secondaryButtonColor,
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
                                            textStyle:
                                                AppTextStyles.style12W500Black(
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
      body: BlocProvider(
        create: (context) => GetIt.instance.get<EditProfileCubit>(),
        child: BlocConsumer<EditProfileCubit, EditProfileState>(
          builder: (context, state) => _buildEditProfileDialog(
            context,
            state,
            widget.loginId,
            widget.businessTypeName,
            widget.shopFirmFullName,
            widget.shopAddress,
            widget.pinCode,
            widget.city,
            widget.stateName,
            widget.telephone,
            widget.drugLicenseNumber,
            widget.drugLicenseNumber2,
            widget.drugLicenseNumber3,
            widget.gstin,
            widget.panNumber,
            widget.upiId,
            widget.bankName,
            widget.accountType,
            widget.bankAccountNumber,
            widget.bankHolderName,
            widget.ifscCode,
            widget.userFullName,
            widget.emailId,
            widget.mobileNumber,
            widget.imageUrl,
            widget.displayImagesLength,
          ),
          listener: (context, state) => _onBlocListener(context, state),
        ),
      ),
    );
  }

  Widget _buildEditProfileDialog(
    BuildContext context,
    EditProfileState state,
    String loginId,
    String businessTypeName,
    String shopFirmFullName,
    String shopAddress,
    String pinCode,
    String city,
    String stateName,
    String telephone,
    String drugLicenseNumber,
    String drugLicenseNumber2,
    String drugLicenseNumber3,
    String gstin,
    String panNumber,
    String upiId,
    String bankName,
    String accountType,
    String bankAccountNumber,
    String bankHolderName,
    String ifscCode,
    String userFullName,
    String emailId,
    String mobileNumber,
    String imageUrl,
    int displayImagesLength,
  ) {
    final cubit = context.read<EditProfileCubit>();

    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: DialogCardTwoButton(
          cancelActionText: context.localizedString.dialogCommonCancelText,
          saveActionText: context.localizedString.updateProfile,
          onClickSaveAction: () {
            if (onboardingDI<RetailerInfoEntity>().displayImages!.length == 1) {
              if (drugLicenseNumber.isEmpty) {
                return;
              } else {}
            }
            // if (_formKey.currentState?.validate() ?? false) {
            //   if (selectedFile != null && MyProfileConstants.drugLicenseNumber!=null) {
            //
            cubit.saveUserInputFieldsData(reqMap);
            //     print('FILE SUCK Success'); // Both conditions are met, print success
            //   } else {
            //     print('FILE SUCK False'); // Either selectedFile is null or drugLicenseNumber1 is empty, print false
            //   }
            // }
          },
          onClickCancelAction: () => Navigator.of(context).pop(),
          showProgress: state.isLoading,
          body: Container(),
          // body: Form(
          //   key: _formKey,
          //   child: Column(
          //     children: [
          //       const SizedBox(height: 10),
          //       //loginId
          //       ValidatorDisabledInputTextNew(
          //         labelText: context.localizedString.loginId,
          //         defaultValue: loginId,
          //         key: MyProfileConstants.keyLoginId,
          //         onChangeCallBack: (value) {},
          //         enable: false,
          //         validator: (value) {
          //           return OnboardingValidators()
          //               .validateNotNullOrEmptyOrSpaces(
          //                   value, context.localizedString.loginId);
          //         },
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //businessType
          //       OnboardingDropDownNew(
          //         defaultValue: businessTypeName,
          //         enable: false,
          //         labelText: context.localizedString.businessType,
          //         onChangeCallBack: (value) {},
          //         dropdownItems: [], // Add your dropdown items here
          //         validator: (value) {
          //           return null;
          //         },
          //         key: MyProfileConstants.keyBusinessType,
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //shop/Firm full name
          //       ValidatorDisabledInputTextNew(
          //         defaultValue: shopFirmFullName,
          //         key: const ValueKey(MyProfileConstants.keyShopFullName),
          //         labelText: context.localizedString.nameOfShopFirm,
          //         enable: false,
          //         onChangeCallBack: (value) {},
          //         validator: (value) {
          //           return OnboardingValidators()
          //               .validateNotNullOrEmptyOrSpaces(
          //                   value, context.localizedString.shopFirmFullName);
          //         },
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //name EDITABLE
          //       ValidatorEnabledInputTextNew(
          //         //controller: nameTextController,
          //         isEditable: true,
          //         labelText: context.localizedString.name,
          //         defaultValue: MyProfileConstants.retailerName,
          //         key: MyProfileConstants.keyName,
          //         onChangeCallBack: (text) {
          //           // cubit.setName(text);
          //           // cubit.softValidateFields();
          //           reqMap[MyProfileConstants.retailerName] = text;
          //         },
          //         enable: true,
          //         validator: (value) {
          //           return OnboardingValidators()
          //               .validateNotNullOrEmptyOrSpaces(
          //                   value, context.localizedString.shopNameError);
          //         },
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //shopAddress
          //       ValidatorDisabledInputTextNew(
          //         enable: false,
          //         labelText: context.localizedString.shopAddress,
          //         defaultValue: shopAddress,
          //         key: MyProfileConstants.keyShopAddress,
          //         onChangeCallBack: (value) {},
          //         validator: (value) {
          //           return OnboardingValidators()
          //               .validateNotNullOrEmptyOrSpaces(
          //                   value, context.localizedString.shopAddressError);
          //         },
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //pincode
          //       ValidatorDisabledInputTextNew(
          //         labelText: context.localizedString.pinCode,
          //         defaultValue: pinCode,
          //         key: MyProfileConstants.keyPinCode,
          //         enable: false,
          //         onChangeCallBack: (value) {},
          //         validator: (value) {
          //           return OnboardingValidators()
          //               .validateNotNullOrEmptyOrSpaces(
          //                   value, context.localizedString.pincodeError);
          //         },
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //city
          //       ValidatorDisabledInputTextNew(
          //         labelText: context.localizedString.city,
          //         defaultValue: city,
          //         key: MyProfileConstants.keyCity,
          //         onChangeCallBack: (value) {
          //           MyProfileConstants.city = value;
          //         },
          //         enable: false,
          //         validator: (value) {
          //           return OnboardingValidators()
          //               .validateNotNullOrEmptyOrSpaces(
          //                   value, context.localizedString.cityError);
          //         },
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //state
          //       OnboardingDropDownNew(
          //         defaultValue: stateName,
          //         enable: false,
          //         labelText: context.localizedString.state,
          //         onChangeCallBack: (value) {},
          //         dropdownItems: [], // Add your dropdown items here
          //         validator: (value) {
          //           return null;
          //         },
          //         key: MyProfileConstants.keyState,
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //emailId
          //       ValidatorDisabledInputTextNew(
          //         labelText: context.localizedString.emailId,
          //         defaultValue: mobileNumber,
          //         key: MyProfileConstants.keyMobileNumber,
          //         onChangeCallBack: (value) {},
          //         enable: false,
          //         validator: (value) {
          //           return OnboardingValidators()
          //               .validateNotNullOrEmptyOrSpaces(value,
          //                   context.localizedString.mobileNumLengthError);
          //         },
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //mobile number
          //       ValidatorDisabledInputTextNew(
          //         labelText: context.localizedString.mobileNo,
          //         defaultValue: emailId,
          //         key: MyProfileConstants.keyEmailId,
          //         onChangeCallBack: (value) {},
          //         enable: false,
          //         validator: (value) {
          //           return OnboardingValidators()
          //               .validateNotNullOrEmptyOrSpaces(
          //                   value, context.localizedString.emailError);
          //         },
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //telephone EDITABLE
          //       ValidatorEnabledInputTextNew(
          //         //controller: telephoneTextController,
          //         labelText: context.localizedString.telephoneNo,
          //         isEditable: true,
          //         defaultValue: telephone,
          //         key: MyProfileConstants.keyTelephoneNumber,
          //         textInputType: TextInputType.phone,
          //         maxLength: 10,
          //         onChangeCallBack: (text) {
          //           // cubit.setTelephoneNumber(text);
          //           if (text.trim().length == 10 || text.isEmpty) {
          //             MyProfileConstants.telephone = text;
          //             // cubit.validateMainMobileNumber();
          //           }
          //         },
          //         enable: true,
          //         validator: (value) {
          //           // return OnboardingValidators()
          //           //     .validateNotNullOrEmptyOrSpaces(
          //           //         value, context.localizedString.telephoneError);
          //           return null;
          //         },
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //dl one EDITABLE
          //       ValidatorEnabledInputTextNew(
          //         widgetKey: MyProfileConstants.keyDrugLicenseNumber,
          //         defaultValue: MyProfileConstants.drugLicenseNumber,
          //         validator: (value) {
          //           // return OnboardingValidators().validateImageFormField(
          //           //     file, context.localizedString.drugLicenseFileError);
          //           return null;
          //         },
          //         // selectedFile:
          //         //     state.hasDrugLicenseFile1 ? state.drugLicenseFile1 : null,
          //         onChangeCallBack: (value) {
          //           // cubit.setDrugLicenseNum1(value);
          //           // cubit.softValidateFields();
          //         },
          //         labelText: context.localizedString.drugLicenseNumber,
          //       ),

          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //gst
          //       OnboardingDropDownNew(
          //         defaultValue: gstin,
          //         enable: false,
          //         labelText: context.localizedString.gst,
          //         onChangeCallBack: (value) {},
          //         dropdownItems: [], // Add your dropdown items here
          //         validator: (value) {
          //           return null;
          //         },
          //         key: MyProfileConstants.keyGstin,
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //pan number EDITABLE
          //       ValidatorEnabledInputTextNew(
          //         //controller: panNumberTextController,
          //         isEditable: true,
          //         labelText: context.localizedString.panNumber,
          //         defaultValue: panNumber,
          //         key: MyProfileConstants.keyPanNumber,
          //         onChangeCallBack: (value) {
          //           // cubit.setPanNumber(value);
          //           // cubit.softValidateFields();
          //           reqMap[MyProfileConstants.panNumber] = value;
          //         },
          //         enable: true,
          //         validator: (value) {
          //           // return OnboardingValidators()
          //           //     .validateNotNullOrEmptyOrSpaces(
          //           //         value, context.localizedString.panError);
          //           return null;
          //         },
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //upiId EDITABLE
          //       ValidatorEnabledInputTextNew(
          //         //controller: upiIdTextController,
          //         isEditable: true,
          //         labelText: context.localizedString.upiId,
          //         defaultValue: upiId,
          //         key: MyProfileConstants.keyUpiId,
          //         onChangeCallBack: (value) {
          //           // cubit.setUpiId(value);
          //           cubit.softValidateFields();
          //           reqMap[MyProfileConstants.upiId] = value;
          //         },
          //         enable: true,
          //         validator: (value) {
          //           // return OnboardingValidators()
          //           //     .validateNotNullOrEmptyOrSpaces(
          //           //         value, context.localizedString.upiIdError);
          //           return null;
          //         },
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //bank name EDITABLE
          //       ValidatorEnabledInputTextNew(
          //         //controller: bankNameTextController,
          //         isEditable: true,
          //         labelText: context.localizedString.bankName,
          //         defaultValue: bankName,
          //         key: MyProfileConstants.keyBankName,
          //         onChangeCallBack: (value) {
          //           // cubit.setBankName(value);
          //           cubit.softValidateFields();
          //           reqMap[MyProfileConstants.bankName] = value;
          //         },
          //         enable: true,
          //         validator: (value) {
          //           // return OnboardingValidators()
          //           //     .validateNotNullOrEmptyOrSpaces(
          //           //         value, context.localizedString.bankNameError);
          //           return null;
          //         },
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //account type EDITABLE
          //       ValidatorEnabledInputTextNew(
          //         //controller: accountTypeTextController,
          //         isEditable: true,
          //         labelText: context.localizedString.accountType,
          //         defaultValue: accountType,
          //         key: MyProfileConstants.keyAccountType,
          //         onChangeCallBack: (value) {
          //           // cubit.setAccountType(value);
          //           cubit.softValidateFields();
          //           reqMap[MyProfileConstants.accountType] = value;
          //         },
          //         enable: true,
          //         validator: (value) {
          //           // return OnboardingValidators()
          //           //     .validateNotNullOrEmptyOrSpaces(
          //           //         value, context.localizedString.accountTypeError);
          //           return null;
          //         },
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //bank account number EDITABLE
          //       ValidatorEnabledInputTextNew(
          //         //controller: bankAccountNumberTextController,
          //         isEditable: true,
          //         labelText: context.localizedString.bankAccountNumber,
          //         defaultValue: bankAccountNumber,
          //         key: MyProfileConstants.keyBankAccountNumber,
          //         onChangeCallBack: (value) {
          //           // cubit.setBankAccountNumber(value);
          //           cubit.softValidateFields();
          //           reqMap[MyProfileConstants.bankAccountNumber] = value;
          //         },
          //         enable: true,
          //         validator: (value) {
          //           // return OnboardingValidators()
          //           //     .validateNotNullOrEmptyOrSpaces(value,
          //           //         context.localizedString.bankAccountNumberError);
          //           return null;
          //         },
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //account holder name EDITABLE
          //       ValidatorEnabledInputTextNew(
          //         //controller: accountHolderNameTextEditingController,
          //         isEditable: true,
          //         labelText: context.localizedString.accountHolderName,
          //         defaultValue: bankHolderName,
          //         key: MyProfileConstants.keyAccountHolderName,
          //         onChangeCallBack: (value) {
          //           // cubit.setBankAccountHolderName(value);
          //           cubit.softValidateFields();
          //           reqMap[MyProfileConstants.bankAccountHolderName] = value;
          //         },
          //         enable: true,
          //         validator: (value) {
          //           // return OnboardingValidators()
          //           //     .validateNotNullOrEmptyOrSpaces(value,
          //           //         context.localizedString.accountHolderNameError);
          //           return null;
          //         },
          //       ),
          //       const SizedBox(
          //         height: 8,
          //       ),

          //       //ifsc EDITABLE
          //       ValidatorEnabledInputTextNew(
          //         //controller: ifscTextEditingController,
          //         isEditable: true,
          //         labelText: context.localizedString.ifsc,
          //         defaultValue: ifscCode,
          //         key: MyProfileConstants.keyIfscCode,
          //         onChangeCallBack: (value) {
          //           // cubit.setIfscCode(value);
          //           cubit.softValidateFields();
          //           reqMap[MyProfileConstants.ifsc] = value;
          //         },
          //         enable: true,
          //         validator: (value) {
          //           // return OnboardingValidators()
          //           //     .validateNotNullOrEmptyOrSpaces(
          //           //         value, context.localizedString.ifscError);
          //           return null;
          //         },
          //       ),

          //       const SizedBox(height: 25),

          //       //DL Image BOX
          //       onboardingDI<RetailerInfoEntity>().displayImages != null
          //           ? SizedBox(
          //               height: 300,
          //               child: Column(children: [
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     InkWell(
          //                       onTap: () async {
          //                         final selection = await showImagePickerDialog(
          //                             context, closeClick: () {
          //                           onboardingDI<RetailerInfoEntity>()
          //                               .displayImages!
          //                               .removeAt(0);
          //                         });
          //                         await handleMediaSelection(selection);
          //                       },
          //                       child: const Row(
          //                         children: [
          //                           Icon(
          //                             Icons.camera_alt_sharp,
          //                             color: AppColors.blueButtonColor,
          //                           ),
          //                           Text(
          //                               'Upload/Capture Drug License or Bill Copy'),
          //                         ],
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //                 const SizedBox(height: 16),
          //                 Container(
          //                   height: 240,
          //                   alignment: Alignment.center,
          //                   child: onboardingDI<RetailerInfoEntity>()
          //                               .displayImages !=
          //                           null
          //                       ? CachedNetworkImage(
          //                           imageUrl: onboardingDI<RetailerInfoEntity>()
          //                               .displayImages![0]
          //                               .imageUrl!,
          //                           fit: BoxFit.fill,
          //                           placeholder: (_, __) {
          //                             return const Center(
          //                               child: SpinKitFadingCircle(
          //                                 color: AppColors.blueButtonColor,
          //                                 size: 50.0,
          //                               ),
          //                             );
          //                           },
          //                           errorWidget: (context, url, error) =>
          //                               const Center(
          //                             child: Text('Image Not Found'),
          //                           ),
          //                         )
          //                       : const Center(
          //                           child: Text(
          //                             'Image Not Found',
          //                             style: TextStyle(
          //                               color: Colors.black, // Text color
          //                               fontSize: 18,
          //                               fontWeight: FontWeight.bold,
          //                             ),
          //                           ),
          //                         ),
          //                 ),
          //                 // onboardingDI<RetailerInfoEntity>().displayImages !=
          //                 //         null
          //                 //     ? onboardingDI<RetailerInfoEntity>()
          //                 //                 .displayImages![0]
          //                 //                 .imageUrl !=
          //                 //             null
          //                 //         ? Image.network(errorBuilder:
          //                 //                 (context, error, stackTrace) {
          //                 //             return Container(
          //                 //               decoration: BoxDecoration(
          //                 //                 color: Colors
          //                 //                     .white, // Background color for the container
          //                 //                 borderRadius:
          //                 //                     BorderRadius.circular(12),
          //                 //                 border: Border.all(
          //                 //                     color: Colors.grey,
          //                 //                     width:
          //                 //                         2), // Border radius for rounded corners
          //                 //               ),
          //                 //               height: 260,
          //                 //               // Background color for the container
          //                 //               child: Center(
          //                 //                 child: Text(
          //                 //                   'Image Not Found',
          //                 //                   style: TextStyle(
          //                 //                     color: Colors.black, // Text color
          //                 //                     fontSize: 18,
          //                 //                     fontWeight: FontWeight.bold,
          //                 //                   ),
          //                 //                 ),
          //                 //               ),
          //                 //             );
          //                 //           },
          //                 //             height: 260,
          //                 //             fit: BoxFit.cover,
          //                 //             '${onboardingDI<RetailerInfoEntity>().displayImages![0].imageUrl}')
          //                 //         : Image.file(
          //                 //             errorBuilder:
          //                 //                 (context, error, stackTrace) {
          //                 //               return Container(
          //                 //                 decoration: BoxDecoration(
          //                 //                   color: Colors
          //                 //                       .white, // Background color for the container
          //                 //                   borderRadius:
          //                 //                       BorderRadius.circular(12),
          //                 //                   border: Border.all(
          //                 //                       color: Colors.grey,
          //                 //                       width:
          //                 //                           2), // Border radius for rounded corners
          //                 //                 ),
          //                 //                 height: 260,
          //                 //                 // Background color for the container
          //                 //                 child: Center(
          //                 //                   child: Text(
          //                 //                     'Image Not Found',
          //                 //                     style: TextStyle(
          //                 //                       color:
          //                 //                           Colors.black, // Text color
          //                 //                       fontSize: 18,
          //                 //                       fontWeight: FontWeight.bold,
          //                 //                     ),
          //                 //                   ),
          //                 //                 ),
          //                 //               );
          //                 //             },
          //                 //             height: 260,
          //                 //             fit: BoxFit.cover,
          //                 //             File(onboardingDI<RetailerInfoEntity>()
          //                 //                 .displayImages![0]
          //                 //                 .imageUrl!),
          //                 //           )
          //                 //     : Container(), // Placeholder whe
          //                 const SizedBox(height: 16),
          //               ]),
          //             )
          //           : Container(),
          //       const SizedBox(height: 25),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }

  _onBlocListener(BuildContext context, EditProfileState state) {
    if (state.userMessages.contains(UserMessage.updateProfileSuccess)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
      // showSuccessDialog(
      //   context,
      //   title: context.localizedString.profileUpdated,
      //   subtitle:
      //   context.localizedString.profileUpdatedSuccessfully,
      //
      // );
    }
  }

  Future handleMediaSelection(
    selection,
  ) async {
    if (selection == null) return null;

    final file = selection == MediaSelection.gallery
        ? await ImagePickerUtil.pickImageFromGallery()
        : await ImagePickerUtil.pickImageFromCamera();

    if (file != null) {
      setState(() {
        DisplayImage displayImage = DisplayImage(imageUrl: file.path);
        onboardingDI<RetailerInfoEntity>().displayImages!.add(displayImage);
        //selectedFile!.add(File(file.path));
      });
    }

    return null;
  }

  String getFilename(File? file) {
    return file?.path.split('/').last ?? '';
  }
}

void cancelChanges(BuildContext context) {
  Navigator.of(context).pop();
}

class _TextField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String title;
  final String? errorText;
  final String? successText;
  final String? prefilledText;
  final Key? key;

  const _TextField({
    required this.title,
    this.onChanged,
    this.errorText,
    this.successText,
    this.prefilledText,
    this.key,
  });

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  @override
  Widget build(BuildContext context) {
    InformationType informationType = InformationType.neutral;
    if (widget.errorText != null) {
      informationType = InformationType.error;
    } else if (widget.successText != null) {
      informationType = InformationType.success;
    }
    return TextInputField(
      hintText: widget.prefilledText,
      title: widget.title,
      onChanged: widget.onChanged,
      informationText: widget.errorText ?? widget.successText,
      informationType: informationType,
    );
  }
}
