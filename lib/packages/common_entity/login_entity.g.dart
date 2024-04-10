// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginEntity _$LoginEntityFromJson(Map<String, dynamic> json) => LoginEntity()
  ..userId = json['UserId'] as int?
  ..username = json['Username'] as String?
  ..password = json['Password']
  ..firstname = json['Firstname'] as String?
  ..lastname = json['Lastname'] as String?
  ..email = json['Email'] as String?
  ..mobileNumber = json['MobileNumber'] as String?
  ..telephone = json['Telephone'] as String?
  ..distributorId = json['DistributorId']
  ..distributorCode = json['DistributorCode'] as String?
  ..createdBy = json['CreatedBy'] as int?
  ..createdDate = json['CreatedDate'] as String?
  ..modifiedBy = json['ModifiedBy'] as int?
  ..modifiedDate = json['ModifiedDate'] as String?
  ..roles = (json['Roles'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..isDistributorPartyListCommon = json['IsDistributorPartyListCommon']
  ..checkBetaTesterRole = json['CheckBetaTesterRole'] as int?
  ..checkPartyCodeMandatory = json['CheckPartyCodeMandatory'] as bool?
  ..displayStores = json['DisplayStores']
  ..displayRetailers = (json['DisplayRetailers'] as List<dynamic>?)
      ?.map((e) =>
          LoginResponseDisplayRetailers.fromJson(e as Map<String, dynamic>))
      .toList()
  ..displayRetailerStoreParties =
      (json['DisplayRetailerStoreParties'] as List<dynamic>?)
          ?.map((e) => LoginResponseDisplayRetailerStoreParties.fromJson(
              e as Map<String, dynamic>))
          .toList()
  ..status = json['Status'] == null
      ? null
      : LoginResponseStatus.fromJson(json['Status'] as Map<String, dynamic>)
  ..displayFeedbackTypes = (json['DisplayFeedbackTypes'] as List<dynamic>?)
      ?.map((e) =>
          LoginResponseDisplayFeedbackTypes.fromJson(e as Map<String, dynamic>))
      .toList()
  ..displayImages = json['DisplayImages'] as List<dynamic>?
  ..useMaxCartValue = json['UseMaxCartValue'] as bool?
  ..maxCartValue = (json['MaxCartValue'] as num?)?.toDouble()
  ..useOldProductSearch = json['UseOldProductSearch'] as bool?
  ..showGSTINPopup = json['ShowGSTINPopup'] as bool?
  ..displayReferral = json['DisplayReferral'] == null
      ? null
      : LoginResponseDisplayReferral.fromJson(
          json['DisplayReferral'] as Map<String, dynamic>)
  ..displayCreditNoteStores =
      (json['DisplayCreditNoteStores'] as List<dynamic>?)
          ?.map((e) => LoginResponseDisplayCreditNoteStores.fromJson(
              e as Map<String, dynamic>))
          .toList()
  ..isShowDeliveryTracker = json['IsShowDeliveryTracker'] as bool?
  ..hyperTrack = json['HyperTrack'] == null
      ? null
      : LoginResponseHyperTrack.fromJson(
          json['HyperTrack'] as Map<String, dynamic>)
  ..isShowPaymentRequest = json['IsShowPaymentRequest'] as bool?
  ..enableEditablePTR = json['EnableEditablePTR'] as bool?
  ..isShowLogistics = json['IsShowLogistics'] as bool?
  ..isShowCoronaTracker = json['IsShowCoronaTracker'] as bool?
  ..stores = (json['Stores'] as List<dynamic>?)
      ?.map((e) => LoginResponseStores.fromJson(e as Map<String, dynamic>))
      .toList()
  ..isShowRequestedOrderTab = json['IsShowRequestedOrderTab'] as bool?
  ..isShowIFrameContent = json['IsShowIFrameContent'] as bool?
  ..iFrameContentURL = json['IFrameContentURL'] as String?
  ..isLoginOTPEnabled = json['IsLoginOTPEnabled'] as bool?
  ..isRegisterOTPEnabled = json['IsRegisterOTPEnabled'] as bool?
  ..displayAllStores = (json['DisplayAllStores'] as List<dynamic>?)
      ?.map((e) =>
          LoginResponseDisplayAllStores.fromJson(e as Map<String, dynamic>))
      .toList()
  ..isShowScheduledPayment = json['IsShowScheduledPayment'] as bool?
  ..isShowReward = json['IsShowReward'] as bool?
  ..isShowFulFillmentPartner = json['IsShowFulFillmentPartner'] as bool?
  ..isShowUnderMaintenanceScreen = json['isShowUnderMaintenanceScreen'] as bool?
  ..underMaintenanceScreenMessage =
      json['UnderMaintenanceScreenMessage'] as String?
  ..token = json['Token']
  ..isTokenGenarated = json['IsTokenGenarated'] as bool?
  ..retailerPaymentConfig = json['retailerPaymentConfig'] == null
      ? null
      : LoginResponseRetailerPaymentConfig.fromJson(
          json['retailerPaymentConfig'] as Map<String, dynamic>)
  ..useNewCartOrderFunctionality = json['UseNewCartOrderFunctionality'] as bool?
  ..flyyUserToken = json['FlyyUserToken'] as String?
  ..flyyDeviceId = json['FlyyDeviceId'] as String?;

Map<String, dynamic> _$LoginEntityToJson(LoginEntity instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'Username': instance.username,
      'Password': instance.password,
      'Firstname': instance.firstname,
      'Lastname': instance.lastname,
      'Email': instance.email,
      'MobileNumber': instance.mobileNumber,
      'Telephone': instance.telephone,
      'DistributorId': instance.distributorId,
      'DistributorCode': instance.distributorCode,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'ModifiedBy': instance.modifiedBy,
      'ModifiedDate': instance.modifiedDate,
      'Roles': instance.roles,
      'IsDistributorPartyListCommon': instance.isDistributorPartyListCommon,
      'CheckBetaTesterRole': instance.checkBetaTesterRole,
      'CheckPartyCodeMandatory': instance.checkPartyCodeMandatory,
      'DisplayStores': instance.displayStores,
      'DisplayRetailers': instance.displayRetailers,
      'DisplayRetailerStoreParties': instance.displayRetailerStoreParties,
      'Status': instance.status,
      'DisplayFeedbackTypes': instance.displayFeedbackTypes,
      'DisplayImages': instance.displayImages,
      'UseMaxCartValue': instance.useMaxCartValue,
      'MaxCartValue': instance.maxCartValue,
      'UseOldProductSearch': instance.useOldProductSearch,
      'ShowGSTINPopup': instance.showGSTINPopup,
      'DisplayReferral': instance.displayReferral,
      'DisplayCreditNoteStores': instance.displayCreditNoteStores,
      'IsShowDeliveryTracker': instance.isShowDeliveryTracker,
      'HyperTrack': instance.hyperTrack,
      'IsShowPaymentRequest': instance.isShowPaymentRequest,
      'EnableEditablePTR': instance.enableEditablePTR,
      'IsShowLogistics': instance.isShowLogistics,
      'IsShowCoronaTracker': instance.isShowCoronaTracker,
      'Stores': instance.stores,
      'IsShowRequestedOrderTab': instance.isShowRequestedOrderTab,
      'IsShowIFrameContent': instance.isShowIFrameContent,
      'IFrameContentURL': instance.iFrameContentURL,
      'IsLoginOTPEnabled': instance.isLoginOTPEnabled,
      'IsRegisterOTPEnabled': instance.isRegisterOTPEnabled,
      'DisplayAllStores': instance.displayAllStores,
      'IsShowScheduledPayment': instance.isShowScheduledPayment,
      'IsShowReward': instance.isShowReward,
      'IsShowFulFillmentPartner': instance.isShowFulFillmentPartner,
      'isShowUnderMaintenanceScreen': instance.isShowUnderMaintenanceScreen,
      'UnderMaintenanceScreenMessage': instance.underMaintenanceScreenMessage,
      'Token': instance.token,
      'IsTokenGenarated': instance.isTokenGenarated,
      'retailerPaymentConfig': instance.retailerPaymentConfig,
      'UseNewCartOrderFunctionality': instance.useNewCartOrderFunctionality,
      'FlyyUserToken': instance.flyyUserToken,
      'FlyyDeviceId': instance.flyyDeviceId,
    };

LoginResponseDisplayRetailers _$LoginResponseDisplayRetailersFromJson(
        Map<String, dynamic> json) =>
    LoginResponseDisplayRetailers()
      ..retailerId = json['RetailerId'] as int?
      ..retailerName = json['RetailerName'] as String?
      ..address1 = json['Address1'] as String?
      ..address2 = json['Address2'] as String?
      ..city = json['City'] as String?
      ..pincode = json['Pincode'] as int?
      ..telephone = json['Telephone'] as String?
      ..mobileNumber = json['MobileNumber'] as String?
      ..email = json['Email'] as String?
      ..regionId = json['RegionId'] as int?
      ..region = json['Region'] as String?
      ..stateId = json['StateId'] as int?
      ..stateName = json['StateName'] as String?
      ..cSTNumber = json['CSTNumber'] as String?
      ..licenseNumber = json['LicenseNumber'] as String?
      ..gSTINNumber = json['GSTINNumber'] as String?
      ..isGSTINApplied = json['IsGSTINApplied'] as bool?
      ..isGSTINAppliedDate = json['IsGSTINAppliedDate'] as String?
      ..merchantId = json['MerchantId']
      ..displayImages = (json['DisplayImages'] as List<dynamic>?)
          ?.map((e) => LoginResponseDisplayRetailersDisplayImages.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..isShowProductSearch = json['IsShowProductSearch'] as bool?
      ..showPayments = json['ShowPayments'] as bool?
      ..isGSTConfirmed = json['IsGSTConfirmed'] as bool?
      ..gSTConfirmationDate = json['GSTConfirmationDate'] as String?
      ..isShowPRStore = json['IsShowPRStore'] as bool?
      ..isShowDeliveryTracker = json['IsShowDeliveryTracker'] as bool?
      ..isShowPayLater = json['IsShowPayLater'] as bool?
      ..businessType = json['BusinessType'] as int?
      ..businessTypeName = json['BusinessTypeName'] as String?
      ..gSTINOption = json['GSTINOption'] as String?
      ..isShowOrderViaProductSearch =
          json['IsShowOrderViaProductSearch'] as bool?
      ..isShowOrderViaProductSearchPTR =
          json['IsShowOrderViaProductSearchPTR'] as bool?
      ..isShowOrderViaProductSearchScheme =
          json['IsShowOrderViaProductSearchScheme'] as bool?
      ..showUpdateProfilePopupHowManytimes =
          json['ShowUpdateProfilePopupHowManytimes'] as int?
      ..isShowInvoices = json['IsShowInvoices'] as bool?
      ..isShowLogistics = json['IsShowLogistics'] as bool?
      ..imagePath = json['ImagePath']
      ..contactPerson = json['ContactPerson']
      ..isShowReward = json['IsShowReward'] as bool?
      ..isShowFulFillmentPartner = json['IsShowFulFillmentPartner'] as bool?
      ..isShowAbbottCashback = json['IsShowAbbottCashback'] as bool?
      ..isShowCreateYourOwnStoreTab =
          json['IsShowCreateYourOwnStoreTab'] as bool?
      ..createOwnStore = json['CreateOwnStore'] as bool?
      ..isshowLoanTab = json['IsshowLoanTab'] as bool?
      ..isShowSpecialRates = json['IsShowSpecialRates'] as bool?
      ..isShowFreshChatToRetailers = json['IsShowFreshChatToRetailers'] as bool?
      ..isShowBestRates = json['IsShowBestRates'] as bool?
      ..userId = json['UserId'] as int?
      ..panNumber = json['PanNumber'] as String?
      ..referralCode = json['ReferralCode'] as String?
      ..isWhatsappConsentAgree = json['IsWhatsappConsentAgree'] as int?
      ..thirdDLNumber = json['ThirdDLNumber'] as String?
      ..secondDLNumber = json['SecondDLNumber'] as String?
      ..isShowDraftToCartMovePopUp = json['IsShowDraftToCartMovePopUp'] as bool?
      ..isActivateLearnAndEarn = json['IsActivateLearnAndEarn'] as bool?
      ..domainKey = json['DomainKey'] as String?
      ..secretKey = json['SecretKey'] as String?;

Map<String, dynamic> _$LoginResponseDisplayRetailersToJson(
        LoginResponseDisplayRetailers instance) =>
    <String, dynamic>{
      'RetailerId': instance.retailerId,
      'RetailerName': instance.retailerName,
      'Address1': instance.address1,
      'Address2': instance.address2,
      'City': instance.city,
      'Pincode': instance.pincode,
      'Telephone': instance.telephone,
      'MobileNumber': instance.mobileNumber,
      'Email': instance.email,
      'RegionId': instance.regionId,
      'Region': instance.region,
      'StateId': instance.stateId,
      'StateName': instance.stateName,
      'CSTNumber': instance.cSTNumber,
      'LicenseNumber': instance.licenseNumber,
      'GSTINNumber': instance.gSTINNumber,
      'IsGSTINApplied': instance.isGSTINApplied,
      'IsGSTINAppliedDate': instance.isGSTINAppliedDate,
      'MerchantId': instance.merchantId,
      'DisplayImages': instance.displayImages,
      'IsShowProductSearch': instance.isShowProductSearch,
      'ShowPayments': instance.showPayments,
      'IsGSTConfirmed': instance.isGSTConfirmed,
      'GSTConfirmationDate': instance.gSTConfirmationDate,
      'IsShowPRStore': instance.isShowPRStore,
      'IsShowDeliveryTracker': instance.isShowDeliveryTracker,
      'IsShowPayLater': instance.isShowPayLater,
      'BusinessType': instance.businessType,
      'BusinessTypeName': instance.businessTypeName,
      'GSTINOption': instance.gSTINOption,
      'IsShowOrderViaProductSearch': instance.isShowOrderViaProductSearch,
      'IsShowOrderViaProductSearchPTR': instance.isShowOrderViaProductSearchPTR,
      'IsShowOrderViaProductSearchScheme':
          instance.isShowOrderViaProductSearchScheme,
      'ShowUpdateProfilePopupHowManytimes':
          instance.showUpdateProfilePopupHowManytimes,
      'IsShowInvoices': instance.isShowInvoices,
      'IsShowLogistics': instance.isShowLogistics,
      'ImagePath': instance.imagePath,
      'ContactPerson': instance.contactPerson,
      'IsShowReward': instance.isShowReward,
      'IsShowFulFillmentPartner': instance.isShowFulFillmentPartner,
      'IsShowAbbottCashback': instance.isShowAbbottCashback,
      'IsShowCreateYourOwnStoreTab': instance.isShowCreateYourOwnStoreTab,
      'CreateOwnStore': instance.createOwnStore,
      'IsshowLoanTab': instance.isshowLoanTab,
      'IsShowSpecialRates': instance.isShowSpecialRates,
      'IsShowFreshChatToRetailers': instance.isShowFreshChatToRetailers,
      'IsShowBestRates': instance.isShowBestRates,
      'UserId': instance.userId,
      'PanNumber': instance.panNumber,
      'ReferralCode': instance.referralCode,
      'IsWhatsappConsentAgree': instance.isWhatsappConsentAgree,
      'ThirdDLNumber': instance.thirdDLNumber,
      'SecondDLNumber': instance.secondDLNumber,
      'IsShowDraftToCartMovePopUp': instance.isShowDraftToCartMovePopUp,
      'IsActivateLearnAndEarn': instance.isActivateLearnAndEarn,
      'DomainKey': instance.domainKey,
      'SecretKey': instance.secretKey,
    };

LoginResponseDisplayRetailersDisplayImages
    _$LoginResponseDisplayRetailersDisplayImagesFromJson(
            Map<String, dynamic> json) =>
        LoginResponseDisplayRetailersDisplayImages()
          ..retailerImageCreatedDate =
              json['RetailerImageCreatedDate'] as String?
          ..retailerImageRetailerId = json['RetailerImageRetailerId'] as int?
          ..retailerImageType = json['RetailerImageType'] as String?
          ..userImageCreatedDate = json['UserImageCreatedDate'] as String?
          ..userImageUserId = json['UserImageUserId'] as int?
          ..userImageType = json['UserImageType'];

Map<String, dynamic> _$LoginResponseDisplayRetailersDisplayImagesToJson(
        LoginResponseDisplayRetailersDisplayImages instance) =>
    <String, dynamic>{
      'RetailerImageCreatedDate': instance.retailerImageCreatedDate,
      'RetailerImageRetailerId': instance.retailerImageRetailerId,
      'RetailerImageType': instance.retailerImageType,
      'UserImageCreatedDate': instance.userImageCreatedDate,
      'UserImageUserId': instance.userImageUserId,
      'UserImageType': instance.userImageType,
    };

LoginResponseDisplayRetailerStoreParties
    _$LoginResponseDisplayRetailerStorePartiesFromJson(
            Map<String, dynamic> json) =>
        LoginResponseDisplayRetailerStoreParties()
          ..retailerStorePartyId = json['RetailerStorePartyId'] as int?
          ..storeId = json['StoreId'] as int?
          ..distributorId = json['DistributorId'] as int?
          ..storeName = json['StoreName'] as String?
          ..storeCode = json['StoreCode']
          ..stockVisibility = json['StockVisibility'] as int?
          ..minItemLimit = json['MinItemLimit'] as int?
          ..maxItemLimit = json['MaxItemLimit'] as int?
          ..minAmountLimit = (json['MinAmountLimit'] as num?)?.toDouble()
          ..maxAmountLimit = (json['MaxAmountLimit'] as num?)?.toDouble()
          ..storeGSTINNumber = json['StoreGSTINNumber'] as String?
          ..retailerId = json['RetailerId'] as int?
          ..partyName = json['PartyName'] as String?
          ..partyCode = json['PartyCode'] as String?
          ..displayPartyCode = json['DisplayPartyCode'] as String?
          ..retailerName = json['RetailerName']
          ..address1 = json['Address1']
          ..address2 = json['Address2']
          ..city = json['City']
          ..statename = json['Statename']
          ..pincode = json['Pincode']
          ..telephone = json['Telephone']
          ..mobileNumber = json['MobileNumber']
          ..email = json['Email']
          ..cSTNumber = json['CSTNumber']
          ..licenseNumber = json['LicenseNumber']
          ..gSTINNumber = json['GSTINNumber']
          ..contactPerson = json['ContactPerson']
          ..sPAddress1 = json['SPAddress1']
          ..sPAddress2 = json['SPAddress2']
          ..sPArea = json['SPArea']
          ..locked = json['Locked'] as bool?
          ..createdBy = json['CreatedBy'] as int?
          ..sPCity = json['SPCity']
          ..sPPincode = json['SPPincode']
          ..sPTelephone = json['SPTelephone']
          ..sPMobileNumber = json['SPMobileNumber']
          ..sPEmail = json['SPEmail']
          ..sPCSTNumber = json['SPCSTNumber']
          ..sPGSTINNumber = json['SPGSTINNumber']
          ..sPLicenseNumber = json['SPLicenseNumber']
          ..isLogisticsEnabled = json['IsLogisticsEnabled'] as bool?;

Map<String, dynamic> _$LoginResponseDisplayRetailerStorePartiesToJson(
        LoginResponseDisplayRetailerStoreParties instance) =>
    <String, dynamic>{
      'RetailerStorePartyId': instance.retailerStorePartyId,
      'StoreId': instance.storeId,
      'DistributorId': instance.distributorId,
      'StoreName': instance.storeName,
      'StoreCode': instance.storeCode,
      'StockVisibility': instance.stockVisibility,
      'MinItemLimit': instance.minItemLimit,
      'MaxItemLimit': instance.maxItemLimit,
      'MinAmountLimit': instance.minAmountLimit,
      'MaxAmountLimit': instance.maxAmountLimit,
      'StoreGSTINNumber': instance.storeGSTINNumber,
      'RetailerId': instance.retailerId,
      'PartyName': instance.partyName,
      'PartyCode': instance.partyCode,
      'DisplayPartyCode': instance.displayPartyCode,
      'RetailerName': instance.retailerName,
      'Address1': instance.address1,
      'Address2': instance.address2,
      'City': instance.city,
      'Statename': instance.statename,
      'Pincode': instance.pincode,
      'Telephone': instance.telephone,
      'MobileNumber': instance.mobileNumber,
      'Email': instance.email,
      'CSTNumber': instance.cSTNumber,
      'LicenseNumber': instance.licenseNumber,
      'GSTINNumber': instance.gSTINNumber,
      'ContactPerson': instance.contactPerson,
      'SPAddress1': instance.sPAddress1,
      'SPAddress2': instance.sPAddress2,
      'SPArea': instance.sPArea,
      'Locked': instance.locked,
      'CreatedBy': instance.createdBy,
      'SPCity': instance.sPCity,
      'SPPincode': instance.sPPincode,
      'SPTelephone': instance.sPTelephone,
      'SPMobileNumber': instance.sPMobileNumber,
      'SPEmail': instance.sPEmail,
      'SPCSTNumber': instance.sPCSTNumber,
      'SPGSTINNumber': instance.sPGSTINNumber,
      'SPLicenseNumber': instance.sPLicenseNumber,
      'IsLogisticsEnabled': instance.isLogisticsEnabled,
    };

LoginResponseStatus _$LoginResponseStatusFromJson(Map<String, dynamic> json) =>
    LoginResponseStatus()
      ..statusId = json['StatusId'] as int?
      ..statusMessage = json['StatusMessage'] as String?;

Map<String, dynamic> _$LoginResponseStatusToJson(
        LoginResponseStatus instance) =>
    <String, dynamic>{
      'StatusId': instance.statusId,
      'StatusMessage': instance.statusMessage,
    };

LoginResponseDisplayFeedbackTypes _$LoginResponseDisplayFeedbackTypesFromJson(
        Map<String, dynamic> json) =>
    LoginResponseDisplayFeedbackTypes()
      ..id = json['Id'] as int?
      ..types = json['Types'] as String?
      ..role = json['Role'] as String?
      ..showNextOption = json['ShowNextOption'] as bool?;

Map<String, dynamic> _$LoginResponseDisplayFeedbackTypesToJson(
        LoginResponseDisplayFeedbackTypes instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Types': instance.types,
      'Role': instance.role,
      'ShowNextOption': instance.showNextOption,
    };

LoginResponseDisplayReferral _$LoginResponseDisplayReferralFromJson(
        Map<String, dynamic> json) =>
    LoginResponseDisplayReferral()
      ..showReferral = json['ShowReferral'] as bool?
      ..referralText = json['ReferralText'] as String?;

Map<String, dynamic> _$LoginResponseDisplayReferralToJson(
        LoginResponseDisplayReferral instance) =>
    <String, dynamic>{
      'ShowReferral': instance.showReferral,
      'ReferralText': instance.referralText,
    };

LoginResponseDisplayCreditNoteStores
    _$LoginResponseDisplayCreditNoteStoresFromJson(Map<String, dynamic> json) =>
        LoginResponseDisplayCreditNoteStores()
          ..storeId = json['StoreId'] as int?
          ..distributorId = json['DistributorId'] as int?
          ..storeName = json['StoreName'] as String?
          ..storeCode = json['StoreCode'] as String?
          ..stockVisibility = json['StockVisibility']
          ..rShowSchemes = json['RShowSchemes']
          ..allowEditFreeQty = json['AllowEditFreeQty']
          ..groupStoreId = json['GroupStoreId'] as int?
          ..configuredSchemes = json['ConfiguredSchemes']
          ..isGroupWisePTR = json['IsGroupWisePTR'] as bool?
          ..isGroupWisePTRSalesman = json['IsGroupWisePTRSalesman'] as bool?
          ..isGroupWisePTRRetailer = json['IsGroupWisePTRRetailer'] as bool?
          ..isEnabledDeliveryTrackerOTP = json['IsEnabledDeliveryTrackerOTP']
          ..enableEditablePTR = json['EnableEditablePTR'] as bool?
          ..isLogisticsEnabled = json['IsLogisticsEnabled'] as bool?
          ..isShowUPICollection = json['IsShowUPICollection'] as bool?
          ..isShowPRStore = json['IsShowPRStore'] as bool?;

Map<String, dynamic> _$LoginResponseDisplayCreditNoteStoresToJson(
        LoginResponseDisplayCreditNoteStores instance) =>
    <String, dynamic>{
      'StoreId': instance.storeId,
      'DistributorId': instance.distributorId,
      'StoreName': instance.storeName,
      'StoreCode': instance.storeCode,
      'StockVisibility': instance.stockVisibility,
      'RShowSchemes': instance.rShowSchemes,
      'AllowEditFreeQty': instance.allowEditFreeQty,
      'GroupStoreId': instance.groupStoreId,
      'ConfiguredSchemes': instance.configuredSchemes,
      'IsGroupWisePTR': instance.isGroupWisePTR,
      'IsGroupWisePTRSalesman': instance.isGroupWisePTRSalesman,
      'IsGroupWisePTRRetailer': instance.isGroupWisePTRRetailer,
      'IsEnabledDeliveryTrackerOTP': instance.isEnabledDeliveryTrackerOTP,
      'EnableEditablePTR': instance.enableEditablePTR,
      'IsLogisticsEnabled': instance.isLogisticsEnabled,
      'IsShowUPICollection': instance.isShowUPICollection,
      'IsShowPRStore': instance.isShowPRStore,
    };

LoginResponseHyperTrack _$LoginResponseHyperTrackFromJson(
        Map<String, dynamic> json) =>
    LoginResponseHyperTrack()
      ..startTracking = json['StartTracking'] as bool?
      ..enableSalesmanTracking = json['EnableSalesmanTracking'] as bool?
      ..hyperTrackGroupToken = json['HyperTrackGroupToken'] as String?
      ..hyperTrackUserId = json['HyperTrackUserId'] as String?
      ..enableTaskAssignment = json['EnableTaskAssignment'] as bool?;

Map<String, dynamic> _$LoginResponseHyperTrackToJson(
        LoginResponseHyperTrack instance) =>
    <String, dynamic>{
      'StartTracking': instance.startTracking,
      'EnableSalesmanTracking': instance.enableSalesmanTracking,
      'HyperTrackGroupToken': instance.hyperTrackGroupToken,
      'HyperTrackUserId': instance.hyperTrackUserId,
      'EnableTaskAssignment': instance.enableTaskAssignment,
    };

LoginResponseStores _$LoginResponseStoresFromJson(Map<String, dynamic> json) =>
    LoginResponseStores()
      ..storeId = json['StoreId'] as int?
      ..distributorId = json['DistributorId'] as int?
      ..storeName = json['StoreName'] as String?
      ..storeCode = json['StoreCode'] as String?
      ..storeApiCode = json['StoreApiCode'] as String?
      ..companyId = json['CompanyId'] as String?
      ..branchId = json['BranchId']
      ..checkBranchDetails = json['CheckBranchDetails']
      ..apiId = json['ApiId'] as int?
      ..stockVisibility = json['StockVisibility'] as int?
      ..rStockVisibility = json['RStockVisibility'] as int?
      ..regionId = json['RegionId'] as int?
      ..groupStoreId = json['GroupStoreId'] as int?
      ..dateFormat = json['DateFormat'] as String?
      ..dateFormat2 = json['DateFormat2']
      ..shortCode = json['ShortCode'] as String?
      ..sCode = json['SCode'] as String?
      ..isPartyListNotCommon = json['IsPartyListNotCommon'] as int?
      ..editFreeQuantity = json['EditFreeQuantity'] as bool?
      ..status = json['Status'] as String?
      ..storeType = json['StoreType']
      ..storeSubType = json['StoreSubType']
      ..storeRemarks = json['StoreRemarks']
      ..storeScheduledate = json['StoreScheduledate']
      ..mappingNotRequired = json['MappingNotRequired'] as bool?
      ..universalAgreement = json['UniversalAgreement']
      ..createdBy = json['CreatedBy'] as int?
      ..createdDate = json['CreatedDate'] as String?
      ..modifiedBy = json['ModifiedBy'] as int?
      ..modifiedDate = json['ModifiedDate'] as String?
      ..orderFileFormatId = json['OrderFileFormatId']
      ..establishmentDate = json['EstablishmentDate']
      ..isMapped = json['IsMapped'] as int?
      ..retailerId = json['RetailerId'] as int?
      ..partyCode = json['PartyCode'] as String?
      ..partyName = json['PartyName'] as String?
      ..retailerName = json['RetailerName'] as String?
      ..address1 = json['Address1'] as String?
      ..address2 = json['Address2'] as String?
      ..city = json['City'] as String?
      ..statename = json['Statename'] as String?
      ..pincode = json['Pincode'] as int?
      ..telephone = json['Telephone']
      ..mobileNumber = json['MobileNumber'] as String?
      ..email = json['Email'] as String?
      ..cSTNumber = json['CSTNumber'] as String?
      ..licenseNumber = json['LicenseNumber'] as String?
      ..contactPerson = json['ContactPerson'] as String?
      ..gSTINNumber = json['GSTINNumber'] as String?
      ..sPAddress1 = json['SPAddress1'] as String?
      ..sPAddress2 = json['SPAddress2'] as String?
      ..area = json['Area'] as String?
      ..sPCity = json['SPCity'] as String?
      ..sPPincode = json['SPPincode'] as String?
      ..sPTelephone = json['SPTelephone'] as String?
      ..sPMobileNumber = json['SPMobileNumber'] as String?
      ..sPCSTNumber = json['SPCSTNumber'] as String?
      ..sPLicenseNumber = json['SPLicenseNumber'] as String?
      ..minItemLimit = json['MinItemLimit'] as int?
      ..maxItemLimit = json['MaxItemLimit'] as int?
      ..minAmountLimit = (json['MinAmountLimit'] as num?)?.toDouble()
      ..maxAmountLimit = (json['MaxAmountLimit'] as num?)?.toDouble()
      ..storeGSTINNumber = json['StoreGSTINNumber'] as String?
      ..orderDeliveryModeStatus = json['OrderDeliveryModeStatus'] as int?
      ..orderRemarks = json['OrderRemarks'] as int?
      ..displayHS = json['DisplayHS'] as bool?
      ..displayHSOn = json['DisplayHSOn']
      ..roundOffDisplayHS = json['RoundOffDisplayHS'] as bool?
      ..retailerSchemePreference = json['RetailerSchemePreference'] as int?
      ..retailerSchemePriority = json['RetailerSchemePriority'] as int?;

Map<String, dynamic> _$LoginResponseStoresToJson(
        LoginResponseStores instance) =>
    <String, dynamic>{
      'StoreId': instance.storeId,
      'DistributorId': instance.distributorId,
      'StoreName': instance.storeName,
      'StoreCode': instance.storeCode,
      'StoreApiCode': instance.storeApiCode,
      'CompanyId': instance.companyId,
      'BranchId': instance.branchId,
      'CheckBranchDetails': instance.checkBranchDetails,
      'ApiId': instance.apiId,
      'StockVisibility': instance.stockVisibility,
      'RStockVisibility': instance.rStockVisibility,
      'RegionId': instance.regionId,
      'GroupStoreId': instance.groupStoreId,
      'DateFormat': instance.dateFormat,
      'DateFormat2': instance.dateFormat2,
      'ShortCode': instance.shortCode,
      'SCode': instance.sCode,
      'IsPartyListNotCommon': instance.isPartyListNotCommon,
      'EditFreeQuantity': instance.editFreeQuantity,
      'Status': instance.status,
      'StoreType': instance.storeType,
      'StoreSubType': instance.storeSubType,
      'StoreRemarks': instance.storeRemarks,
      'StoreScheduledate': instance.storeScheduledate,
      'MappingNotRequired': instance.mappingNotRequired,
      'UniversalAgreement': instance.universalAgreement,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'ModifiedBy': instance.modifiedBy,
      'ModifiedDate': instance.modifiedDate,
      'OrderFileFormatId': instance.orderFileFormatId,
      'EstablishmentDate': instance.establishmentDate,
      'IsMapped': instance.isMapped,
      'RetailerId': instance.retailerId,
      'PartyCode': instance.partyCode,
      'PartyName': instance.partyName,
      'RetailerName': instance.retailerName,
      'Address1': instance.address1,
      'Address2': instance.address2,
      'City': instance.city,
      'Statename': instance.statename,
      'Pincode': instance.pincode,
      'Telephone': instance.telephone,
      'MobileNumber': instance.mobileNumber,
      'Email': instance.email,
      'CSTNumber': instance.cSTNumber,
      'LicenseNumber': instance.licenseNumber,
      'ContactPerson': instance.contactPerson,
      'GSTINNumber': instance.gSTINNumber,
      'SPAddress1': instance.sPAddress1,
      'SPAddress2': instance.sPAddress2,
      'Area': instance.area,
      'SPCity': instance.sPCity,
      'SPPincode': instance.sPPincode,
      'SPTelephone': instance.sPTelephone,
      'SPMobileNumber': instance.sPMobileNumber,
      'SPCSTNumber': instance.sPCSTNumber,
      'SPLicenseNumber': instance.sPLicenseNumber,
      'MinItemLimit': instance.minItemLimit,
      'MaxItemLimit': instance.maxItemLimit,
      'MinAmountLimit': instance.minAmountLimit,
      'MaxAmountLimit': instance.maxAmountLimit,
      'StoreGSTINNumber': instance.storeGSTINNumber,
      'OrderDeliveryModeStatus': instance.orderDeliveryModeStatus,
      'OrderRemarks': instance.orderRemarks,
      'DisplayHS': instance.displayHS,
      'DisplayHSOn': instance.displayHSOn,
      'RoundOffDisplayHS': instance.roundOffDisplayHS,
      'RetailerSchemePreference': instance.retailerSchemePreference,
      'RetailerSchemePriority': instance.retailerSchemePriority,
    };

LoginResponseDisplayAllStores _$LoginResponseDisplayAllStoresFromJson(
        Map<String, dynamic> json) =>
    LoginResponseDisplayAllStores()
      ..storeId = json['StoreId'] as int?
      ..distributorId = json['DistributorId'] as int?
      ..storeName = json['StoreName'] as String?
      ..storeCode = json['StoreCode'] as String?
      ..storeApiCode = json['StoreApiCode']
      ..companyId = json['CompanyId']
      ..branchId = json['BranchId']
      ..checkBranchDetails = json['CheckBranchDetails']
      ..apiId = json['ApiId'] as int?
      ..stockVisibility = json['StockVisibility'] as int?
      ..rStockVisibility = json['RStockVisibility'] as int?
      ..regionId = json['RegionId'] as int?
      ..groupStoreId = json['GroupStoreId'] as int?
      ..dateFormat = json['DateFormat']
      ..dateFormat2 = json['DateFormat2']
      ..shortCode = json['ShortCode']
      ..sCode = json['SCode'] as String?
      ..isPartyListNotCommon = json['IsPartyListNotCommon']
      ..editFreeQuantity = json['EditFreeQuantity'] as bool?
      ..status = json['Status'] as String?
      ..storeType = json['StoreType']
      ..storeSubType = json['StoreSubType']
      ..storeRemarks = json['StoreRemarks']
      ..storeScheduledate = json['StoreScheduledate']
      ..mappingNotRequired = json['MappingNotRequired']
      ..universalAgreement = json['UniversalAgreement']
      ..createdBy = json['CreatedBy'] as int?
      ..createdDate = json['CreatedDate'] as String?
      ..modifiedBy = json['ModifiedBy'] as int?
      ..modifiedDate = json['ModifiedDate'] as String?
      ..orderFileFormatId = json['OrderFileFormatId']
      ..establishmentDate = json['EstablishmentDate']
      ..isMapped = json['IsMapped'] as int?
      ..retailerId = json['RetailerId'] as int?
      ..partyCode = json['PartyCode'] as String?
      ..partyName = json['PartyName'] as String?
      ..retailerName = json['RetailerName'] as String?
      ..address1 = json['Address1'] as String?
      ..address2 = json['Address2'] as String?
      ..city = json['City'] as String?
      ..statename = json['Statename'] as String?
      ..pincode = json['Pincode'] as int?
      ..telephone = json['Telephone']
      ..mobileNumber = json['MobileNumber'] as String?
      ..email = json['Email'] as String?
      ..cSTNumber = json['CSTNumber'] as String?
      ..licenseNumber = json['LicenseNumber'] as String?
      ..contactPerson = json['ContactPerson'] as String?
      ..gSTINNumber = json['GSTINNumber'] as String?
      ..sPAddress1 = json['SPAddress1'] as String?
      ..sPAddress2 = json['SPAddress2'] as String?
      ..area = json['Area'] as String?
      ..sPCity = json['SPCity'] as String?
      ..sPPincode = json['SPPincode'] as String?
      ..sPTelephone = json['SPTelephone'] as String?
      ..sPMobileNumber = json['SPMobileNumber'] as String?
      ..sPCSTNumber = json['SPCSTNumber'] as String?
      ..sPLicenseNumber = json['SPLicenseNumber'] as String?
      ..minItemLimit = json['MinItemLimit'] as int?
      ..maxItemLimit = json['MaxItemLimit'] as int?
      ..minAmountLimit = (json['MinAmountLimit'] as num?)?.toDouble()
      ..maxAmountLimit = (json['MaxAmountLimit'] as num?)?.toDouble()
      ..storeGSTINNumber = json['StoreGSTINNumber'] as String?
      ..orderDeliveryModeStatus = json['OrderDeliveryModeStatus'] as int?
      ..orderRemarks = json['OrderRemarks'] as int?
      ..displayHS = json['DisplayHS'] as bool?
      ..displayHSOn = json['DisplayHSOn'] as String?
      ..roundOffDisplayHS = json['RoundOffDisplayHS'] as bool?
      ..retailerSchemePreference = json['RetailerSchemePreference'] as int?
      ..retailerSchemePriority = json['RetailerSchemePriority'] as int?;

Map<String, dynamic> _$LoginResponseDisplayAllStoresToJson(
        LoginResponseDisplayAllStores instance) =>
    <String, dynamic>{
      'StoreId': instance.storeId,
      'DistributorId': instance.distributorId,
      'StoreName': instance.storeName,
      'StoreCode': instance.storeCode,
      'StoreApiCode': instance.storeApiCode,
      'CompanyId': instance.companyId,
      'BranchId': instance.branchId,
      'CheckBranchDetails': instance.checkBranchDetails,
      'ApiId': instance.apiId,
      'StockVisibility': instance.stockVisibility,
      'RStockVisibility': instance.rStockVisibility,
      'RegionId': instance.regionId,
      'GroupStoreId': instance.groupStoreId,
      'DateFormat': instance.dateFormat,
      'DateFormat2': instance.dateFormat2,
      'ShortCode': instance.shortCode,
      'SCode': instance.sCode,
      'IsPartyListNotCommon': instance.isPartyListNotCommon,
      'EditFreeQuantity': instance.editFreeQuantity,
      'Status': instance.status,
      'StoreType': instance.storeType,
      'StoreSubType': instance.storeSubType,
      'StoreRemarks': instance.storeRemarks,
      'StoreScheduledate': instance.storeScheduledate,
      'MappingNotRequired': instance.mappingNotRequired,
      'UniversalAgreement': instance.universalAgreement,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'ModifiedBy': instance.modifiedBy,
      'ModifiedDate': instance.modifiedDate,
      'OrderFileFormatId': instance.orderFileFormatId,
      'EstablishmentDate': instance.establishmentDate,
      'IsMapped': instance.isMapped,
      'RetailerId': instance.retailerId,
      'PartyCode': instance.partyCode,
      'PartyName': instance.partyName,
      'RetailerName': instance.retailerName,
      'Address1': instance.address1,
      'Address2': instance.address2,
      'City': instance.city,
      'Statename': instance.statename,
      'Pincode': instance.pincode,
      'Telephone': instance.telephone,
      'MobileNumber': instance.mobileNumber,
      'Email': instance.email,
      'CSTNumber': instance.cSTNumber,
      'LicenseNumber': instance.licenseNumber,
      'ContactPerson': instance.contactPerson,
      'GSTINNumber': instance.gSTINNumber,
      'SPAddress1': instance.sPAddress1,
      'SPAddress2': instance.sPAddress2,
      'Area': instance.area,
      'SPCity': instance.sPCity,
      'SPPincode': instance.sPPincode,
      'SPTelephone': instance.sPTelephone,
      'SPMobileNumber': instance.sPMobileNumber,
      'SPCSTNumber': instance.sPCSTNumber,
      'SPLicenseNumber': instance.sPLicenseNumber,
      'MinItemLimit': instance.minItemLimit,
      'MaxItemLimit': instance.maxItemLimit,
      'MinAmountLimit': instance.minAmountLimit,
      'MaxAmountLimit': instance.maxAmountLimit,
      'StoreGSTINNumber': instance.storeGSTINNumber,
      'OrderDeliveryModeStatus': instance.orderDeliveryModeStatus,
      'OrderRemarks': instance.orderRemarks,
      'DisplayHS': instance.displayHS,
      'DisplayHSOn': instance.displayHSOn,
      'RoundOffDisplayHS': instance.roundOffDisplayHS,
      'RetailerSchemePreference': instance.retailerSchemePreference,
      'RetailerSchemePriority': instance.retailerSchemePriority,
    };

LoginResponseRetailerPaymentConfig _$LoginResponseRetailerPaymentConfigFromJson(
        Map<String, dynamic> json) =>
    LoginResponseRetailerPaymentConfig()
      ..retailerStorePaymentConfigId =
          json['RetailerStorePaymentConfigId'] as int?
      ..userId = json['UserId'] as int?
      ..bankAcNumber = json['BankAcNumber'] as String?
      ..bankAcName = json['BankAcName'] as String?
      ..bankName = json['BankName'] as String?
      ..iFSC = json['IFSC'] as String?
      ..createdBy = json['CreatedBy'] as int?
      ..createdDate = json['CreatedDate'] as String?
      ..modifiedBy = json['ModifiedBy'] as int?
      ..modifiedDate = json['ModifiedDate'] as String?
      ..isActive = json['IsActive'] as bool?
      ..accountType = json['AccountType'] as String?
      ..minAmount = json['MinAmount']
      ..maxAmount = json['MaxAmount']
      ..isBeneficiaryActive = json['IsBeneficiaryActive'] as bool?
      ..isBeneficiaryFreezed = json['IsBeneficiaryFreezed'] as int?
      ..beneficiaryId = json['BeneficiaryId']
      ..isCreditCardEnabled = json['IsCreditCardEnabled'] as bool?
      ..creditCardConvenienceFee = json['CreditCardConvenienceFee']
      ..creditCardConvenienceFeeValue = json['CreditCardConvenienceFeeValue']
      ..enabledCCAvenueCreditCardBanking =
          json['EnabledCCAvenueCreditCardBanking'] as bool?
      ..cCAvenueCreditCardKey = json['CCAvenueCreditCardKey']
      ..cCAvenueCreditCardVaues = json['CCAvenueCreditCardVaues']
      ..retailerName = json['RetailerName']
      ..enableIndiumCredit = json['EnableIndiumCredit'] as bool?
      ..bankAccountType = json['BankAccountType'] as String?
      ..uPIId = json['UPIId'] as String?
      ..isUPIVerified = json['IsUPIVerified'] as int?;

Map<String, dynamic> _$LoginResponseRetailerPaymentConfigToJson(
        LoginResponseRetailerPaymentConfig instance) =>
    <String, dynamic>{
      'RetailerStorePaymentConfigId': instance.retailerStorePaymentConfigId,
      'UserId': instance.userId,
      'BankAcNumber': instance.bankAcNumber,
      'BankAcName': instance.bankAcName,
      'BankName': instance.bankName,
      'IFSC': instance.iFSC,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'ModifiedBy': instance.modifiedBy,
      'ModifiedDate': instance.modifiedDate,
      'IsActive': instance.isActive,
      'AccountType': instance.accountType,
      'MinAmount': instance.minAmount,
      'MaxAmount': instance.maxAmount,
      'IsBeneficiaryActive': instance.isBeneficiaryActive,
      'IsBeneficiaryFreezed': instance.isBeneficiaryFreezed,
      'BeneficiaryId': instance.beneficiaryId,
      'IsCreditCardEnabled': instance.isCreditCardEnabled,
      'CreditCardConvenienceFee': instance.creditCardConvenienceFee,
      'CreditCardConvenienceFeeValue': instance.creditCardConvenienceFeeValue,
      'EnabledCCAvenueCreditCardBanking':
          instance.enabledCCAvenueCreditCardBanking,
      'CCAvenueCreditCardKey': instance.cCAvenueCreditCardKey,
      'CCAvenueCreditCardVaues': instance.cCAvenueCreditCardVaues,
      'RetailerName': instance.retailerName,
      'EnableIndiumCredit': instance.enableIndiumCredit,
      'BankAccountType': instance.bankAccountType,
      'UPIId': instance.uPIId,
      'IsUPIVerified': instance.isUPIVerified,
    };
