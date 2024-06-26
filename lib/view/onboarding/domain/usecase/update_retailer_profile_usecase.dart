import 'dart:convert';


import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';

import '../../utils/constants.dart';
import '../model/update_retailer_model.dart';
import '../repository/onboarding_repository.dart';


// class UpdateRetailerProfileUsecase extends BaseUseCase<BaseError,
//     UpdateRetailerUseCaseParams, UpdateRetailerModel> {
//   final OnboardingRepository onboardingRepository;
//   UpdateRetailerProfileUsecase({required this.onboardingRepository});
//   final UpdateRetailerModel updateRetailerModel = UpdateRetailerModel();

//   Future<Either<NetworkError, UpdateRetailerModel>> execute(
//       {required params}) async {
//     return onboardingRepository.updateRetailerProfile(getRequestString());
//   }

//   void updateProfileData(Map<String, String> reqData) {
//     Codec<String, String> stringToBase64 = utf8.fuse(base64);
//     // MyProfileConstants.retailerName =
//     //     reqData[OnboardingConstants.name]?.trim() ?? '';

//     // MyProfileConstants.telephone =
//     //     reqData[OnboardingConstants.telephoneNumber]?.trim() ?? '';
//   //   MyProfileConstants.retailerNameEncoded =
//   //       stringToBase64.encode(MyProfileConstants.retailerName?.trim() ?? '');
//   //   MyProfileConstants.partyNameEncoded =
//   //       stringToBase64.encode(MyProfileConstants.retailerName?.trim() ?? '');
//   //   MyProfileConstants.address1Encoded =
//   //       stringToBase64.encode(MyProfileConstants.address1?.trim() ?? '');
//   //   MyProfileConstants.address2Encoded =
//   //       stringToBase64.encode(MyProfileConstants.address2?.trim() ?? '');
//   //   MyProfileConstants.cityEncoded =
//   //       stringToBase64.encode(MyProfileConstants.city?.trim() ?? '');
//   //   // MyProfileConstants.firstName = stringToBase64
//   //   //     .encode(reqData[MyProfileConstants.firstName]?.trim() ?? '');
//   //   // MyProfileConstants.lastName = stringToBase64
//   //   //     .encode(reqData[MyProfileConstants.lastName]?.trim() ?? '');
//   //   MyProfileConstants.drugLicenseNumberEncoded = stringToBase64
//   //       .encode(MyProfileConstants.drugLicenseNumber?.trim() ?? '');
//   //   MyProfileConstants.drugLicenseNumber2Encoded = stringToBase64
//   //       .encode(MyProfileConstants.drugLicenseNumber2?.trim() ?? '');
//   //   MyProfileConstants.drugLicenseNumber3Encoded = stringToBase64
//   //       .encode(MyProfileConstants.drugLicenseNumber3?.trim() ?? '');
//   //   // MyProfileConstants.panNumber =
//   //   //     reqData[OnboardingConstants.panNumber]?.trim() ?? '';
//   //   // MyProfileConstants.upiId = reqData[OnboardingConstants.upiId]?.trim() ?? '';
//   //   // MyProfileConstants.bankName =
//   //   //     reqData[OnboardingConstants.bankNme]?.trim() ?? '';
//   //   // MyProfileConstants.accountType =
//   //   //     reqData[OnboardingConstants.accountType]?.trim() ?? '';
//   //   // MyProfileConstants.bankAccountNumber =
//   //   //     reqData[OnboardingConstants.accountNumber]?.trim() ?? '';
//   //   // MyProfileConstants.bankAccountHolderName =
//   //   //     reqData[OnboardingConstants.accountHolderName]?.trim() ?? '';
//   //   // MyProfileConstants.ifsc = reqData[OnboardingConstants.ifsc]?.trim() ?? '';
//   // }

//   // Map<String, dynamic> getRequestString() {
//   //   var reqMap = {
//   //     "updateuser": {
//   //       "FirstName": "${MyProfileConstants.firstName}" ?? "",
//   //       "LastName": "${MyProfileConstants.lastName}" ?? "",
//   //       "Email": "${MyProfileConstants.emailId}" ?? "",
//   //       "Partyname": "${MyProfileConstants.partyNameEncoded}" ?? "",
//   //       "MobileNumber": "${MyProfileConstants.mobileNo}" ?? "",
//   //       "Telephone": "${MyProfileConstants.telephone}" ?? ""
//   //     },
//   //     "updateretailer": {
//   //       "RetailerId": MyProfileConstants.retailerId ?? 0,
//   //       "RetailerName": "${MyProfileConstants.retailerNameEncoded}" ?? "",
//   //       "Address1": "${MyProfileConstants.address1Encoded}" ?? "",
//   //       "Address2": "${MyProfileConstants.address2Encoded}" ?? "",
//   //       "City": "${MyProfileConstants.cityEncoded}" ?? "",
//   //       "Pincode": "${MyProfileConstants.pinCode}" ?? "",
//   //       "RegionId": "${MyProfileConstants.regionId}" ?? "",
//   //       "StateId": "${MyProfileConstants.stateId}" ?? "",
//   //       "MobileNumber": "${MyProfileConstants.mobileNo}" ?? "",
//   //       "Telephone": "${MyProfileConstants.telephone}" ?? "",
//   //       "email": "${MyProfileConstants.emailId}" ?? "",
//   //       "LicenseNumber": "${MyProfileConstants.drugLicenseNumberEncoded}" ?? "",
//   //       "SecondDLNumber":
//   //           "${MyProfileConstants.drugLicenseNumber2Encoded}" ?? "",
//   //       "ThirdDLNumber":
//   //           "${MyProfileConstants.drugLicenseNumber3Encoded}" ?? "",
//   //       "GSTINNumber": "${MyProfileConstants.gstin}" ?? "",
//   //       "ContactPerson": "${MyProfileConstants.contactPerson}" ?? "",
//   //       "BusinessType": "${MyProfileConstants.businessType}" ?? "",
//   //       "PanNumber": "${MyProfileConstants.panNumber}" ?? "",
//   //       "IsWhatsappConsentAgree": 1
//   //     },
//   //     "retailerPaymentConfig": {
//   //       "UPIId": "${MyProfileConstants.upiId}" ?? "",
//   //       "BankName": "${MyProfileConstants.bankName}" ?? "",
//   //       "BankAccountType": "${MyProfileConstants.accountType}" ?? "",
//   //       "AccountType": "${MyProfileConstants.accountType}" ?? "",
//   //       "BankAcNumber": "${MyProfileConstants.bankAccountNumber}" ?? "",
//   //       "BankAcName": "${MyProfileConstants.bankName}" ?? "",
//   //       "IFSC": "${MyProfileConstants.ifsc}" ?? "",
//   //       "IsUPIVerified": "${MyProfileConstants.isUpiVerified}" ?? ""
//   //     },
//   //     "IsImageChanged": "null",
//   //     "IsRetailerNameEncoded": "1",
//   //     "GSTINOption": MyProfileConstants.gstin ?? '',
//   //     "NewApp": true,
//   //     "gcmregistration": "yes",
//   //   };
//   //   return reqMap;
//   // }
// }

// class UpdateRetailerUseCaseParams extends Params {
//   Map<String, dynamic> postRequest;

//   UpdateRetailerUseCaseParams(this.postRequest);
// }
