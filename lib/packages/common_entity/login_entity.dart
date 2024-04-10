import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'login_entity.g.dart';

@JsonSerializable()
class LoginEntity {
  @JsonKey(name: "UserId")
  int? userId;
  @JsonKey(name: "Username")
  String? username;
  @JsonKey(name: "Password")
  dynamic password;
  @JsonKey(name: "Firstname")
  String? firstname;
  @JsonKey(name: "Lastname")
  String? lastname;
  @JsonKey(name: "Email")
  String? email;
  @JsonKey(name: "MobileNumber")
  String? mobileNumber;
  @JsonKey(name: "Telephone")
  String? telephone;
  @JsonKey(name: "DistributorId")
  dynamic distributorId;
  @JsonKey(name: "DistributorCode")
  String? distributorCode;
  @JsonKey(name: "CreatedBy")
  int? createdBy;
  @JsonKey(name: "CreatedDate")
  String? createdDate;
  @JsonKey(name: "ModifiedBy")
  int? modifiedBy;
  @JsonKey(name: "ModifiedDate")
  String? modifiedDate;
  @JsonKey(name: "Roles")
  List<String>? roles;
  @JsonKey(name: "IsDistributorPartyListCommon")
  dynamic isDistributorPartyListCommon;
  @JsonKey(name: "CheckBetaTesterRole")
  int? checkBetaTesterRole;
  @JsonKey(name: "CheckPartyCodeMandatory")
  bool? checkPartyCodeMandatory;
  @JsonKey(name: "DisplayStores")
  dynamic displayStores;
  @JsonKey(name: "DisplayRetailers")
  List<LoginResponseDisplayRetailers>? displayRetailers;
  @JsonKey(name: "DisplayRetailerStoreParties")
  List<LoginResponseDisplayRetailerStoreParties>? displayRetailerStoreParties;
  @JsonKey(name: "Status")
  LoginResponseStatus? status;
  @JsonKey(name: "DisplayFeedbackTypes")
  List<LoginResponseDisplayFeedbackTypes>? displayFeedbackTypes;
  @JsonKey(name: "DisplayImages")
  List<dynamic>? displayImages;
  @JsonKey(name: "UseMaxCartValue")
  bool? useMaxCartValue;
  @JsonKey(name: "MaxCartValue")
  double? maxCartValue;
  @JsonKey(name: "UseOldProductSearch")
  bool? useOldProductSearch;
  @JsonKey(name: "ShowGSTINPopup")
  bool? showGSTINPopup;
  @JsonKey(name: "DisplayReferral")
  LoginResponseDisplayReferral? displayReferral;
  @JsonKey(name: "DisplayCreditNoteStores")
  List<LoginResponseDisplayCreditNoteStores>? displayCreditNoteStores;
  @JsonKey(name: "IsShowDeliveryTracker")
  bool? isShowDeliveryTracker;
  @JsonKey(name: "HyperTrack")
  LoginResponseHyperTrack? hyperTrack;
  @JsonKey(name: "IsShowPaymentRequest")
  bool? isShowPaymentRequest;
  @JsonKey(name: "EnableEditablePTR")
  bool? enableEditablePTR;
  @JsonKey(name: "IsShowLogistics")
  bool? isShowLogistics;
  @JsonKey(name: "IsShowCoronaTracker")
  bool? isShowCoronaTracker;
  @JsonKey(name: "Stores")
  List<LoginResponseStores>? stores;
  @JsonKey(name: "IsShowRequestedOrderTab")
  bool? isShowRequestedOrderTab;
  @JsonKey(name: "IsShowIFrameContent")
  bool? isShowIFrameContent;
  @JsonKey(name: "IFrameContentURL")
  String? iFrameContentURL;
  @JsonKey(name: "IsLoginOTPEnabled")
  bool? isLoginOTPEnabled;
  @JsonKey(name: "IsRegisterOTPEnabled")
  bool? isRegisterOTPEnabled;
  @JsonKey(name: "DisplayAllStores")
  List<LoginResponseDisplayAllStores>? displayAllStores;
  @JsonKey(name: "IsShowScheduledPayment")
  bool? isShowScheduledPayment;
  @JsonKey(name: "IsShowReward")
  bool? isShowReward;
  @JsonKey(name: "IsShowFulFillmentPartner")
  bool? isShowFulFillmentPartner;
  bool? isShowUnderMaintenanceScreen;
  @JsonKey(name: "UnderMaintenanceScreenMessage")
  String? underMaintenanceScreenMessage;
  @JsonKey(name: "Token")
  dynamic token;
  @JsonKey(name: "IsTokenGenarated")
  bool? isTokenGenarated;
  LoginResponseRetailerPaymentConfig? retailerPaymentConfig;
  @JsonKey(name: "UseNewCartOrderFunctionality")
  bool? useNewCartOrderFunctionality;
  @JsonKey(name: "FlyyUserToken")
  String? flyyUserToken;
  @JsonKey(name: "FlyyDeviceId")
  String? flyyDeviceId;

  LoginEntity();

  factory LoginEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoginEntityToJson(this);

  LoginEntity copyWith(
      {int? userId,
      String? username,
      dynamic password,
      String? firstname,
      String? lastname,
      String? email,
      String? mobileNumber,
      String? telephone,
      dynamic distributorId,
      String? distributorCode,
      int? createdBy,
      String? createdDate,
      int? modifiedBy,
      String? modifiedDate,
      List<String>? roles,
      dynamic isDistributorPartyListCommon,
      int? checkBetaTesterRole,
      bool? checkPartyCodeMandatory,
      dynamic displayStores,
      List<LoginResponseDisplayRetailers>? displayRetailers,
      List<LoginResponseDisplayRetailerStoreParties>?
          displayRetailerStoreParties,
      LoginResponseStatus? status,
      List<LoginResponseDisplayFeedbackTypes>? displayFeedbackTypes,
      List<dynamic>? displayImages,
      bool? useMaxCartValue,
      double? maxCartValue,
      bool? useOldProductSearch,
      bool? showGSTINPopup,
      LoginResponseDisplayReferral? displayReferral,
      List<LoginResponseDisplayCreditNoteStores>? displayCreditNoteStores,
      bool? isShowDeliveryTracker,
      LoginResponseHyperTrack? hyperTrack,
      bool? isShowPaymentRequest,
      bool? enableEditablePTR,
      bool? isShowLogistics,
      bool? isShowCoronaTracker,
      List<LoginResponseStores>? stores,
      bool? isShowRequestedOrderTab,
      bool? isShowIFrameContent,
      String? iFrameContentURL,
      bool? isLoginOTPEnabled,
      bool? isRegisterOTPEnabled,
      List<LoginResponseDisplayAllStores>? displayAllStores,
      bool? isShowScheduledPayment,
      bool? isShowReward,
      bool? isShowFulFillmentPartner,
      bool? isShowUnderMaintenanceScreen,
      String? underMaintenanceScreenMessage,
      dynamic token,
      bool? isTokenGenarated,
      LoginResponseRetailerPaymentConfig? retailerPaymentConfig,
      bool? useNewCartOrderFunctionality,
      String? flyyUserToken,
      String? flyyDeviceId}) {
    return LoginEntity()
      ..userId = userId ?? this.userId
      ..username = username ?? this.username
      ..password = password ?? this.password
      ..firstname = firstname ?? this.firstname
      ..lastname = lastname ?? this.lastname
      ..email = email ?? this.email
      ..mobileNumber = mobileNumber ?? this.mobileNumber
      ..telephone = telephone ?? this.telephone
      ..distributorId = distributorId ?? this.distributorId
      ..distributorCode = distributorCode ?? this.distributorCode
      ..createdBy = createdBy ?? this.createdBy
      ..createdDate = createdDate ?? this.createdDate
      ..modifiedBy = modifiedBy ?? this.modifiedBy
      ..modifiedDate = modifiedDate ?? this.modifiedDate
      ..roles = roles ?? this.roles
      ..isDistributorPartyListCommon =
          isDistributorPartyListCommon ?? this.isDistributorPartyListCommon
      ..checkBetaTesterRole = checkBetaTesterRole ?? this.checkBetaTesterRole
      ..checkPartyCodeMandatory =
          checkPartyCodeMandatory ?? this.checkPartyCodeMandatory
      ..displayStores = displayStores ?? this.displayStores
      ..displayRetailers = displayRetailers ?? this.displayRetailers
      ..displayRetailerStoreParties =
          displayRetailerStoreParties ?? this.displayRetailerStoreParties
      ..status = status ?? this.status
      ..displayFeedbackTypes = displayFeedbackTypes ?? this.displayFeedbackTypes
      ..displayImages = displayImages ?? this.displayImages
      ..useMaxCartValue = useMaxCartValue ?? this.useMaxCartValue
      ..maxCartValue = maxCartValue ?? this.maxCartValue
      ..useOldProductSearch = useOldProductSearch ?? this.useOldProductSearch
      ..showGSTINPopup = showGSTINPopup ?? this.showGSTINPopup
      ..displayReferral = displayReferral ?? this.displayReferral
      ..displayCreditNoteStores =
          displayCreditNoteStores ?? this.displayCreditNoteStores
      ..isShowDeliveryTracker =
          isShowDeliveryTracker ?? this.isShowDeliveryTracker
      ..hyperTrack = hyperTrack ?? this.hyperTrack
      ..isShowPaymentRequest = isShowPaymentRequest ?? this.isShowPaymentRequest
      ..enableEditablePTR = enableEditablePTR ?? this.enableEditablePTR
      ..isShowLogistics = isShowLogistics ?? this.isShowLogistics
      ..isShowCoronaTracker = isShowCoronaTracker ?? this.isShowCoronaTracker
      ..stores = stores ?? this.stores
      ..isShowRequestedOrderTab =
          isShowRequestedOrderTab ?? this.isShowRequestedOrderTab
      ..isShowIFrameContent = isShowIFrameContent ?? this.isShowIFrameContent
      ..iFrameContentURL = iFrameContentURL ?? this.iFrameContentURL
      ..isLoginOTPEnabled = isLoginOTPEnabled ?? this.isLoginOTPEnabled
      ..isRegisterOTPEnabled = isRegisterOTPEnabled ?? this.isRegisterOTPEnabled
      ..displayAllStores = displayAllStores ?? this.displayAllStores
      ..isShowScheduledPayment =
          isShowScheduledPayment ?? this.isShowScheduledPayment
      ..isShowReward = isShowReward ?? this.isShowReward
      ..isShowFulFillmentPartner =
          isShowFulFillmentPartner ?? this.isShowFulFillmentPartner
      ..isShowUnderMaintenanceScreen =
          isShowUnderMaintenanceScreen ?? this.isShowUnderMaintenanceScreen
      ..underMaintenanceScreenMessage =
          underMaintenanceScreenMessage ?? this.underMaintenanceScreenMessage
      ..isTokenGenarated = isTokenGenarated ?? this.isTokenGenarated
      ..retailerPaymentConfig =
          retailerPaymentConfig ?? this.retailerPaymentConfig
      ..useNewCartOrderFunctionality =
          useNewCartOrderFunctionality ?? this.useNewCartOrderFunctionality
      ..flyyUserToken = flyyUserToken ?? this.flyyUserToken
      ..flyyDeviceId = flyyDeviceId ?? this.flyyDeviceId;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }

  static String serialize(LoginEntity loginEntity) =>
      json.encode(loginEntity.toJson());

  static LoginEntity deserialize(String json) =>
      LoginEntity.fromJson(jsonDecode(json));
}

@JsonSerializable()
class LoginResponseDisplayRetailers {
  @JsonKey(name: "RetailerId")
  int? retailerId;
  @JsonKey(name: "RetailerName")
  String? retailerName;
  @JsonKey(name: "Address1")
  String? address1;
  @JsonKey(name: "Address2")
  String? address2;
  @JsonKey(name: "City")
  String? city;
  @JsonKey(name: "Pincode")
  int? pincode;
  @JsonKey(name: "Telephone")
  String? telephone;
  @JsonKey(name: "MobileNumber")
  String? mobileNumber;
  @JsonKey(name: "Email")
  String? email;
  @JsonKey(name: "RegionId")
  int? regionId;
  @JsonKey(name: "Region")
  String? region;
  @JsonKey(name: "StateId")
  int? stateId;
  @JsonKey(name: "StateName")
  String? stateName;
  @JsonKey(name: "CSTNumber")
  String? cSTNumber;
  @JsonKey(name: "LicenseNumber")
  String? licenseNumber;
  @JsonKey(name: "GSTINNumber")
  String? gSTINNumber;
  @JsonKey(name: "IsGSTINApplied")
  bool? isGSTINApplied;
  @JsonKey(name: "IsGSTINAppliedDate")
  String? isGSTINAppliedDate;
  @JsonKey(name: "MerchantId")
  dynamic merchantId;
  @JsonKey(name: "DisplayImages")
  List<LoginResponseDisplayRetailersDisplayImages>? displayImages;
  @JsonKey(name: "IsShowProductSearch")
  bool? isShowProductSearch;
  @JsonKey(name: "ShowPayments")
  bool? showPayments;
  @JsonKey(name: "IsGSTConfirmed")
  bool? isGSTConfirmed;
  @JsonKey(name: "GSTConfirmationDate")
  String? gSTConfirmationDate;
  @JsonKey(name: "IsShowPRStore")
  bool? isShowPRStore;
  @JsonKey(name: "IsShowDeliveryTracker")
  bool? isShowDeliveryTracker;
  @JsonKey(name: "IsShowPayLater")
  bool? isShowPayLater;
  @JsonKey(name: "BusinessType")
  int? businessType;
  @JsonKey(name: "BusinessTypeName")
  String? businessTypeName;
  @JsonKey(name: "GSTINOption")
  String? gSTINOption;
  @JsonKey(name: "IsShowOrderViaProductSearch")
  bool? isShowOrderViaProductSearch;
  @JsonKey(name: "IsShowOrderViaProductSearchPTR")
  bool? isShowOrderViaProductSearchPTR;
  @JsonKey(name: "IsShowOrderViaProductSearchScheme")
  bool? isShowOrderViaProductSearchScheme;
  @JsonKey(name: "ShowUpdateProfilePopupHowManytimes")
  int? showUpdateProfilePopupHowManytimes;
  @JsonKey(name: "IsShowInvoices")
  bool? isShowInvoices;
  @JsonKey(name: "IsShowLogistics")
  bool? isShowLogistics;
  @JsonKey(name: "ImagePath")
  dynamic imagePath;
  @JsonKey(name: "ContactPerson")
  dynamic contactPerson;
  @JsonKey(name: "IsShowReward")
  bool? isShowReward;
  @JsonKey(name: "IsShowFulFillmentPartner")
  bool? isShowFulFillmentPartner;
  @JsonKey(name: "IsShowAbbottCashback")
  bool? isShowAbbottCashback;
  @JsonKey(name: "IsShowCreateYourOwnStoreTab")
  bool? isShowCreateYourOwnStoreTab;
  @JsonKey(name: "CreateOwnStore")
  bool? createOwnStore;
  @JsonKey(name: "IsshowLoanTab")
  bool? isshowLoanTab;
  @JsonKey(name: "IsShowSpecialRates")
  bool? isShowSpecialRates;
  @JsonKey(name: "IsShowFreshChatToRetailers")
  bool? isShowFreshChatToRetailers;
  @JsonKey(name: "IsShowBestRates")
  bool? isShowBestRates;
  @JsonKey(name: "UserId")
  int? userId;
  @JsonKey(name: "PanNumber")
  String? panNumber;
  @JsonKey(name: "ReferralCode")
  String? referralCode;
  @JsonKey(name: "IsWhatsappConsentAgree")
  int? isWhatsappConsentAgree;
  @JsonKey(name: "ThirdDLNumber")
  String? thirdDLNumber;
  @JsonKey(name: "SecondDLNumber")
  String? secondDLNumber;
  @JsonKey(name: "IsShowDraftToCartMovePopUp")
  bool? isShowDraftToCartMovePopUp;
  @JsonKey(name: "IsActivateLearnAndEarn")
  bool? isActivateLearnAndEarn;
  @JsonKey(name: "DomainKey")
  String? domainKey;
  @JsonKey(name: "SecretKey")
  String? secretKey;

  LoginResponseDisplayRetailers();

  factory LoginResponseDisplayRetailers.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDisplayRetailersFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDisplayRetailersToJson(this);

  LoginResponseDisplayRetailers copyWith(
      {int? retailerId,
      String? retailerName,
      String? address1,
      String? address2,
      String? city,
      int? pincode,
      String? telephone,
      String? mobileNumber,
      String? email,
      int? regionId,
      String? region,
      int? stateId,
      String? stateName,
      String? cSTNumber,
      String? licenseNumber,
      String? gSTINNumber,
      bool? isGSTINApplied,
      String? isGSTINAppliedDate,
      dynamic merchantId,
      List<LoginResponseDisplayRetailersDisplayImages>? displayImages,
      bool? isShowProductSearch,
      bool? showPayments,
      bool? isGSTConfirmed,
      String? gSTConfirmationDate,
      bool? isShowPRStore,
      bool? isShowDeliveryTracker,
      bool? isShowPayLater,
      int? businessType,
      String? businessTypeName,
      String? gSTINOption,
      bool? isShowOrderViaProductSearch,
      bool? isShowOrderViaProductSearchPTR,
      bool? isShowOrderViaProductSearchScheme,
      int? showUpdateProfilePopupHowManytimes,
      bool? isShowInvoices,
      bool? isShowLogistics,
      dynamic imagePath,
      dynamic contactPerson,
      bool? isShowReward,
      bool? isShowFulFillmentPartner,
      bool? isShowAbbottCashback,
      bool? isShowCreateYourOwnStoreTab,
      bool? createOwnStore,
      bool? isshowLoanTab,
      bool? isShowSpecialRates,
      bool? isShowFreshChatToRetailers,
      bool? isShowBestRates,
      int? userId,
      String? panNumber,
      String? referralCode,
      int? isWhatsappConsentAgree,
      String? thirdDLNumber,
      String? secondDLNumber,
      bool? isShowDraftToCartMovePopUp,
      bool? isActivateLearnAndEarn,
      String? domainKey,
      String? secretKey}) {
    return LoginResponseDisplayRetailers()
      ..retailerId = retailerId ?? this.retailerId
      ..retailerName = retailerName ?? this.retailerName
      ..address1 = address1 ?? this.address1
      ..address2 = address2 ?? this.address2
      ..city = city ?? this.city
      ..pincode = pincode ?? this.pincode
      ..telephone = telephone ?? this.telephone
      ..mobileNumber = mobileNumber ?? this.mobileNumber
      ..email = email ?? this.email
      ..regionId = regionId ?? this.regionId
      ..region = region ?? this.region
      ..stateId = stateId ?? this.stateId
      ..stateName = stateName ?? this.stateName
      ..cSTNumber = cSTNumber ?? this.cSTNumber
      ..licenseNumber = licenseNumber ?? this.licenseNumber
      ..gSTINNumber = gSTINNumber ?? this.gSTINNumber
      ..isGSTINApplied = isGSTINApplied ?? this.isGSTINApplied
      ..isGSTINAppliedDate = isGSTINAppliedDate ?? this.isGSTINAppliedDate
      ..merchantId = merchantId ?? this.merchantId
      ..displayImages = displayImages ?? this.displayImages
      ..isShowProductSearch = isShowProductSearch ?? this.isShowProductSearch
      ..showPayments = showPayments ?? this.showPayments
      ..isGSTConfirmed = isGSTConfirmed ?? this.isGSTConfirmed
      ..gSTConfirmationDate = gSTConfirmationDate ?? this.gSTConfirmationDate
      ..isShowPRStore = isShowPRStore ?? this.isShowPRStore
      ..isShowDeliveryTracker =
          isShowDeliveryTracker ?? this.isShowDeliveryTracker
      ..isShowPayLater = isShowPayLater ?? this.isShowPayLater
      ..businessType = businessType ?? this.businessType
      ..businessTypeName = businessTypeName ?? this.businessTypeName
      ..gSTINOption = gSTINOption ?? this.gSTINOption
      ..isShowOrderViaProductSearch =
          isShowOrderViaProductSearch ?? this.isShowOrderViaProductSearch
      ..isShowOrderViaProductSearchPTR =
          isShowOrderViaProductSearchPTR ?? this.isShowOrderViaProductSearchPTR
      ..isShowOrderViaProductSearchScheme = isShowOrderViaProductSearchScheme ??
          this.isShowOrderViaProductSearchScheme
      ..showUpdateProfilePopupHowManytimes =
          showUpdateProfilePopupHowManytimes ??
              this.showUpdateProfilePopupHowManytimes
      ..isShowInvoices = isShowInvoices ?? this.isShowInvoices
      ..isShowLogistics = isShowLogistics ?? this.isShowLogistics
      ..imagePath = imagePath ?? this.imagePath
      ..contactPerson = contactPerson ?? this.contactPerson
      ..isShowReward = isShowReward ?? this.isShowReward
      ..isShowFulFillmentPartner =
          isShowFulFillmentPartner ?? this.isShowFulFillmentPartner
      ..isShowAbbottCashback = isShowAbbottCashback ?? this.isShowAbbottCashback
      ..isShowCreateYourOwnStoreTab =
          isShowCreateYourOwnStoreTab ?? this.isShowCreateYourOwnStoreTab
      ..createOwnStore = createOwnStore ?? this.createOwnStore
      ..isshowLoanTab = isshowLoanTab ?? this.isshowLoanTab
      ..isShowSpecialRates = isShowSpecialRates ?? this.isShowSpecialRates
      ..isShowFreshChatToRetailers =
          isShowFreshChatToRetailers ?? this.isShowFreshChatToRetailers
      ..isShowBestRates = isShowBestRates ?? this.isShowBestRates
      ..userId = userId ?? this.userId
      ..panNumber = panNumber ?? this.panNumber
      ..referralCode = referralCode ?? this.referralCode
      ..isWhatsappConsentAgree =
          isWhatsappConsentAgree ?? this.isWhatsappConsentAgree
      ..thirdDLNumber = thirdDLNumber ?? this.thirdDLNumber
      ..secondDLNumber = secondDLNumber ?? this.secondDLNumber
      ..isShowDraftToCartMovePopUp =
          isShowDraftToCartMovePopUp ?? this.isShowDraftToCartMovePopUp
      ..isActivateLearnAndEarn =
          isActivateLearnAndEarn ?? this.isActivateLearnAndEarn
      ..domainKey = domainKey ?? this.domainKey
      ..secretKey = secretKey ?? this.secretKey;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginResponseDisplayRetailersDisplayImages {
  @JsonKey(name: "RetailerImageCreatedDate")
  String? retailerImageCreatedDate;
  @JsonKey(name: "RetailerImageRetailerId")
  int? retailerImageRetailerId;
  @JsonKey(name: "RetailerImageType")
  String? retailerImageType;
  @JsonKey(name: "UserImageCreatedDate")
  String? userImageCreatedDate;
  @JsonKey(name: "UserImageUserId")
  int? userImageUserId;
  @JsonKey(name: "UserImageType")
  dynamic userImageType;

  LoginResponseDisplayRetailersDisplayImages();

  factory LoginResponseDisplayRetailersDisplayImages.fromJson(
          Map<String, dynamic> json) =>
      _$LoginResponseDisplayRetailersDisplayImagesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginResponseDisplayRetailersDisplayImagesToJson(this);

  LoginResponseDisplayRetailersDisplayImages copyWith(
      {String? retailerImageCreatedDate,
      int? retailerImageRetailerId,
      String? retailerImageType,
      String? userImageCreatedDate,
      int? userImageUserId,
      dynamic userImageType}) {
    return LoginResponseDisplayRetailersDisplayImages()
      ..retailerImageCreatedDate =
          retailerImageCreatedDate ?? this.retailerImageCreatedDate
      ..retailerImageRetailerId =
          retailerImageRetailerId ?? this.retailerImageRetailerId
      ..retailerImageType = retailerImageType ?? this.retailerImageType
      ..userImageCreatedDate = userImageCreatedDate ?? this.userImageCreatedDate
      ..userImageUserId = userImageUserId ?? this.userImageUserId
      ..userImageType = userImageType ?? this.userImageType;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginResponseDisplayRetailerStoreParties {
  @JsonKey(name: "RetailerStorePartyId")
  int? retailerStorePartyId;
  @JsonKey(name: "StoreId")
  int? storeId;
  @JsonKey(name: "DistributorId")
  int? distributorId;
  @JsonKey(name: "StoreName")
  String? storeName;
  @JsonKey(name: "StoreCode")
  dynamic storeCode;
  @JsonKey(name: "StockVisibility")
  int? stockVisibility;
  @JsonKey(name: "MinItemLimit")
  int? minItemLimit;
  @JsonKey(name: "MaxItemLimit")
  int? maxItemLimit;
  @JsonKey(name: "MinAmountLimit")
  double? minAmountLimit;
  @JsonKey(name: "MaxAmountLimit")
  double? maxAmountLimit;
  @JsonKey(name: "StoreGSTINNumber")
  String? storeGSTINNumber;
  @JsonKey(name: "RetailerId")
  int? retailerId;
  @JsonKey(name: "PartyName")
  String? partyName;
  @JsonKey(name: "PartyCode")
  String? partyCode;
  @JsonKey(name: "DisplayPartyCode")
  String? displayPartyCode;
  @JsonKey(name: "RetailerName")
  dynamic retailerName;
  @JsonKey(name: "Address1")
  dynamic address1;
  @JsonKey(name: "Address2")
  dynamic address2;
  @JsonKey(name: "City")
  dynamic city;
  @JsonKey(name: "Statename")
  dynamic statename;
  @JsonKey(name: "Pincode")
  dynamic pincode;
  @JsonKey(name: "Telephone")
  dynamic telephone;
  @JsonKey(name: "MobileNumber")
  dynamic mobileNumber;
  @JsonKey(name: "Email")
  dynamic email;
  @JsonKey(name: "CSTNumber")
  dynamic cSTNumber;
  @JsonKey(name: "LicenseNumber")
  dynamic licenseNumber;
  @JsonKey(name: "GSTINNumber")
  dynamic gSTINNumber;
  @JsonKey(name: "ContactPerson")
  dynamic contactPerson;
  @JsonKey(name: "SPAddress1")
  dynamic sPAddress1;
  @JsonKey(name: "SPAddress2")
  dynamic sPAddress2;
  @JsonKey(name: "SPArea")
  dynamic sPArea;
  @JsonKey(name: "Locked")
  bool? locked;
  @JsonKey(name: "CreatedBy")
  int? createdBy;
  @JsonKey(name: "SPCity")
  dynamic sPCity;
  @JsonKey(name: "SPPincode")
  dynamic sPPincode;
  @JsonKey(name: "SPTelephone")
  dynamic sPTelephone;
  @JsonKey(name: "SPMobileNumber")
  dynamic sPMobileNumber;
  @JsonKey(name: "SPEmail")
  dynamic sPEmail;
  @JsonKey(name: "SPCSTNumber")
  dynamic sPCSTNumber;
  @JsonKey(name: "SPGSTINNumber")
  dynamic sPGSTINNumber;
  @JsonKey(name: "SPLicenseNumber")
  dynamic sPLicenseNumber;
  @JsonKey(name: "IsLogisticsEnabled")
  bool? isLogisticsEnabled;

  LoginResponseDisplayRetailerStoreParties();

  factory LoginResponseDisplayRetailerStoreParties.fromJson(
          Map<String, dynamic> json) =>
      _$LoginResponseDisplayRetailerStorePartiesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginResponseDisplayRetailerStorePartiesToJson(this);

  LoginResponseDisplayRetailerStoreParties copyWith(
      {int? retailerStorePartyId,
      int? storeId,
      int? distributorId,
      String? storeName,
      dynamic storeCode,
      int? stockVisibility,
      int? minItemLimit,
      int? maxItemLimit,
      double? minAmountLimit,
      double? maxAmountLimit,
      String? storeGSTINNumber,
      int? retailerId,
      String? partyName,
      String? partyCode,
      String? displayPartyCode,
      dynamic retailerName,
      dynamic address1,
      dynamic address2,
      dynamic city,
      dynamic statename,
      dynamic pincode,
      dynamic telephone,
      dynamic mobileNumber,
      dynamic email,
      dynamic cSTNumber,
      dynamic licenseNumber,
      dynamic gSTINNumber,
      dynamic contactPerson,
      dynamic sPAddress1,
      dynamic sPAddress2,
      dynamic sPArea,
      bool? locked,
      int? createdBy,
      dynamic sPCity,
      dynamic sPPincode,
      dynamic sPTelephone,
      dynamic sPMobileNumber,
      dynamic sPEmail,
      dynamic sPCSTNumber,
      dynamic sPGSTINNumber,
      dynamic sPLicenseNumber,
      bool? isLogisticsEnabled}) {
    return LoginResponseDisplayRetailerStoreParties()
      ..retailerStorePartyId = retailerStorePartyId ?? this.retailerStorePartyId
      ..storeId = storeId ?? this.storeId
      ..distributorId = distributorId ?? this.distributorId
      ..storeName = storeName ?? this.storeName
      ..storeCode = storeCode ?? this.storeCode
      ..stockVisibility = stockVisibility ?? this.stockVisibility
      ..minItemLimit = minItemLimit ?? this.minItemLimit
      ..maxItemLimit = maxItemLimit ?? this.maxItemLimit
      ..minAmountLimit = minAmountLimit ?? this.minAmountLimit
      ..maxAmountLimit = maxAmountLimit ?? this.maxAmountLimit
      ..storeGSTINNumber = storeGSTINNumber ?? this.storeGSTINNumber
      ..retailerId = retailerId ?? this.retailerId
      ..partyName = partyName ?? this.partyName
      ..partyCode = partyCode ?? this.partyCode
      ..displayPartyCode = displayPartyCode ?? this.displayPartyCode
      ..retailerName = retailerName ?? this.retailerName
      ..address1 = address1 ?? this.address1
      ..address2 = address2 ?? this.address2
      ..city = city ?? this.city
      ..statename = statename ?? this.statename
      ..pincode = pincode ?? this.pincode
      ..telephone = telephone ?? this.telephone
      ..mobileNumber = mobileNumber ?? this.mobileNumber
      ..email = email ?? this.email
      ..cSTNumber = cSTNumber ?? this.cSTNumber
      ..licenseNumber = licenseNumber ?? this.licenseNumber
      ..gSTINNumber = gSTINNumber ?? this.gSTINNumber
      ..contactPerson = contactPerson ?? this.contactPerson
      ..sPAddress1 = sPAddress1 ?? this.sPAddress1
      ..sPAddress2 = sPAddress2 ?? this.sPAddress2
      ..sPArea = sPArea ?? this.sPArea
      ..locked = locked ?? this.locked
      ..createdBy = createdBy ?? this.createdBy
      ..sPCity = sPCity ?? this.sPCity
      ..sPPincode = sPPincode ?? this.sPPincode
      ..sPTelephone = sPTelephone ?? this.sPTelephone
      ..sPMobileNumber = sPMobileNumber ?? this.sPMobileNumber
      ..sPEmail = sPEmail ?? this.sPEmail
      ..sPCSTNumber = sPCSTNumber ?? this.sPCSTNumber
      ..sPGSTINNumber = sPGSTINNumber ?? this.sPGSTINNumber
      ..sPLicenseNumber = sPLicenseNumber ?? this.sPLicenseNumber
      ..isLogisticsEnabled = isLogisticsEnabled ?? this.isLogisticsEnabled;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginResponseStatus {
  @JsonKey(name: "StatusId")
  int? statusId;
  @JsonKey(name: "StatusMessage")
  String? statusMessage;

  LoginResponseStatus();

  factory LoginResponseStatus.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseStatusFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseStatusToJson(this);

  LoginResponseStatus copyWith({int? statusId, String? statusMessage}) {
    return LoginResponseStatus()
      ..statusId = statusId ?? this.statusId
      ..statusMessage = statusMessage ?? this.statusMessage;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginResponseDisplayFeedbackTypes {
  @JsonKey(name: "Id")
  int? id;
  @JsonKey(name: "Types")
  String? types;
  @JsonKey(name: "Role")
  String? role;
  @JsonKey(name: "ShowNextOption")
  bool? showNextOption;

  LoginResponseDisplayFeedbackTypes();

  factory LoginResponseDisplayFeedbackTypes.fromJson(
          Map<String, dynamic> json) =>
      _$LoginResponseDisplayFeedbackTypesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginResponseDisplayFeedbackTypesToJson(this);

  LoginResponseDisplayFeedbackTypes copyWith(
      {int? id, String? types, String? role, bool? showNextOption}) {
    return LoginResponseDisplayFeedbackTypes()
      ..id = id ?? this.id
      ..types = types ?? this.types
      ..role = role ?? this.role
      ..showNextOption = showNextOption ?? this.showNextOption;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginResponseDisplayReferral {
  @JsonKey(name: "ShowReferral")
  bool? showReferral;
  @JsonKey(name: "ReferralText")
  String? referralText;

  LoginResponseDisplayReferral();

  factory LoginResponseDisplayReferral.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDisplayReferralFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDisplayReferralToJson(this);

  LoginResponseDisplayReferral copyWith(
      {bool? showReferral, String? referralText}) {
    return LoginResponseDisplayReferral()
      ..showReferral = showReferral ?? this.showReferral
      ..referralText = referralText ?? this.referralText;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginResponseDisplayCreditNoteStores {
  @JsonKey(name: "StoreId")
  int? storeId;
  @JsonKey(name: "DistributorId")
  int? distributorId;
  @JsonKey(name: "StoreName")
  String? storeName;
  @JsonKey(name: "StoreCode")
  String? storeCode;
  @JsonKey(name: "StockVisibility")
  dynamic stockVisibility;
  @JsonKey(name: "RShowSchemes")
  dynamic rShowSchemes;
  @JsonKey(name: "AllowEditFreeQty")
  dynamic allowEditFreeQty;
  @JsonKey(name: "GroupStoreId")
  int? groupStoreId;
  @JsonKey(name: "ConfiguredSchemes")
  dynamic configuredSchemes;
  @JsonKey(name: "IsGroupWisePTR")
  bool? isGroupWisePTR;
  @JsonKey(name: "IsGroupWisePTRSalesman")
  bool? isGroupWisePTRSalesman;
  @JsonKey(name: "IsGroupWisePTRRetailer")
  bool? isGroupWisePTRRetailer;
  @JsonKey(name: "IsEnabledDeliveryTrackerOTP")
  dynamic isEnabledDeliveryTrackerOTP;
  @JsonKey(name: "EnableEditablePTR")
  bool? enableEditablePTR;
  @JsonKey(name: "IsLogisticsEnabled")
  bool? isLogisticsEnabled;
  @JsonKey(name: "IsShowUPICollection")
  bool? isShowUPICollection;
  @JsonKey(name: "IsShowPRStore")
  bool? isShowPRStore;

  LoginResponseDisplayCreditNoteStores();

  factory LoginResponseDisplayCreditNoteStores.fromJson(
          Map<String, dynamic> json) =>
      _$LoginResponseDisplayCreditNoteStoresFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginResponseDisplayCreditNoteStoresToJson(this);

  LoginResponseDisplayCreditNoteStores copyWith(
      {int? storeId,
      int? distributorId,
      String? storeName,
      String? storeCode,
      dynamic stockVisibility,
      dynamic rShowSchemes,
      dynamic allowEditFreeQty,
      int? groupStoreId,
      dynamic configuredSchemes,
      bool? isGroupWisePTR,
      bool? isGroupWisePTRSalesman,
      bool? isGroupWisePTRRetailer,
      dynamic isEnabledDeliveryTrackerOTP,
      bool? enableEditablePTR,
      bool? isLogisticsEnabled,
      bool? isShowUPICollection,
      bool? isShowPRStore}) {
    return LoginResponseDisplayCreditNoteStores()
      ..storeId = storeId ?? this.storeId
      ..distributorId = distributorId ?? this.distributorId
      ..storeName = storeName ?? this.storeName
      ..storeCode = storeCode ?? this.storeCode
      ..stockVisibility = stockVisibility ?? this.stockVisibility
      ..rShowSchemes = rShowSchemes ?? this.rShowSchemes
      ..allowEditFreeQty = allowEditFreeQty ?? this.allowEditFreeQty
      ..groupStoreId = groupStoreId ?? this.groupStoreId
      ..configuredSchemes = configuredSchemes ?? this.configuredSchemes
      ..isGroupWisePTR = isGroupWisePTR ?? this.isGroupWisePTR
      ..isGroupWisePTRSalesman =
          isGroupWisePTRSalesman ?? this.isGroupWisePTRSalesman
      ..isGroupWisePTRRetailer =
          isGroupWisePTRRetailer ?? this.isGroupWisePTRRetailer
      ..isEnabledDeliveryTrackerOTP =
          isEnabledDeliveryTrackerOTP ?? this.isEnabledDeliveryTrackerOTP
      ..enableEditablePTR = enableEditablePTR ?? this.enableEditablePTR
      ..isLogisticsEnabled = isLogisticsEnabled ?? this.isLogisticsEnabled
      ..isShowUPICollection = isShowUPICollection ?? this.isShowUPICollection
      ..isShowPRStore = isShowPRStore ?? this.isShowPRStore;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginResponseHyperTrack {
  @JsonKey(name: "StartTracking")
  bool? startTracking;
  @JsonKey(name: "EnableSalesmanTracking")
  bool? enableSalesmanTracking;
  @JsonKey(name: "HyperTrackGroupToken")
  String? hyperTrackGroupToken;
  @JsonKey(name: "HyperTrackUserId")
  String? hyperTrackUserId;
  @JsonKey(name: "EnableTaskAssignment")
  bool? enableTaskAssignment;

  LoginResponseHyperTrack();

  factory LoginResponseHyperTrack.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseHyperTrackFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseHyperTrackToJson(this);

  LoginResponseHyperTrack copyWith(
      {bool? startTracking,
      bool? enableSalesmanTracking,
      String? hyperTrackGroupToken,
      String? hyperTrackUserId,
      bool? enableTaskAssignment}) {
    return LoginResponseHyperTrack()
      ..startTracking = startTracking ?? this.startTracking
      ..enableSalesmanTracking =
          enableSalesmanTracking ?? this.enableSalesmanTracking
      ..hyperTrackGroupToken = hyperTrackGroupToken ?? this.hyperTrackGroupToken
      ..hyperTrackUserId = hyperTrackUserId ?? this.hyperTrackUserId
      ..enableTaskAssignment =
          enableTaskAssignment ?? this.enableTaskAssignment;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginResponseStores {
  @JsonKey(name: "StoreId")
  int? storeId;
  @JsonKey(name: "DistributorId")
  int? distributorId;
  @JsonKey(name: "StoreName")
  String? storeName;
  @JsonKey(name: "StoreCode")
  String? storeCode;
  @JsonKey(name: "StoreApiCode")
  String? storeApiCode;
  @JsonKey(name: "CompanyId")
  String? companyId;
  @JsonKey(name: "BranchId")
  dynamic branchId;
  @JsonKey(name: "CheckBranchDetails")
  dynamic checkBranchDetails;
  @JsonKey(name: "ApiId")
  int? apiId;
  @JsonKey(name: "StockVisibility")
  int? stockVisibility;
  @JsonKey(name: "RStockVisibility")
  int? rStockVisibility;
  @JsonKey(name: "RegionId")
  int? regionId;
  @JsonKey(name: "GroupStoreId")
  int? groupStoreId;
  @JsonKey(name: "DateFormat")
  String? dateFormat;
  @JsonKey(name: "DateFormat2")
  dynamic dateFormat2;
  @JsonKey(name: "ShortCode")
  String? shortCode;
  @JsonKey(name: "SCode")
  String? sCode;
  @JsonKey(name: "IsPartyListNotCommon")
  int? isPartyListNotCommon;
  @JsonKey(name: "EditFreeQuantity")
  bool? editFreeQuantity;
  @JsonKey(name: "Status")
  String? status;
  @JsonKey(name: "StoreType")
  dynamic storeType;
  @JsonKey(name: "StoreSubType")
  dynamic storeSubType;
  @JsonKey(name: "StoreRemarks")
  dynamic storeRemarks;
  @JsonKey(name: "StoreScheduledate")
  dynamic storeScheduledate;
  @JsonKey(name: "MappingNotRequired")
  bool? mappingNotRequired;
  @JsonKey(name: "UniversalAgreement")
  dynamic universalAgreement;
  @JsonKey(name: "CreatedBy")
  int? createdBy;
  @JsonKey(name: "CreatedDate")
  String? createdDate;
  @JsonKey(name: "ModifiedBy")
  int? modifiedBy;
  @JsonKey(name: "ModifiedDate")
  String? modifiedDate;
  @JsonKey(name: "OrderFileFormatId")
  dynamic orderFileFormatId;
  @JsonKey(name: "EstablishmentDate")
  dynamic establishmentDate;
  @JsonKey(name: "IsMapped")
  int? isMapped;
  @JsonKey(name: "RetailerId")
  int? retailerId;
  @JsonKey(name: "PartyCode")
  String? partyCode;
  @JsonKey(name: "PartyName")
  String? partyName;
  @JsonKey(name: "RetailerName")
  String? retailerName;
  @JsonKey(name: "Address1")
  String? address1;
  @JsonKey(name: "Address2")
  String? address2;
  @JsonKey(name: "City")
  String? city;
  @JsonKey(name: "Statename")
  String? statename;
  @JsonKey(name: "Pincode")
  int? pincode;
  @JsonKey(name: "Telephone")
  dynamic telephone;
  @JsonKey(name: "MobileNumber")
  String? mobileNumber;
  @JsonKey(name: "Email")
  String? email;
  @JsonKey(name: "CSTNumber")
  String? cSTNumber;
  @JsonKey(name: "LicenseNumber")
  String? licenseNumber;
  @JsonKey(name: "ContactPerson")
  String? contactPerson;
  @JsonKey(name: "GSTINNumber")
  String? gSTINNumber;
  @JsonKey(name: "SPAddress1")
  String? sPAddress1;
  @JsonKey(name: "SPAddress2")
  String? sPAddress2;
  @JsonKey(name: "Area")
  String? area;
  @JsonKey(name: "SPCity")
  String? sPCity;
  @JsonKey(name: "SPPincode")
  String? sPPincode;
  @JsonKey(name: "SPTelephone")
  String? sPTelephone;
  @JsonKey(name: "SPMobileNumber")
  String? sPMobileNumber;
  @JsonKey(name: "SPCSTNumber")
  String? sPCSTNumber;
  @JsonKey(name: "SPLicenseNumber")
  String? sPLicenseNumber;
  @JsonKey(name: "MinItemLimit")
  int? minItemLimit;
  @JsonKey(name: "MaxItemLimit")
  int? maxItemLimit;
  @JsonKey(name: "MinAmountLimit")
  double? minAmountLimit;
  @JsonKey(name: "MaxAmountLimit")
  double? maxAmountLimit;
  @JsonKey(name: "StoreGSTINNumber")
  String? storeGSTINNumber;
  @JsonKey(name: "OrderDeliveryModeStatus")
  int? orderDeliveryModeStatus;
  @JsonKey(name: "OrderRemarks")
  int? orderRemarks;
  @JsonKey(name: "DisplayHS")
  bool? displayHS;
  @JsonKey(name: "DisplayHSOn")
  dynamic displayHSOn;
  @JsonKey(name: "RoundOffDisplayHS")
  bool? roundOffDisplayHS;
  @JsonKey(name: "RetailerSchemePreference")
  int? retailerSchemePreference;
  @JsonKey(name: "RetailerSchemePriority")
  int? retailerSchemePriority;

  LoginResponseStores();

  factory LoginResponseStores.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseStoresFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseStoresToJson(this);

  LoginResponseStores copyWith(
      {int? storeId,
      int? distributorId,
      String? storeName,
      String? storeCode,
      String? storeApiCode,
      String? companyId,
      dynamic branchId,
      dynamic checkBranchDetails,
      int? apiId,
      int? stockVisibility,
      int? rStockVisibility,
      int? regionId,
      int? groupStoreId,
      String? dateFormat,
      dynamic dateFormat2,
      String? shortCode,
      String? sCode,
      int? isPartyListNotCommon,
      bool? editFreeQuantity,
      String? status,
      dynamic storeType,
      dynamic storeSubType,
      dynamic storeRemarks,
      dynamic storeScheduledate,
      bool? mappingNotRequired,
      dynamic universalAgreement,
      int? createdBy,
      String? createdDate,
      int? modifiedBy,
      String? modifiedDate,
      dynamic orderFileFormatId,
      dynamic establishmentDate,
      int? isMapped,
      int? retailerId,
      String? partyCode,
      String? partyName,
      String? retailerName,
      String? address1,
      String? address2,
      String? city,
      String? statename,
      int? pincode,
      dynamic telephone,
      String? mobileNumber,
      String? email,
      String? cSTNumber,
      String? licenseNumber,
      String? contactPerson,
      String? gSTINNumber,
      String? sPAddress1,
      String? sPAddress2,
      String? area,
      String? sPCity,
      String? sPPincode,
      String? sPTelephone,
      String? sPMobileNumber,
      String? sPCSTNumber,
      String? sPLicenseNumber,
      int? minItemLimit,
      int? maxItemLimit,
      double? minAmountLimit,
      double? maxAmountLimit,
      String? storeGSTINNumber,
      int? orderDeliveryModeStatus,
      int? orderRemarks,
      bool? displayHS,
      dynamic displayHSOn,
      bool? roundOffDisplayHS,
      int? retailerSchemePreference,
      int? retailerSchemePriority}) {
    return LoginResponseStores()
      ..storeId = storeId ?? this.storeId
      ..distributorId = distributorId ?? this.distributorId
      ..storeName = storeName ?? this.storeName
      ..storeCode = storeCode ?? this.storeCode
      ..storeApiCode = storeApiCode ?? this.storeApiCode
      ..companyId = companyId ?? this.companyId
      ..branchId = branchId ?? this.branchId
      ..checkBranchDetails = checkBranchDetails ?? this.checkBranchDetails
      ..apiId = apiId ?? this.apiId
      ..stockVisibility = stockVisibility ?? this.stockVisibility
      ..rStockVisibility = rStockVisibility ?? this.rStockVisibility
      ..regionId = regionId ?? this.regionId
      ..groupStoreId = groupStoreId ?? this.groupStoreId
      ..dateFormat = dateFormat ?? this.dateFormat
      ..dateFormat2 = dateFormat2 ?? this.dateFormat2
      ..shortCode = shortCode ?? this.shortCode
      ..sCode = sCode ?? this.sCode
      ..isPartyListNotCommon = isPartyListNotCommon ?? this.isPartyListNotCommon
      ..editFreeQuantity = editFreeQuantity ?? this.editFreeQuantity
      ..status = status ?? this.status
      ..storeType = storeType ?? this.storeType
      ..storeSubType = storeSubType ?? this.storeSubType
      ..storeRemarks = storeRemarks ?? this.storeRemarks
      ..storeScheduledate = storeScheduledate ?? this.storeScheduledate
      ..mappingNotRequired = mappingNotRequired ?? this.mappingNotRequired
      ..universalAgreement = universalAgreement ?? this.universalAgreement
      ..createdBy = createdBy ?? this.createdBy
      ..createdDate = createdDate ?? this.createdDate
      ..modifiedBy = modifiedBy ?? this.modifiedBy
      ..modifiedDate = modifiedDate ?? this.modifiedDate
      ..orderFileFormatId = orderFileFormatId ?? this.orderFileFormatId
      ..establishmentDate = establishmentDate ?? this.establishmentDate
      ..isMapped = isMapped ?? this.isMapped
      ..retailerId = retailerId ?? this.retailerId
      ..partyCode = partyCode ?? this.partyCode
      ..partyName = partyName ?? this.partyName
      ..retailerName = retailerName ?? this.retailerName
      ..address1 = address1 ?? this.address1
      ..address2 = address2 ?? this.address2
      ..city = city ?? this.city
      ..statename = statename ?? this.statename
      ..pincode = pincode ?? this.pincode
      ..telephone = telephone ?? this.telephone
      ..mobileNumber = mobileNumber ?? this.mobileNumber
      ..email = email ?? this.email
      ..cSTNumber = cSTNumber ?? this.cSTNumber
      ..licenseNumber = licenseNumber ?? this.licenseNumber
      ..contactPerson = contactPerson ?? this.contactPerson
      ..gSTINNumber = gSTINNumber ?? this.gSTINNumber
      ..sPAddress1 = sPAddress1 ?? this.sPAddress1
      ..sPAddress2 = sPAddress2 ?? this.sPAddress2
      ..area = area ?? this.area
      ..sPCity = sPCity ?? this.sPCity
      ..sPPincode = sPPincode ?? this.sPPincode
      ..sPTelephone = sPTelephone ?? this.sPTelephone
      ..sPMobileNumber = sPMobileNumber ?? this.sPMobileNumber
      ..sPCSTNumber = sPCSTNumber ?? this.sPCSTNumber
      ..sPLicenseNumber = sPLicenseNumber ?? this.sPLicenseNumber
      ..minItemLimit = minItemLimit ?? this.minItemLimit
      ..maxItemLimit = maxItemLimit ?? this.maxItemLimit
      ..minAmountLimit = minAmountLimit ?? this.minAmountLimit
      ..maxAmountLimit = maxAmountLimit ?? this.maxAmountLimit
      ..storeGSTINNumber = storeGSTINNumber ?? this.storeGSTINNumber
      ..orderDeliveryModeStatus =
          orderDeliveryModeStatus ?? this.orderDeliveryModeStatus
      ..orderRemarks = orderRemarks ?? this.orderRemarks
      ..displayHS = displayHS ?? this.displayHS
      ..displayHSOn = displayHSOn ?? this.displayHSOn
      ..roundOffDisplayHS = roundOffDisplayHS ?? this.roundOffDisplayHS
      ..retailerSchemePreference =
          retailerSchemePreference ?? this.retailerSchemePreference
      ..retailerSchemePriority =
          retailerSchemePriority ?? this.retailerSchemePriority;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginResponseDisplayAllStores {
  @JsonKey(name: "StoreId")
  int? storeId;
  @JsonKey(name: "DistributorId")
  int? distributorId;
  @JsonKey(name: "StoreName")
  String? storeName;
  @JsonKey(name: "StoreCode")
  String? storeCode;
  @JsonKey(name: "StoreApiCode")
  dynamic storeApiCode;
  @JsonKey(name: "CompanyId")
  dynamic companyId;
  @JsonKey(name: "BranchId")
  dynamic branchId;
  @JsonKey(name: "CheckBranchDetails")
  dynamic checkBranchDetails;
  @JsonKey(name: "ApiId")
  int? apiId;
  @JsonKey(name: "StockVisibility")
  int? stockVisibility;
  @JsonKey(name: "RStockVisibility")
  int? rStockVisibility;
  @JsonKey(name: "RegionId")
  int? regionId;
  @JsonKey(name: "GroupStoreId")
  int? groupStoreId;
  @JsonKey(name: "DateFormat")
  dynamic dateFormat;
  @JsonKey(name: "DateFormat2")
  dynamic dateFormat2;
  @JsonKey(name: "ShortCode")
  dynamic shortCode;
  @JsonKey(name: "SCode")
  String? sCode;
  @JsonKey(name: "IsPartyListNotCommon")
  dynamic isPartyListNotCommon;
  @JsonKey(name: "EditFreeQuantity")
  bool? editFreeQuantity;
  @JsonKey(name: "Status")
  String? status;
  @JsonKey(name: "StoreType")
  dynamic storeType;
  @JsonKey(name: "StoreSubType")
  dynamic storeSubType;
  @JsonKey(name: "StoreRemarks")
  dynamic storeRemarks;
  @JsonKey(name: "StoreScheduledate")
  dynamic storeScheduledate;
  @JsonKey(name: "MappingNotRequired")
  dynamic mappingNotRequired;
  @JsonKey(name: "UniversalAgreement")
  dynamic universalAgreement;
  @JsonKey(name: "CreatedBy")
  int? createdBy;
  @JsonKey(name: "CreatedDate")
  String? createdDate;
  @JsonKey(name: "ModifiedBy")
  int? modifiedBy;
  @JsonKey(name: "ModifiedDate")
  String? modifiedDate;
  @JsonKey(name: "OrderFileFormatId")
  dynamic orderFileFormatId;
  @JsonKey(name: "EstablishmentDate")
  dynamic establishmentDate;
  @JsonKey(name: "IsMapped")
  int? isMapped;
  @JsonKey(name: "RetailerId")
  int? retailerId;
  @JsonKey(name: "PartyCode")
  String? partyCode;
  @JsonKey(name: "PartyName")
  String? partyName;
  @JsonKey(name: "RetailerName")
  String? retailerName;
  @JsonKey(name: "Address1")
  String? address1;
  @JsonKey(name: "Address2")
  String? address2;
  @JsonKey(name: "City")
  String? city;
  @JsonKey(name: "Statename")
  String? statename;
  @JsonKey(name: "Pincode")
  int? pincode;
  @JsonKey(name: "Telephone")
  dynamic telephone;
  @JsonKey(name: "MobileNumber")
  String? mobileNumber;
  @JsonKey(name: "Email")
  String? email;
  @JsonKey(name: "CSTNumber")
  String? cSTNumber;
  @JsonKey(name: "LicenseNumber")
  String? licenseNumber;
  @JsonKey(name: "ContactPerson")
  String? contactPerson;
  @JsonKey(name: "GSTINNumber")
  String? gSTINNumber;
  @JsonKey(name: "SPAddress1")
  String? sPAddress1;
  @JsonKey(name: "SPAddress2")
  String? sPAddress2;
  @JsonKey(name: "Area")
  String? area;
  @JsonKey(name: "SPCity")
  String? sPCity;
  @JsonKey(name: "SPPincode")
  String? sPPincode;
  @JsonKey(name: "SPTelephone")
  String? sPTelephone;
  @JsonKey(name: "SPMobileNumber")
  String? sPMobileNumber;
  @JsonKey(name: "SPCSTNumber")
  String? sPCSTNumber;
  @JsonKey(name: "SPLicenseNumber")
  String? sPLicenseNumber;
  @JsonKey(name: "MinItemLimit")
  int? minItemLimit;
  @JsonKey(name: "MaxItemLimit")
  int? maxItemLimit;
  @JsonKey(name: "MinAmountLimit")
  double? minAmountLimit;
  @JsonKey(name: "MaxAmountLimit")
  double? maxAmountLimit;
  @JsonKey(name: "StoreGSTINNumber")
  String? storeGSTINNumber;
  @JsonKey(name: "OrderDeliveryModeStatus")
  int? orderDeliveryModeStatus;
  @JsonKey(name: "OrderRemarks")
  int? orderRemarks;
  @JsonKey(name: "DisplayHS")
  bool? displayHS;
  @JsonKey(name: "DisplayHSOn")
  String? displayHSOn;
  @JsonKey(name: "RoundOffDisplayHS")
  bool? roundOffDisplayHS;
  @JsonKey(name: "RetailerSchemePreference")
  int? retailerSchemePreference;
  @JsonKey(name: "RetailerSchemePriority")
  int? retailerSchemePriority;

  LoginResponseDisplayAllStores();

  factory LoginResponseDisplayAllStores.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDisplayAllStoresFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDisplayAllStoresToJson(this);

  LoginResponseDisplayAllStores copyWith(
      {int? storeId,
      int? distributorId,
      String? storeName,
      String? storeCode,
      dynamic storeApiCode,
      dynamic companyId,
      dynamic branchId,
      dynamic checkBranchDetails,
      int? apiId,
      int? stockVisibility,
      int? rStockVisibility,
      int? regionId,
      int? groupStoreId,
      dynamic dateFormat,
      dynamic dateFormat2,
      dynamic shortCode,
      String? sCode,
      dynamic isPartyListNotCommon,
      bool? editFreeQuantity,
      String? status,
      dynamic storeType,
      dynamic storeSubType,
      dynamic storeRemarks,
      dynamic storeScheduledate,
      dynamic mappingNotRequired,
      dynamic universalAgreement,
      int? createdBy,
      String? createdDate,
      int? modifiedBy,
      String? modifiedDate,
      dynamic orderFileFormatId,
      dynamic establishmentDate,
      int? isMapped,
      int? retailerId,
      String? partyCode,
      String? partyName,
      String? retailerName,
      String? address1,
      String? address2,
      String? city,
      String? statename,
      int? pincode,
      dynamic telephone,
      String? mobileNumber,
      String? email,
      String? cSTNumber,
      String? licenseNumber,
      String? contactPerson,
      String? gSTINNumber,
      String? sPAddress1,
      String? sPAddress2,
      String? area,
      String? sPCity,
      String? sPPincode,
      String? sPTelephone,
      String? sPMobileNumber,
      String? sPCSTNumber,
      String? sPLicenseNumber,
      int? minItemLimit,
      int? maxItemLimit,
      double? minAmountLimit,
      double? maxAmountLimit,
      String? storeGSTINNumber,
      int? orderDeliveryModeStatus,
      int? orderRemarks,
      bool? displayHS,
      String? displayHSOn,
      bool? roundOffDisplayHS,
      int? retailerSchemePreference,
      int? retailerSchemePriority}) {
    return LoginResponseDisplayAllStores()
      ..storeId = storeId ?? this.storeId
      ..distributorId = distributorId ?? this.distributorId
      ..storeName = storeName ?? this.storeName
      ..storeCode = storeCode ?? this.storeCode
      ..storeApiCode = storeApiCode ?? this.storeApiCode
      ..companyId = companyId ?? this.companyId
      ..branchId = branchId ?? this.branchId
      ..checkBranchDetails = checkBranchDetails ?? this.checkBranchDetails
      ..apiId = apiId ?? this.apiId
      ..stockVisibility = stockVisibility ?? this.stockVisibility
      ..rStockVisibility = rStockVisibility ?? this.rStockVisibility
      ..regionId = regionId ?? this.regionId
      ..groupStoreId = groupStoreId ?? this.groupStoreId
      ..dateFormat = dateFormat ?? this.dateFormat
      ..dateFormat2 = dateFormat2 ?? this.dateFormat2
      ..shortCode = shortCode ?? this.shortCode
      ..sCode = sCode ?? this.sCode
      ..isPartyListNotCommon = isPartyListNotCommon ?? this.isPartyListNotCommon
      ..editFreeQuantity = editFreeQuantity ?? this.editFreeQuantity
      ..status = status ?? this.status
      ..storeType = storeType ?? this.storeType
      ..storeSubType = storeSubType ?? this.storeSubType
      ..storeRemarks = storeRemarks ?? this.storeRemarks
      ..storeScheduledate = storeScheduledate ?? this.storeScheduledate
      ..mappingNotRequired = mappingNotRequired ?? this.mappingNotRequired
      ..universalAgreement = universalAgreement ?? this.universalAgreement
      ..createdBy = createdBy ?? this.createdBy
      ..createdDate = createdDate ?? this.createdDate
      ..modifiedBy = modifiedBy ?? this.modifiedBy
      ..modifiedDate = modifiedDate ?? this.modifiedDate
      ..orderFileFormatId = orderFileFormatId ?? this.orderFileFormatId
      ..establishmentDate = establishmentDate ?? this.establishmentDate
      ..isMapped = isMapped ?? this.isMapped
      ..retailerId = retailerId ?? this.retailerId
      ..partyCode = partyCode ?? this.partyCode
      ..partyName = partyName ?? this.partyName
      ..retailerName = retailerName ?? this.retailerName
      ..address1 = address1 ?? this.address1
      ..address2 = address2 ?? this.address2
      ..city = city ?? this.city
      ..statename = statename ?? this.statename
      ..pincode = pincode ?? this.pincode
      ..telephone = telephone ?? this.telephone
      ..mobileNumber = mobileNumber ?? this.mobileNumber
      ..email = email ?? this.email
      ..cSTNumber = cSTNumber ?? this.cSTNumber
      ..licenseNumber = licenseNumber ?? this.licenseNumber
      ..contactPerson = contactPerson ?? this.contactPerson
      ..gSTINNumber = gSTINNumber ?? this.gSTINNumber
      ..sPAddress1 = sPAddress1 ?? this.sPAddress1
      ..sPAddress2 = sPAddress2 ?? this.sPAddress2
      ..area = area ?? this.area
      ..sPCity = sPCity ?? this.sPCity
      ..sPPincode = sPPincode ?? this.sPPincode
      ..sPTelephone = sPTelephone ?? this.sPTelephone
      ..sPMobileNumber = sPMobileNumber ?? this.sPMobileNumber
      ..sPCSTNumber = sPCSTNumber ?? this.sPCSTNumber
      ..sPLicenseNumber = sPLicenseNumber ?? this.sPLicenseNumber
      ..minItemLimit = minItemLimit ?? this.minItemLimit
      ..maxItemLimit = maxItemLimit ?? this.maxItemLimit
      ..minAmountLimit = minAmountLimit ?? this.minAmountLimit
      ..maxAmountLimit = maxAmountLimit ?? this.maxAmountLimit
      ..storeGSTINNumber = storeGSTINNumber ?? this.storeGSTINNumber
      ..orderDeliveryModeStatus =
          orderDeliveryModeStatus ?? this.orderDeliveryModeStatus
      ..orderRemarks = orderRemarks ?? this.orderRemarks
      ..displayHS = displayHS ?? this.displayHS
      ..displayHSOn = displayHSOn ?? this.displayHSOn
      ..roundOffDisplayHS = roundOffDisplayHS ?? this.roundOffDisplayHS
      ..retailerSchemePreference =
          retailerSchemePreference ?? this.retailerSchemePreference
      ..retailerSchemePriority =
          retailerSchemePriority ?? this.retailerSchemePriority;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class LoginResponseRetailerPaymentConfig {
  @JsonKey(name: "RetailerStorePaymentConfigId")
  int? retailerStorePaymentConfigId;
  @JsonKey(name: "UserId")
  int? userId;
  @JsonKey(name: "BankAcNumber")
  String? bankAcNumber;
  @JsonKey(name: "BankAcName")
  String? bankAcName;
  @JsonKey(name: "BankName")
  String? bankName;
  @JsonKey(name: "IFSC")
  String? iFSC;
  @JsonKey(name: "CreatedBy")
  int? createdBy;
  @JsonKey(name: "CreatedDate")
  String? createdDate;
  @JsonKey(name: "ModifiedBy")
  int? modifiedBy;
  @JsonKey(name: "ModifiedDate")
  String? modifiedDate;
  @JsonKey(name: "IsActive")
  bool? isActive;
  @JsonKey(name: "AccountType")
  String? accountType;
  @JsonKey(name: "MinAmount")
  dynamic minAmount;
  @JsonKey(name: "MaxAmount")
  dynamic maxAmount;
  @JsonKey(name: "IsBeneficiaryActive")
  bool? isBeneficiaryActive;
  @JsonKey(name: "IsBeneficiaryFreezed")
  int? isBeneficiaryFreezed;
  @JsonKey(name: "BeneficiaryId")
  dynamic beneficiaryId;
  @JsonKey(name: "IsCreditCardEnabled")
  bool? isCreditCardEnabled;
  @JsonKey(name: "CreditCardConvenienceFee")
  dynamic creditCardConvenienceFee;
  @JsonKey(name: "CreditCardConvenienceFeeValue")
  dynamic creditCardConvenienceFeeValue;
  @JsonKey(name: "EnabledCCAvenueCreditCardBanking")
  bool? enabledCCAvenueCreditCardBanking;
  @JsonKey(name: "CCAvenueCreditCardKey")
  dynamic cCAvenueCreditCardKey;
  @JsonKey(name: "CCAvenueCreditCardVaues")
  dynamic cCAvenueCreditCardVaues;
  @JsonKey(name: "RetailerName")
  dynamic retailerName;
  @JsonKey(name: "EnableIndiumCredit")
  bool? enableIndiumCredit;
  @JsonKey(name: "BankAccountType")
  String? bankAccountType;
  @JsonKey(name: "UPIId")
  String? uPIId;
  @JsonKey(name: "IsUPIVerified")
  int? isUPIVerified;

  LoginResponseRetailerPaymentConfig();

  factory LoginResponseRetailerPaymentConfig.fromJson(
          Map<String, dynamic> json) =>
      _$LoginResponseRetailerPaymentConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LoginResponseRetailerPaymentConfigToJson(this);

  LoginResponseRetailerPaymentConfig copyWith(
      {int? retailerStorePaymentConfigId,
      int? userId,
      String? bankAcNumber,
      String? bankAcName,
      String? bankName,
      String? iFSC,
      int? createdBy,
      String? createdDate,
      int? modifiedBy,
      String? modifiedDate,
      bool? isActive,
      String? accountType,
      dynamic minAmount,
      dynamic maxAmount,
      bool? isBeneficiaryActive,
      int? isBeneficiaryFreezed,
      dynamic beneficiaryId,
      bool? isCreditCardEnabled,
      dynamic creditCardConvenienceFee,
      dynamic creditCardConvenienceFeeValue,
      bool? enabledCCAvenueCreditCardBanking,
      dynamic cCAvenueCreditCardKey,
      dynamic cCAvenueCreditCardVaues,
      dynamic retailerName,
      bool? enableIndiumCredit,
      String? bankAccountType,
      String? uPIId,
      int? isUPIVerified}) {
    return LoginResponseRetailerPaymentConfig()
      ..retailerStorePaymentConfigId =
          retailerStorePaymentConfigId ?? this.retailerStorePaymentConfigId
      ..userId = userId ?? this.userId
      ..bankAcNumber = bankAcNumber ?? this.bankAcNumber
      ..bankAcName = bankAcName ?? this.bankAcName
      ..bankName = bankName ?? this.bankName
      ..iFSC = iFSC ?? this.iFSC
      ..createdBy = createdBy ?? this.createdBy
      ..createdDate = createdDate ?? this.createdDate
      ..modifiedBy = modifiedBy ?? this.modifiedBy
      ..modifiedDate = modifiedDate ?? this.modifiedDate
      ..isActive = isActive ?? this.isActive
      ..accountType = accountType ?? this.accountType
      ..minAmount = minAmount ?? this.minAmount
      ..maxAmount = maxAmount ?? this.maxAmount
      ..isBeneficiaryActive = isBeneficiaryActive ?? this.isBeneficiaryActive
      ..isBeneficiaryFreezed = isBeneficiaryFreezed ?? this.isBeneficiaryFreezed
      ..beneficiaryId = beneficiaryId ?? this.beneficiaryId
      ..isCreditCardEnabled = isCreditCardEnabled ?? this.isCreditCardEnabled
      ..creditCardConvenienceFee =
          creditCardConvenienceFee ?? this.creditCardConvenienceFee
      ..creditCardConvenienceFeeValue =
          creditCardConvenienceFeeValue ?? this.creditCardConvenienceFeeValue
      ..enabledCCAvenueCreditCardBanking = enabledCCAvenueCreditCardBanking ??
          this.enabledCCAvenueCreditCardBanking
      ..cCAvenueCreditCardKey =
          cCAvenueCreditCardKey ?? this.cCAvenueCreditCardKey
      ..cCAvenueCreditCardVaues =
          cCAvenueCreditCardVaues ?? this.cCAvenueCreditCardVaues
      ..retailerName = retailerName ?? this.retailerName
      ..enableIndiumCredit = enableIndiumCredit ?? this.enableIndiumCredit
      ..bankAccountType = bankAccountType ?? this.bankAccountType
      ..uPIId = uPIId ?? this.uPIId
      ..isUPIVerified = isUPIVerified ?? this.isUPIVerified;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
