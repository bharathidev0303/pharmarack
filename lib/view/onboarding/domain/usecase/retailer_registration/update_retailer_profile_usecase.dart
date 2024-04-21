import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/features/profile/presentation/constants/edit_profile_constants.dart';
import 'package:pharmarack/view/features/profile/presentation/constants/my_profile_constants.dart';
import 'package:pharmarack/view/onboarding/data/entities/retailer_Image_upload_entity.dart';
import 'package:pharmarack/view/onboarding/domain/model/registration_model.dart';
import 'package:pharmarack/view/onboarding/domain/model/update_retailer_model.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';

class UpdateRetailerProfileUsecase extends BaseUseCase<BaseError,
    UpdateRetailerUseCaseParams, UpdateRetailerModel> {
  final OnboardingRepository onboardingRepository;
  UpdateRetailerProfileUsecase({required this.onboardingRepository});
  final UpdateRetailerModel updateRetailerModel = UpdateRetailerModel();

  @override
  Future<Either<NetworkError, UpdateRetailerModel>> execute(
      {required params, reqData, DrugLicenseImages? drugLisenseImage}) async {
    return onboardingRepository.updateRetailerProfile(
        getRequestUpdateString(reqData, drugLisenseImage));
  }

  void updateProfileData(Map<String, String> reqData) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // MyProfileConstants.retailerName =
    //     reqData[OnboardingConstants.name]?.trim() ?? '';

    // MyProfileConstants.telephone =
    //     reqData[OnboardingConstants.telephoneNumber]?.trim() ?? '';
    MyProfileConstants.retailerNameEncoded =
        stringToBase64.encode(MyProfileConstants.retailerName?.trim() ?? '');
    MyProfileConstants.partyNameEncoded =
        stringToBase64.encode(MyProfileConstants.retailerName?.trim() ?? '');
    MyProfileConstants.address1Encoded =
        stringToBase64.encode(MyProfileConstants.address1?.trim() ?? '');
    MyProfileConstants.address2Encoded =
        stringToBase64.encode(MyProfileConstants.address2?.trim() ?? '');
    MyProfileConstants.cityEncoded =
        stringToBase64.encode(MyProfileConstants.city?.trim() ?? '');
    // MyProfileConstants.firstName = stringToBase64
    //     .encode(reqData[MyProfileConstants.firstName]?.trim() ?? '');
    // MyProfileConstants.lastName = stringToBase64
    //     .encode(reqData[MyProfileConstants.lastName]?.trim() ?? '');
    MyProfileConstants.drugLicenseNumberEncoded = stringToBase64
        .encode(MyProfileConstants.drugLicenseNumber?.trim() ?? '');
    MyProfileConstants.drugLicenseNumber2Encoded = stringToBase64
        .encode(MyProfileConstants.drugLicenseNumber2?.trim() ?? '');
    MyProfileConstants.drugLicenseNumber3Encoded = stringToBase64
        .encode(MyProfileConstants.drugLicenseNumber3?.trim() ?? '');
    // MyProfileConstants.panNumber =
    //     reqData[OnboardingConstants.panNumber]?.trim() ?? '';
    // MyProfileConstants.upiId = reqData[OnboardingConstants.upiId]?.trim() ?? '';
    // MyProfileConstants.bankName =
    //     reqData[OnboardingConstants.bankNme]?.trim() ?? '';
    // MyProfileConstants.accountType =
    //     reqData[OnboardingConstants.accountType]?.trim() ?? '';
    // MyProfileConstants.bankAccountNumber =
    //     reqData[OnboardingConstants.accountNumber]?.trim() ?? '';
    // MyProfileConstants.bankAccountHolderName =
    //     reqData[OnboardingConstants.accountHolderName]?.trim() ?? '';
    // MyProfileConstants.ifsc = reqData[OnboardingConstants.ifsc]?.trim() ?? '';
  }

  // Map<String, dynamic> getRequestString() {
  //   var reqMap = {
  //     "updateuser": {
  //       "FirstName": "${MyProfileConstants.firstName}" ?? "",
  //       "LastName": "${MyProfileConstants.lastName}" ?? "",
  //       "Email": "${MyProfileConstants.emailId}" ?? "",
  //       "Partyname": "${MyProfileConstants.partyNameEncoded}" ?? "",
  //       "MobileNumber": "${MyProfileConstants.mobileNo}" ?? "",
  //       "Telephone": "${MyProfileConstants.telephone}" ?? ""
  //     },
  //     "updateretailer": {
  //       "RetailerId": MyProfileConstants.retailerId ?? 0,
  //       "RetailerName": "${MyProfileConstants.retailerNameEncoded}" ?? "",
  //       "Address1": "${MyProfileConstants.address1Encoded}" ?? "",
  //       "Address2": "${MyProfileConstants.address2Encoded}" ?? "",
  //       "City": "${MyProfileConstants.cityEncoded}" ?? "",
  //       "Pincode": "${MyProfileConstants.pinCode}" ?? "",
  //       "RegionId": "${MyProfileConstants.regionId}" ?? "",
  //       "StateId": "${MyProfileConstants.stateId}" ?? "",
  //       "MobileNumber": "${MyProfileConstants.mobileNo}" ?? "",
  //       "Telephone": "${MyProfileConstants.telephone}" ?? "",
  //       "email": "${MyProfileConstants.emailId}" ?? "",
  //       "LicenseNumber": "${MyProfileConstants.drugLicenseNumberEncoded}" ?? "",
  //       "SecondDLNumber":
  //           "${MyProfileConstants.drugLicenseNumber2Encoded}" ?? "",
  //       "ThirdDLNumber":
  //           "${MyProfileConstants.drugLicenseNumber3Encoded}" ?? "",
  //       "GSTINNumber": "${MyProfileConstants.gstin}" ?? "",
  //       "ContactPerson": "${MyProfileConstants.contactPerson}" ?? "",
  //       "BusinessType": "${MyProfileConstants.businessType}" ?? "",
  //       "PanNumber": "${MyProfileConstants.panNumber}" ?? "",
  //       "IsWhatsappConsentAgree": 1
  //     },
  //     "retailerPaymentConfig": {
  //       "UPIId": "${MyProfileConstants.upiId}" ?? "",
  //       "BankName": "${MyProfileConstants.bankName}" ?? "",
  //       "BankAccountType": "${MyProfileConstants.accountType}" ?? "",
  //       "AccountType": "${MyProfileConstants.accountType}" ?? "",
  //       "BankAcNumber": "${MyProfileConstants.bankAccountNumber}" ?? "",
  //       "BankAcName": "${MyProfileConstants.bankName}" ?? "",
  //       "IFSC": "${MyProfileConstants.ifsc}" ?? "",
  //       "IsUPIVerified": "${MyProfileConstants.isUpiVerified}" ?? ""
  //     },
  //     "IsImageChanged": "null",
  //     "IsRetailerNameEncoded": "1",
  //     "GSTINOption": MyProfileConstants.gstin ?? '',
  //     "NewApp": true,
  //     "gcmregistration": "yes",
  //   };
  //   return reqMap;
  // }

  Map<String, dynamic> getRequestUpdateString(
      Map<String, dynamic> reqData, DrugLicenseImages? drugLisenseImage) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    var reqMap = {
      "updateuser": {
        "FirstName": "${reqData[EditProfileConstants.firstNameField]}",
        "LastName": "${reqData[EditProfileConstants.lastNameField]}",
        "Email": "${reqData[EditProfileConstants.emailField]}",
        "Partyname": stringToBase64
            .encode(reqData[EditProfileConstants.retailerNameField])
            .trim(),
        "MobileNumber": "${reqData[EditProfileConstants.mobileNumberField]}",
        "Telephone": "${reqData[EditProfileConstants.telephoneField]}"
      },
      "updateretailer": {
        "RetailerId": reqData[EditProfileConstants.retailerIdField] ?? 0,
        "RetailerName": stringToBase64
            .encode(reqData[EditProfileConstants.retailerNameField])
            .trim(),
        "Address1": stringToBase64
            .encode(reqData[EditProfileConstants.address1Field])
            .trim(),
        "Address2": stringToBase64
            .encode(reqData[EditProfileConstants.address2Field])
            .trim(),
        "City": stringToBase64
            .encode(reqData[EditProfileConstants.cityField])
            .trim(),
        "Pincode": "${reqData[EditProfileConstants.pincodeField]}",
        "RegionId": "${reqData[EditProfileConstants.regionIdField]}",
        "StateId": "${reqData[EditProfileConstants.stateIdField]}",
        "MobileNumber": "${reqData[EditProfileConstants.mobileNumberField]}",
        "Telephone": "${reqData[EditProfileConstants.telephoneField]}",
        "email": "${reqData[EditProfileConstants.emailField]}",
        "LicenseNumber": stringToBase64
            .encode(reqData[EditProfileConstants.licenseNumberField])
            .trim(),
        "SecondDLNumber": "",
        "ThirdDLNumber": "",
        "GSTINNumber": "${reqData[EditProfileConstants.gSTINNumberField]}",
        "ContactPerson": "${reqData[EditProfileConstants.contactPersonField]}",
        "BusinessType": "${reqData[EditProfileConstants.businessTypeField]}",
        "PanNumber": "${reqData[EditProfileConstants.panNumberField]}",
        "IsWhatsappConsentAgree": 1
      },
      "drugLicenseImages": [
        {
          "imageUrl": drugLisenseImage!.imageUrl,
          "imageDbPath": drugLisenseImage.imageDbPath,
          "type": drugLisenseImage.type
        }
      ],
      "retailerPaymentConfig": {
        "UPIId": "${reqData[EditProfileConstants.uPIIdField]}",
        "BankName": "${reqData[EditProfileConstants.bankNameField]}",
        "BankAccountType": "${reqData[EditProfileConstants.accountTypeField]}",
        "AccountType": "${reqData[EditProfileConstants.accountTypeField]}",
        "BankAcNumber": "${reqData[EditProfileConstants.bankAcNumberField]}",
        "BankAcName": "${reqData[EditProfileConstants.bankAcNameField]}",
        "IFSC": "${reqData[EditProfileConstants.iFSCField]}",
        "IsUPIVerified": "${reqData[EditProfileConstants.isUPIVerifiedField]}"
      },
      "IsImageChanged": "null",
      "IsRetailerNameEncoded": "1",
      "GSTINOption": reqData[EditProfileConstants.gSTINOptionField] ?? '',
      "NewApp": true,
      "gcmregistration": "yes",
    };
    return reqMap;
  }
}

class UpdateRetailerUseCaseParams extends Params {
  Map<String, dynamic> postRequest;

  UpdateRetailerUseCaseParams(this.postRequest);
}
