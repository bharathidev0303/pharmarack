import 'package:json_annotation/json_annotation.dart';

part 'retailer_info_response_entity.g.dart';

@JsonSerializable()
class RetailerInfoEntity {
  @JsonKey(name: "UserId")
  int? userId;
  @JsonKey(name: "Username")
  String? username;
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
  @JsonKey(name: "CreatedBy")
  int? createdBy;
  @JsonKey(name: "CreatedDate")
  DateTime? createdDate;
  @JsonKey(name: "ModifiedBy")
  int? modifiedBy;
  @JsonKey(name: "ModifiedDate")
  DateTime? modifiedDate;
  @JsonKey(name: "userdetail")
  UserDetail? userdetail;
  @JsonKey(name: "DisplayRetailers")
  List<DisplayRetailer>? displayRetailers;
  @JsonKey(name: "DisplayImages")
  List<DisplayImage>? displayImages;
  @JsonKey(name: "retailerPaymentConfig")
  List<RetailerPaymentConfig>? retailerPaymentConfig;
  @JsonKey(name: "Stores")
  List<LoginResponseStores>? stores;
  @JsonKey(name: "segmentList")
  SegmentList? segmentList;

  RetailerInfoEntity({
    this.userId,
    this.username,
    this.firstname,
    this.lastname,
    this.email,
    this.mobileNumber,
    this.telephone,
    this.distributorId,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.userdetail,
    this.displayRetailers,
    this.displayImages,
    this.retailerPaymentConfig,
    this.stores,
    this.segmentList,
  });

  factory RetailerInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$RetailerInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RetailerInfoEntityToJson(this);

  int? getRetailerId() {
    return displayRetailers
        ?.where((e) => e.retailerId != null)
        .firstOrNull
        ?.retailerId;
  }

  String? getRetailerName() {
    return displayRetailers
        ?.where((e) => e.retailerId != null)
        .firstOrNull
        ?.retailerName;
  }

  int? getRegionId() {
    return displayRetailers
        ?.where((e) => e.retailerId != null)
        .firstOrNull
        ?.regionId;
  }
}

@JsonSerializable()
class UserDetail {
  @JsonKey(name: "UserId")
  int? userId;
  @JsonKey(name: "Address1")
  String? address1;
  @JsonKey(name: "Address2")
  String? address2;
  @JsonKey(name: "City")
  String? city;
  @JsonKey(name: "StateId")
  int? stateId;
  @JsonKey(name: "Pincode")
  int? pincode;
  @JsonKey(name: "CreatedBy")
  int? createdBy;
  @JsonKey(name: "CreatedDate")
  DateTime? createdDate;
  @JsonKey(name: "ModifiedBy")
  int? modifiedBy;
  @JsonKey(name: "ModifiedDate")
  DateTime? modifiedDate;
  @JsonKey(name: "MappedSalesman")
  dynamic mappedSalesman;
  @JsonKey(name: "MappedSalesmanCode")
  dynamic mappedSalesmanCode;
  @JsonKey(name: "GCMRegistrationId")
  String? gcmRegistrationId;
  @JsonKey(name: "AppId")
  int? appId;
  @JsonKey(name: "WebOneSignalUserId")
  dynamic webOneSignalUserId;
  @JsonKey(name: "SessionID")
  dynamic sessionId;
  @JsonKey(name: "MobileOneSignalUserId")
  dynamic mobileOneSignalUserId;
  @JsonKey(name: "LastWebOneSignalUserId")
  String? lastWebOneSignalUserId;
  @JsonKey(name: "LastMobileOneSignalUserId")
  String? lastMobileOneSignalUserId;
  @JsonKey(name: "MobilePlatform")
  String? mobilePlatform;
  @JsonKey(name: "GSTINNumber")
  dynamic gstinNumber;
  @JsonKey(name: "StartTracking")
  bool? startTracking;
  @JsonKey(name: "HyperTrackUserId")
  dynamic hyperTrackUserId;
  @JsonKey(name: "HyperTrackGroupId")
  dynamic hyperTrackGroupId;
  @JsonKey(name: "MappedDeliveryman")
  dynamic mappedDeliveryman;
  @JsonKey(name: "MappedDeliverymanCode")
  dynamic mappedDeliverymanCode;
  @JsonKey(name: "EnableEditablePTR")
  bool? enableEditablePtr;
  @JsonKey(name: "AlternateMobileNumbers")
  dynamic alternateMobileNumbers;
  @JsonKey(name: "AlternateEmailId")
  dynamic alternateEmailId;

  UserDetail({
    this.userId,
    this.address1,
    this.address2,
    this.city,
    this.stateId,
    this.pincode,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.mappedSalesman,
    this.mappedSalesmanCode,
    this.gcmRegistrationId,
    this.appId,
    this.webOneSignalUserId,
    this.sessionId,
    this.mobileOneSignalUserId,
    this.lastWebOneSignalUserId,
    this.lastMobileOneSignalUserId,
    this.mobilePlatform,
    this.gstinNumber,
    this.startTracking,
    this.hyperTrackUserId,
    this.hyperTrackGroupId,
    this.mappedDeliveryman,
    this.mappedDeliverymanCode,
    this.enableEditablePtr,
    this.alternateMobileNumbers,
    this.alternateEmailId,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailToJson(this);
}

@JsonSerializable()
class LoginResponseStores {
  @JsonKey(name: "StoreId")
  int? storeId;
  @JsonKey(name: "ManticoreStoreId")
  String? manticoreStoreId;
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
  @JsonKey(name: "ApiId")
  int? apiId;
  @JsonKey(name: "StockVisibility")
  int? stockVisibility;
  @JsonKey(name: "DateFormat")
  String? dateFormat;
  @JsonKey(name: "RegionId")
  int? regionId;
  @JsonKey(name: "RStockVisibility")
  int? rStockVisibility;
  @JsonKey(name: "GroupStoreId")
  int? groupStoreId;
  @JsonKey(name: "ShortCode")
  String? shortCode;
  @JsonKey(name: "IsPartyListNotCommon")
  int? isPartyListNotCommon;
  @JsonKey(name: "EditFreeQuantity")
  int? editFreeQuantity;
  @JsonKey(name: "Dateformat")
  String? dateformat;
  @JsonKey(name: "Status")
  String? status;
  @JsonKey(name: "BranchId")
  dynamic branchId;
  @JsonKey(name: "CheckBranchDetails")
  dynamic checkBranchDetails;
  @JsonKey(name: "MappingNotRequired")
  int? mappingNotRequired;
  @JsonKey(name: "Ismapped")
  int? ismapped;
  @JsonKey(name: "DoNotShowToRetailer")
  int? doNotShowToRetailer;
  @JsonKey(name: "RetailerId")
  String? retailerId;
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
  String? telephone;
  @JsonKey(name: "MobileNumber")
  String? mobileNumber;
  @JsonKey(name: "Email")
  String? email;
  @JsonKey(name: "CSTNumber")
  String? cstNumber;
  @JsonKey(name: "LicenseNumber")
  String? licenseNumber;
  @JsonKey(name: "ContactPerson")
  String? contactPerson;
  @JsonKey(name: "GSTINNumber")
  String? gstinNumber;
  @JsonKey(name: "SPAddress1")
  String? spAddress1;
  @JsonKey(name: "SPAddress2")
  String? spAddress2;
  @JsonKey(name: "AREA")
  String? area;
  @JsonKey(name: "CreatedBy")
  String? createdBy;
  @JsonKey(name: "SPCity")
  String? spCity;
  @JsonKey(name: "SPPincode")
  String? spPincode;
  @JsonKey(name: "SPTelephone")
  String? spTelephone;
  @JsonKey(name: "SPMobileNumber")
  String? spMobileNumber;
  @JsonKey(name: "SPEmail")
  String? spEmail;
  @JsonKey(name: "SPCSTNumber")
  String? spcstNumber;
  @JsonKey(name: "SPLicenseNumber")
  String? spLicenseNumber;
  @JsonKey(name: "MinItemLimit")
  String? minItemLimit;
  @JsonKey(name: "MaxItemLimit")
  String? maxItemLimit;
  @JsonKey(name: "MinAmountLimit")
  String? minAmountLimit;
  @JsonKey(name: "MaxAmountLimit")
  String? maxAmountLimit;
  @JsonKey(name: "StoreGSTINNumber")
  String? storeGstinNumber;
  @JsonKey(name: "OrderDeliveryModeStatus")
  String? orderDeliveryModeStatus;
  @JsonKey(name: "OrderRemarks")
  String? orderRemarks;
  @JsonKey(name: "IsPartyLocked")
  int? isPartyLocked;
  @JsonKey(name: "IsPartyLockedSoonByDist")
  int? isPartyLockedSoonByDist;

  LoginResponseStores({
    this.storeId,
    this.manticoreStoreId,
    this.distributorId,
    this.storeName,
    this.storeCode,
    this.storeApiCode,
    this.companyId,
    this.apiId,
    this.stockVisibility,
    this.dateFormat,
    this.regionId,
    this.rStockVisibility,
    this.groupStoreId,
    this.shortCode,
    this.isPartyListNotCommon,
    this.editFreeQuantity,
    this.dateformat,
    this.status,
    this.branchId,
    this.checkBranchDetails,
    this.mappingNotRequired,
    this.ismapped,
    this.doNotShowToRetailer,
    this.retailerId,
    this.partyCode,
    this.partyName,
    this.retailerName,
    this.address1,
    this.address2,
    this.city,
    this.statename,
    this.pincode,
    this.telephone,
    this.mobileNumber,
    this.email,
    this.cstNumber,
    this.licenseNumber,
    this.contactPerson,
    this.gstinNumber,
    this.spAddress1,
    this.spAddress2,
    this.area,
    this.createdBy,
    this.spCity,
    this.spPincode,
    this.spTelephone,
    this.spMobileNumber,
    this.spEmail,
    this.spcstNumber,
    this.spLicenseNumber,
    this.minItemLimit,
    this.maxItemLimit,
    this.minAmountLimit,
    this.maxAmountLimit,
    this.storeGstinNumber,
    this.orderDeliveryModeStatus,
    this.orderRemarks,
    this.isPartyLocked,
    this.isPartyLockedSoonByDist,
  });

  factory LoginResponseStores.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseStoresFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseStoresToJson(this);

  LoginResponseStores copyWith({
    int? storeId,
    String? manticoreStoreId,
    int? distributorId,
    String? storeName,
    String? storeCode,
    String? storeApiCode,
    String? companyId,
    int? apiId,
    int? stockVisibility,
    String? dateFormat,
    int? regionId,
    int? rStockVisibility,
    int? groupStoreId,
    String? shortCode,
    int? isPartyListNotCommon,
    int? editFreeQuantity,
    String? dateformat,
    String? status,
    dynamic branchId,
    dynamic checkBranchDetails,
    int? mappingNotRequired,
    int? ismapped,
    int? doNotShowToRetailer,
    String? retailerId,
    String? partyCode,
    String? partyName,
    String? retailerName,
    String? address1,
    String? address2,
    String? city,
    String? statename,
    int? pincode,
    String? telephone,
    String? mobileNumber,
    String? email,
    String? cstNumber,
    String? licenseNumber,
    String? contactPerson,
    String? gstinNumber,
    String? spAddress1,
    String? spAddress2,
    String? area,
    String? createdBy,
    String? spCity,
    String? spPincode,
    String? spTelephone,
    String? spMobileNumber,
    String? spEmail,
    String? spcstNumber,
    String? spLicenseNumber,
    String? minItemLimit,
    String? maxItemLimit,
    String? minAmountLimit,
    String? maxAmountLimit,
    String? storeGstinNumber,
    String? orderDeliveryModeStatus,
    String? orderRemarks,
  }) =>
      LoginResponseStores(
        storeId: storeId ?? this.storeId,
        manticoreStoreId: manticoreStoreId ?? this.manticoreStoreId,
        distributorId: distributorId ?? this.distributorId,
        storeName: storeName ?? this.storeName,
        storeCode: storeCode ?? this.storeCode,
        storeApiCode: storeApiCode ?? this.storeApiCode,
        companyId: companyId ?? this.companyId,
        apiId: apiId ?? this.apiId,
        stockVisibility: stockVisibility ?? this.stockVisibility,
        dateFormat: dateFormat ?? this.dateFormat,
        regionId: regionId ?? this.regionId,
        rStockVisibility: rStockVisibility ?? this.rStockVisibility,
        groupStoreId: groupStoreId ?? this.groupStoreId,
        shortCode: shortCode ?? this.shortCode,
        isPartyListNotCommon: isPartyListNotCommon ?? this.isPartyListNotCommon,
        editFreeQuantity: editFreeQuantity ?? this.editFreeQuantity,
        dateformat: dateformat ?? this.dateformat,
        status: status ?? this.status,
        branchId: branchId ?? this.branchId,
        checkBranchDetails: checkBranchDetails ?? this.checkBranchDetails,
        mappingNotRequired: mappingNotRequired ?? this.mappingNotRequired,
        ismapped: ismapped ?? this.ismapped,
        doNotShowToRetailer: doNotShowToRetailer ?? this.doNotShowToRetailer,
        retailerId: retailerId ?? this.retailerId,
        partyCode: partyCode ?? this.partyCode,
        partyName: partyName ?? this.partyName,
        retailerName: retailerName ?? this.retailerName,
        address1: address1 ?? this.address1,
        address2: address2 ?? this.address2,
        city: city ?? this.city,
        statename: statename ?? this.statename,
        pincode: pincode ?? this.pincode,
        telephone: telephone ?? this.telephone,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        email: email ?? this.email,
        cstNumber: cstNumber ?? this.cstNumber,
        licenseNumber: licenseNumber ?? this.licenseNumber,
        contactPerson: contactPerson ?? this.contactPerson,
        gstinNumber: gstinNumber ?? this.gstinNumber,
        spAddress1: spAddress1 ?? this.spAddress1,
        spAddress2: spAddress2 ?? this.spAddress2,
        area: area ?? this.area,
        createdBy: createdBy ?? this.createdBy,
        spCity: spCity ?? this.spCity,
        spPincode: spPincode ?? this.spPincode,
        spTelephone: spTelephone ?? this.spTelephone,
        spMobileNumber: spMobileNumber ?? this.spMobileNumber,
        spEmail: spEmail ?? this.spEmail,
        spcstNumber: spcstNumber ?? this.spcstNumber,
        spLicenseNumber: spLicenseNumber ?? this.spLicenseNumber,
        minItemLimit: minItemLimit ?? this.minItemLimit,
        maxItemLimit: maxItemLimit ?? this.maxItemLimit,
        minAmountLimit: minAmountLimit ?? this.minAmountLimit,
        maxAmountLimit: maxAmountLimit ?? this.maxAmountLimit,
        storeGstinNumber: storeGstinNumber ?? this.storeGstinNumber,
        orderDeliveryModeStatus:
            orderDeliveryModeStatus ?? this.orderDeliveryModeStatus,
        orderRemarks: orderRemarks ?? this.orderRemarks,
      );
}

@JsonSerializable()
class DisplayImage {
  @JsonKey(name: "RetailerImageType")
  String? retailerImageType;
  @JsonKey(name: "RetailerImageCreatedDate")
  DateTime? retailerImageCreatedDate;
  @JsonKey(name: "ImageUrl")
  String? imageUrl;

  DisplayImage({
    this.retailerImageType,
    this.retailerImageCreatedDate,
    this.imageUrl,
  });

  factory DisplayImage.fromJson(Map<String, dynamic> json) =>
      _$DisplayImageFromJson(json);

  Map<String, dynamic> toJson() => _$DisplayImageToJson(this);
}

@JsonSerializable()
class DisplayRetailer {
  @JsonKey(name: "RetailerId")
  int? retailerId;
  @JsonKey(name: "RegionId")
  int? regionId;
  @JsonKey(name: "RetailerName")
  String? retailerName;
  @JsonKey(name: "LicenseNumber")
  String? licenseNumber;
  @JsonKey(name: "SecondDLNumber")
  dynamic secondDlNumber;
  @JsonKey(name: "ThirdDLNumber")
  dynamic thirdDlNumber;
  @JsonKey(name: "BusinessType")
  int? businessType;
  @JsonKey(name: "BusinessTypeName")
  String? businessTypeName;
  @JsonKey(name: "GSTINOption")
  String? gstinOption;
  @JsonKey(name: "StateId")
  int? stateId;
  @JsonKey(name: "StateName")
  String? stateName;
  @JsonKey(name: "PanNumber")
  String? panNumber;
  @JsonKey(name: "GSTINNumber")
  String? gstinNumber;

  DisplayRetailer({
    this.retailerId,
    this.regionId,
    this.retailerName,
    this.licenseNumber,
    this.secondDlNumber,
    this.thirdDlNumber,
    this.businessType,
    this.businessTypeName,
    this.gstinOption,
    this.stateId,
    this.stateName,
    this.panNumber,
    this.gstinNumber,
  });

  factory DisplayRetailer.fromJson(Map<String, dynamic> json) =>
      _$DisplayRetailerFromJson(json);

  Map<String, dynamic> toJson() => _$DisplayRetailerToJson(this);
}

@JsonSerializable()
class RetailerPaymentConfig {
  @JsonKey(name: "RetailerId")
  int? retailerId;
  @JsonKey(name: "UserName")
  String? userName;
  @JsonKey(name: "userId")
  int? userId;
  @JsonKey(name: "BankAcNumber")
  String? bankAcNumber;
  @JsonKey(name: "BankAcName")
  String? bankAcName;
  @JsonKey(name: "BankName")
  String? bankName;
  @JsonKey(name: "IFSC")
  String? ifsc;
  @JsonKey(name: "BankAccountType")
  String? bankAccountType;
  @JsonKey(name: "UPIId")
  String? upiId;

  RetailerPaymentConfig({
    this.retailerId,
    this.userName,
    this.userId,
    this.bankAcNumber,
    this.bankAcName,
    this.bankName,
    this.ifsc,
    this.bankAccountType,
    this.upiId,
  });

  factory RetailerPaymentConfig.fromJson(Map<String, dynamic> json) =>
      _$RetailerPaymentConfigFromJson(json);

  Map<String, dynamic> toJson() => _$RetailerPaymentConfigToJson(this);
}

@JsonSerializable()
class SegmentList {
  @JsonKey(name: "Segments")
  List<String>? segments;

  SegmentList({
    this.segments,
  });

  factory SegmentList.fromJson(Map<String, dynamic> json) =>
      _$SegmentListFromJson(json);

  Map<String, dynamic> toJson() => _$SegmentListToJson(this);
}
