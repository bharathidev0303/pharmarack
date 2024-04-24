import 'dart:convert';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/onboarding/data/entities/retailer_Image_upload_entity.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/domain/model/registration_model.dart';
import 'package:pharmarack/view/onboarding/domain/model/registration_response_model.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RetailerRegistrationUserCase extends BaseUseCase<BaseError,
    RetailerRegistrationParams, RegistrationResponseModel> {
  final OnboardingRepository _onboardingRepository;
  RetailerRegistrationUserCase(this._onboardingRepository);
  final RegistrationModel regModel = RegistrationModel();

  void setStepOneRegistrationData(Map<String, String> reqData) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);

    regModel.newuser ??= Newuser();
    regModel.newretailer ??= Newretailer();

    // regModel.newuser?.userId = 0;
    // regModel.newretailer?.retailerId = 0;
    regModel.isNewApp = '1';
    regModel.newApp = true;

    regModel.businessType =
        int.parse(reqData[OnboardingConstants.typeOfBusiness]?.trim() ?? "");
    regModel.newuser?.firstName =
        reqData[OnboardingConstants.nameOfOwner]?.trim() ?? '';
    regModel.newuser?.lastName =
        reqData[OnboardingConstants.nameOfOwner]?.trim() ?? '';
    regModel.newretailer?.retailerName = stringToBase64
        .encode(reqData[OnboardingConstants.nameOfShopFirm]?.trim() ?? '');

    regModel.newretailer?.address1 = stringToBase64
        .encode(reqData[OnboardingConstants.shopAddress]?.trim() ?? '');
    regModel.newretailer?.pincode =
        int.parse(reqData[OnboardingConstants.pincode]?.trim() ?? '');
    regModel.newretailer?.address2 =
        stringToBase64.encode(reqData[OnboardingConstants.area]?.trim() ?? '');
    regModel.newretailer?.city =
        reqData[OnboardingConstants.city]?.trim() ?? '';
    regModel.newretailer?.regionId =
        int.parse(reqData[OnboardingConstants.regionId]?.trim() ?? '');
    regModel.newretailer?.stateId =
        int.parse(reqData[OnboardingConstants.stateId]?.trim() ?? '');
  }

  void setStepTwoRegistrationData(Map<String, String> reqData) {
    regModel.newuser ??= Newuser();
    regModel.newretailer ??= Newretailer();

    /// Mobile number field in newUser and newRetailer will be same as
    /// registration number
    regModel.newuser?.mobileNumber =
        reqData[OnboardingConstants.registrationMobileNumber]?.trim() ?? '';
    regModel.newretailer?.mobileNumber = int.parse(
        reqData[OnboardingConstants.registrationMobileNumber]?.trim() ?? '');

    regModel.newuser?.email =
        reqData[OnboardingConstants.registrationEmail]?.trim() ?? '';
    if (regModel.newretailer?.pharmacistDetails?.length == 3) {
      regModel.newretailer?.pharmacistDetails?[0].firstPharmacistName =
          reqData[OnboardingConstants.pharmacistName]?.trim() ?? '';
      regModel.newretailer?.pharmacistDetails?[0].firstPharmacistMobNo =
          reqData[OnboardingConstants.pharmacistNumber]?.trim() ?? '';
      regModel.newretailer?.pharmacistDetails?[1].firstPharmacistName =
          reqData[OnboardingConstants.pharmacistName2]?.trim() ?? '';
      regModel.newretailer?.pharmacistDetails?[1].firstPharmacistMobNo =
          reqData[OnboardingConstants.pharmacistNumber2]?.trim() ?? '';
      regModel.newretailer?.pharmacistDetails?[2].firstPharmacistName =
          reqData[OnboardingConstants.pharmacistName3]?.trim() ?? '';
      regModel.newretailer?.pharmacistDetails?[2].firstPharmacistMobNo =
          reqData[OnboardingConstants.pharmacistNumber3]?.trim() ?? '';
    } else if (regModel.newretailer?.pharmacistDetails?.length == 2) {
      regModel.newretailer?.pharmacistDetails?[0].firstPharmacistName =
          reqData[OnboardingConstants.pharmacistName]?.trim() ?? '';
      regModel.newretailer?.pharmacistDetails?[0].firstPharmacistMobNo =
          reqData[OnboardingConstants.pharmacistNumber]?.trim() ?? '';
      regModel.newretailer?.pharmacistDetails?[1].firstPharmacistName =
          reqData[OnboardingConstants.pharmacistName2]?.trim() ?? '';
      regModel.newretailer?.pharmacistDetails?[1].firstPharmacistMobNo =
          reqData[OnboardingConstants.pharmacistNumber2]?.trim() ?? '';
    } else {
      regModel.newretailer?.pharmacistDetails?[0].firstPharmacistName =
          reqData[OnboardingConstants.pharmacistName]?.trim() ?? '';
      regModel.newretailer?.pharmacistDetails?[0].firstPharmacistMobNo =
          reqData[OnboardingConstants.pharmacistNumber]?.trim() ?? '';
    }

    regModel.newuser?.password =
        reqData[OnboardingConstants.password]?.trim() ?? '';
  }

  void setStepThreeRegistrationData(Map<String, String> reqData) {
    Codec<String, String> stringToBase64 = utf8.fuse(base64);

    regModel.newuser ??= Newuser();
    regModel.newretailer ??= Newretailer();

    /// Drug licence number 1,2,3 need to convert to base64 values
    regModel.newretailer?.licenseNumber = stringToBase64
        .encode(reqData[OnboardingConstants.drugLicenseNum1]?.trim() ?? '');
    // regModel.newretailer?.secondDLNumber = stringToBase64
    //     .encode(reqData[OnboardingConstants.drugLicenseNum2]?.trim() ?? '');
    // regModel.newretailer?.thirdDLNumber = stringToBase64
    //     .encode(reqData[OnboardingConstants.drugLicenseNum3]?.trim() ?? '');

    regModel.newretailer?.gSTINNumber = stringToBase64
        .encode(reqData[OnboardingConstants.gstinNumber]?.trim() ?? '');
    regModel.newretailer?.panNumber =
        reqData[OnboardingConstants.panNumber]?.trim() ?? '';
    regModel.newretailer?.referralCode =
        reqData[OnboardingConstants.referralCode]?.trim() ?? '';
    regModel.newretailer?.isWhatsappConsentAgree =
        reqData[OnboardingConstants.whatsappConsentCheckbox] ?? '1';
  }

  @override
  Future<Either<BaseError, RegistrationResponseModel>> execute(
      {required params}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String oneSignal = pref.get('oneSignalId').toString() == ""
        ? getOneSignalId()
        : pref.get('oneSignalId').toString();
    return _onboardingRepository.registerRetailer(
        getRequestString(oneSignal, params.druglicenseEntity));
  }

  Map<String, dynamic> getRequestString(
      String oneSignalId, ImageUploadResponceEntity drugLisceseImage) {
    /// Encoded fields - RetailerName, Address1, Address2, 3 License Numbers, GST number.
    /// UserId, RetailerId will always be static 0
    /// IsNewApp = 1, NewApp = true
    /// gsmregistration for now it will be static, till notification implementation
    /// Drug license is part of another story

    var platform = '';
    if (Platform.isAndroid) {
      platform = 'android';
    } else if (Platform.isIOS) {
      platform = 'ios';
    }

    var reqMap = {
      'newuser': {
        "FirstName": "${regModel.newuser?.firstName}",
        "LastName": "${regModel.newuser?.lastName}",
        "Email": "${regModel.newuser?.email}",
        "MobileNumber": "${regModel.newuser?.mobileNumber}",
        "Password": "${regModel.newuser?.password}"
      },
      'BusinessType': '${regModel.businessType}',
      "drugLicenseImages": [
        {
          "imageUrl": drugLisceseImage!.imageUrl,
          "imageDbPath": drugLisceseImage.imageDbPath,
          "type": drugLisceseImage.type
        }
      ],
      'newretailer': {
        "RetailerName": "${regModel.newretailer?.retailerName}",
        "Address1": "${regModel.newretailer?.address1}",
        "Address2": "${regModel.newretailer?.address2}",
        "City": "${regModel.newretailer?.city}",
        "Pincode": "${regModel.newretailer?.pincode}",
        "RegionId": "${regModel.newretailer?.regionId ?? 0}",
        "StateId": "${regModel.newretailer?.stateId ?? 0}",
        "MobileNumber": "${regModel.newretailer?.mobileNumber}",
        "email": "${regModel.newretailer?.email}",
        "LicenseNumber": regModel.newretailer?.licenseNumber ?? '',
        "PanNumber": "${regModel.newretailer?.panNumber}",
        "ReferralCode": "${regModel.newretailer?.referralCode}",
        "IsWhatsappConsentAgree":
            "${regModel.newretailer?.isWhatsappConsentAgree}",
        "AppVersion": "3.0.0",
        "GSTINNumber": "${regModel.newretailer?.gSTINNumber}",
        "ContactPerson": "${regModel.newuser?.firstName}",
        "pharmacistDetails": [
          {
            "FirstPharmacistName":
                "${regModel.newretailer?.pharmacistDetails?[0].firstPharmacistName}",
            "FirstPharmacistMobNo":
                "${regModel.newretailer?.pharmacistDetails?[0].firstPharmacistMobNo}"
          },
          {
            "SecondPharmacistName":
                "${regModel.newretailer?.pharmacistDetails?[1].firstPharmacistName}",
            "SecondPharmacistMobNo":
                "${regModel.newretailer?.pharmacistDetails?[1].firstPharmacistMobNo}"
          },
          {
            "ThirdPharmacistName":
                "${regModel.newretailer?.pharmacistDetails?[2].firstPharmacistName}",
            "ThirdPharmacistsMobNo":
                "${regModel.newretailer?.pharmacistDetails?[2].firstPharmacistMobNo}"
          },
        ]
      },
      'gcmregistration': oneSignalId,
      'IsNewApp': '1',
      'IsRetailerNameEncoded': '1',
      'deviceplatform': platform,
      'NewApp': 'true'
    };
    return reqMap;
  }
}

class RetailerRegistrationParams extends Params {
  Map<String, dynamic> postRequest;
  ImageUploadResponceEntity druglicenseEntity;

  RetailerRegistrationParams(this.postRequest, this.druglicenseEntity);
}
