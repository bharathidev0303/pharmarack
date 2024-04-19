// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retailer_info_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetailerInfoEntity _$RetailerInfoEntityFromJson(Map<String, dynamic> json) =>
    RetailerInfoEntity(
      userId: json['UserId'] as int?,
      username: json['Username'] as String?,
      firstname: json['Firstname'] as String?,
      lastname: json['Lastname'] as String?,
      email: json['Email'] as String?,
      mobileNumber: json['MobileNumber'] as String?,
      telephone: json['Telephone'] as String?,
      distributorId: json['DistributorId'],
      createdBy: json['CreatedBy'] as int?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      modifiedBy: json['ModifiedBy'] as int?,
      modifiedDate: json['ModifiedDate'] == null
          ? null
          : DateTime.parse(json['ModifiedDate'] as String),
      userdetail: json['userdetail'] == null
          ? null
          : UserDetail.fromJson(json['userdetail'] as Map<String, dynamic>),
      displayRetailers: (json['DisplayRetailers'] as List<dynamic>?)
          ?.map((e) => DisplayRetailer.fromJson(e as Map<String, dynamic>))
          .toList(),
      displayImages: (json['DisplayImages'] as List<dynamic>?)
          ?.map((e) => DisplayImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      retailerPaymentConfig: (json['retailerPaymentConfig'] as List<dynamic>?)
          ?.map(
              (e) => RetailerPaymentConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      stores: (json['Stores'] as List<dynamic>?)
          ?.map((e) => LoginResponseStores.fromJson(e as Map<String, dynamic>))
          .toList(),
      segmentList: json['segmentList'] == null
          ? null
          : SegmentList.fromJson(json['segmentList'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RetailerInfoEntityToJson(RetailerInfoEntity instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'Username': instance.username,
      'Firstname': instance.firstname,
      'Lastname': instance.lastname,
      'Email': instance.email,
      'MobileNumber': instance.mobileNumber,
      'Telephone': instance.telephone,
      'DistributorId': instance.distributorId,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'ModifiedBy': instance.modifiedBy,
      'ModifiedDate': instance.modifiedDate?.toIso8601String(),
      'userdetail': instance.userdetail,
      'DisplayRetailers': instance.displayRetailers,
      'DisplayImages': instance.displayImages,
      'retailerPaymentConfig': instance.retailerPaymentConfig,
      'Stores': instance.stores,
      'segmentList': instance.segmentList,
    };

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
      userId: json['UserId'] as int?,
      address1: json['Address1'] as String?,
      address2: json['Address2'] as String?,
      city: json['City'] as String?,
      stateId: json['StateId'] as int?,
      pincode: json['Pincode'] as int?,
      createdBy: json['CreatedBy'] as int?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      modifiedBy: json['ModifiedBy'] as int?,
      modifiedDate: json['ModifiedDate'] == null
          ? null
          : DateTime.parse(json['ModifiedDate'] as String),
      mappedSalesman: json['MappedSalesman'],
      mappedSalesmanCode: json['MappedSalesmanCode'],
      gcmRegistrationId: json['GCMRegistrationId'] as String?,
      appId: json['AppId'] as int?,
      webOneSignalUserId: json['WebOneSignalUserId'],
      sessionId: json['SessionID'],
      mobileOneSignalUserId: json['MobileOneSignalUserId'],
      lastWebOneSignalUserId: json['LastWebOneSignalUserId'] as String?,
      lastMobileOneSignalUserId: json['LastMobileOneSignalUserId'] as String?,
      mobilePlatform: json['MobilePlatform'] as String?,
      gstinNumber: json['GSTINNumber'],
      startTracking: json['StartTracking'] as bool?,
      hyperTrackUserId: json['HyperTrackUserId'],
      hyperTrackGroupId: json['HyperTrackGroupId'],
      mappedDeliveryman: json['MappedDeliveryman'],
      mappedDeliverymanCode: json['MappedDeliverymanCode'],
      enableEditablePtr: json['EnableEditablePTR'] as bool?,
      alternateMobileNumbers: json['AlternateMobileNumbers'],
      alternateEmailId: json['AlternateEmailId'],
    );

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'Address1': instance.address1,
      'Address2': instance.address2,
      'City': instance.city,
      'StateId': instance.stateId,
      'Pincode': instance.pincode,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'ModifiedBy': instance.modifiedBy,
      'ModifiedDate': instance.modifiedDate?.toIso8601String(),
      'MappedSalesman': instance.mappedSalesman,
      'MappedSalesmanCode': instance.mappedSalesmanCode,
      'GCMRegistrationId': instance.gcmRegistrationId,
      'AppId': instance.appId,
      'WebOneSignalUserId': instance.webOneSignalUserId,
      'SessionID': instance.sessionId,
      'MobileOneSignalUserId': instance.mobileOneSignalUserId,
      'LastWebOneSignalUserId': instance.lastWebOneSignalUserId,
      'LastMobileOneSignalUserId': instance.lastMobileOneSignalUserId,
      'MobilePlatform': instance.mobilePlatform,
      'GSTINNumber': instance.gstinNumber,
      'StartTracking': instance.startTracking,
      'HyperTrackUserId': instance.hyperTrackUserId,
      'HyperTrackGroupId': instance.hyperTrackGroupId,
      'MappedDeliveryman': instance.mappedDeliveryman,
      'MappedDeliverymanCode': instance.mappedDeliverymanCode,
      'EnableEditablePTR': instance.enableEditablePtr,
      'AlternateMobileNumbers': instance.alternateMobileNumbers,
      'AlternateEmailId': instance.alternateEmailId,
    };

LoginResponseStores _$LoginResponseStoresFromJson(Map<String, dynamic> json) =>
    LoginResponseStores(
      storeId: json['StoreId'] as int?,
      manticoreStoreId: json['ManticoreStoreId'] as String?,
      distributorId: json['DistributorId'] as int?,
      storeName: json['StoreName'] as String?,
      storeCode: json['StoreCode'] as String?,
      storeApiCode: json['StoreApiCode'] as String?,
      companyId: json['CompanyId'] as String?,
      apiId: json['ApiId'] as int?,
      stockVisibility: json['StockVisibility'] as int?,
      dateFormat: json['DateFormat'] as String?,
      regionId: json['RegionId'] as int?,
      rStockVisibility: json['RStockVisibility'] as int?,
      groupStoreId: json['GroupStoreId'] as int?,
      shortCode: json['ShortCode'] as String?,
      isPartyListNotCommon: json['IsPartyListNotCommon'] as int?,
      editFreeQuantity: json['EditFreeQuantity'] as int?,
      dateformat: json['Dateformat'] as String?,
      status: json['Status'] as String?,
      branchId: json['BranchId'],
      checkBranchDetails: json['CheckBranchDetails'],
      mappingNotRequired: json['MappingNotRequired'] as int?,
      ismapped: json['Ismapped'] as int?,
      doNotShowToRetailer: json['DoNotShowToRetailer'] as int?,
      retailerId: json['RetailerId'] as String?,
      partyCode: json['PartyCode'] as String?,
      partyName: json['PartyName'] as String?,
      retailerName: json['RetailerName'] as String?,
      address1: json['Address1'] as String?,
      address2: json['Address2'] as String?,
      city: json['City'] as String?,
      statename: json['Statename'] as String?,
      pincode: json['Pincode'] as int?,
      telephone: json['Telephone'] as String?,
      mobileNumber: json['MobileNumber'] as String?,
      email: json['Email'] as String?,
      cstNumber: json['CSTNumber'] as String?,
      licenseNumber: json['LicenseNumber'] as String?,
      contactPerson: json['ContactPerson'] as String?,
      gstinNumber: json['GSTINNumber'] as String?,
      spAddress1: json['SPAddress1'] as String?,
      spAddress2: json['SPAddress2'] as String?,
      area: json['AREA'] as String?,
      createdBy: json['CreatedBy'] as String?,
      spCity: json['SPCity'] as String?,
      spPincode: json['SPPincode'] as String?,
      spTelephone: json['SPTelephone'] as String?,
      spMobileNumber: json['SPMobileNumber'] as String?,
      spEmail: json['SPEmail'] as String?,
      spcstNumber: json['SPCSTNumber'] as String?,
      spLicenseNumber: json['SPLicenseNumber'] as String?,
      minItemLimit: json['MinItemLimit'] as String?,
      maxItemLimit: json['MaxItemLimit'] as String?,
      minAmountLimit: json['MinAmountLimit'] as String?,
      maxAmountLimit: json['MaxAmountLimit'] as String?,
      storeGstinNumber: json['StoreGSTINNumber'] as String?,
      orderDeliveryModeStatus: json['OrderDeliveryModeStatus'] as String?,
      orderRemarks: json['OrderRemarks'] as String?,
      isPartyLocked: json['IsPartyLocked'] as int?,
      isPartyLockedSoonByDist: json['IsPartyLockedSoonByDist'] as int?,
    );

Map<String, dynamic> _$LoginResponseStoresToJson(
        LoginResponseStores instance) =>
    <String, dynamic>{
      'StoreId': instance.storeId,
      'ManticoreStoreId': instance.manticoreStoreId,
      'DistributorId': instance.distributorId,
      'StoreName': instance.storeName,
      'StoreCode': instance.storeCode,
      'StoreApiCode': instance.storeApiCode,
      'CompanyId': instance.companyId,
      'ApiId': instance.apiId,
      'StockVisibility': instance.stockVisibility,
      'DateFormat': instance.dateFormat,
      'RegionId': instance.regionId,
      'RStockVisibility': instance.rStockVisibility,
      'GroupStoreId': instance.groupStoreId,
      'ShortCode': instance.shortCode,
      'IsPartyListNotCommon': instance.isPartyListNotCommon,
      'EditFreeQuantity': instance.editFreeQuantity,
      'Dateformat': instance.dateformat,
      'Status': instance.status,
      'BranchId': instance.branchId,
      'CheckBranchDetails': instance.checkBranchDetails,
      'MappingNotRequired': instance.mappingNotRequired,
      'Ismapped': instance.ismapped,
      'DoNotShowToRetailer': instance.doNotShowToRetailer,
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
      'CSTNumber': instance.cstNumber,
      'LicenseNumber': instance.licenseNumber,
      'ContactPerson': instance.contactPerson,
      'GSTINNumber': instance.gstinNumber,
      'SPAddress1': instance.spAddress1,
      'SPAddress2': instance.spAddress2,
      'AREA': instance.area,
      'CreatedBy': instance.createdBy,
      'SPCity': instance.spCity,
      'SPPincode': instance.spPincode,
      'SPTelephone': instance.spTelephone,
      'SPMobileNumber': instance.spMobileNumber,
      'SPEmail': instance.spEmail,
      'SPCSTNumber': instance.spcstNumber,
      'SPLicenseNumber': instance.spLicenseNumber,
      'MinItemLimit': instance.minItemLimit,
      'MaxItemLimit': instance.maxItemLimit,
      'MinAmountLimit': instance.minAmountLimit,
      'MaxAmountLimit': instance.maxAmountLimit,
      'StoreGSTINNumber': instance.storeGstinNumber,
      'OrderDeliveryModeStatus': instance.orderDeliveryModeStatus,
      'OrderRemarks': instance.orderRemarks,
      'IsPartyLocked': instance.isPartyLocked,
      'IsPartyLockedSoonByDist': instance.isPartyLockedSoonByDist,
    };

DisplayImage _$DisplayImageFromJson(Map<String, dynamic> json) => DisplayImage(
      retailerImageType: json['RetailerImageType'] as String?,
      retailerImageCreatedDate: json['RetailerImageCreatedDate'] == null
          ? null
          : DateTime.parse(json['RetailerImageCreatedDate'] as String),
      imageUrl: json['ImageUrl'] as String?,
    );

Map<String, dynamic> _$DisplayImageToJson(DisplayImage instance) =>
    <String, dynamic>{
      'RetailerImageType': instance.retailerImageType,
      'RetailerImageCreatedDate':
          instance.retailerImageCreatedDate?.toIso8601String(),
      'ImageUrl': instance.imageUrl,
    };

DisplayRetailer _$DisplayRetailerFromJson(Map<String, dynamic> json) =>
    DisplayRetailer(
      retailerId: json['RetailerId'] as int?,
      regionId: json['RegionId'] as int?,
      retailerName: json['RetailerName'] as String?,
      licenseNumber: json['LicenseNumber'] as String?,
      secondDlNumber: json['SecondDLNumber'],
      thirdDlNumber: json['ThirdDLNumber'],
      businessType: json['BusinessType'] as int?,
      businessTypeName: json['BusinessTypeName'] as String?,
      gstinOption: json['GSTINOption'] as String?,
      stateId: json['StateId'] as int?,
      stateName: json['StateName'] as String?,
      panNumber: json['PanNumber'] as String?,
      gstinNumber: json['GSTINNumber'] as String?,
      isLMSActive: json['isLMSActive'] as int?,
      domainKey: json['DomainKey'] as String?,
      secretKey: json['SecretKey'] as String?,
    );

Map<String, dynamic> _$DisplayRetailerToJson(DisplayRetailer instance) =>
    <String, dynamic>{
      'RetailerId': instance.retailerId,
      'RegionId': instance.regionId,
      'RetailerName': instance.retailerName,
      'LicenseNumber': instance.licenseNumber,
      'SecondDLNumber': instance.secondDlNumber,
      'ThirdDLNumber': instance.thirdDlNumber,
      'BusinessType': instance.businessType,
      'BusinessTypeName': instance.businessTypeName,
      'GSTINOption': instance.gstinOption,
      'StateId': instance.stateId,
      'StateName': instance.stateName,
      'PanNumber': instance.panNumber,
      'GSTINNumber': instance.gstinNumber,
      'isLMSActive': instance.isLMSActive,
      'DomainKey': instance.domainKey,
      'SecretKey': instance.secretKey,
    };

RetailerPaymentConfig _$RetailerPaymentConfigFromJson(
        Map<String, dynamic> json) =>
    RetailerPaymentConfig(
      retailerId: json['RetailerId'] as int?,
      userName: json['UserName'] as String?,
      userId: json['userId'] as int?,
      bankAcNumber: json['BankAcNumber'] as String?,
      bankAcName: json['BankAcName'] as String?,
      bankName: json['BankName'] as String?,
      ifsc: json['IFSC'] as String?,
      bankAccountType: json['BankAccountType'] as String?,
      upiId: json['UPIId'] as String?,
    );

Map<String, dynamic> _$RetailerPaymentConfigToJson(
        RetailerPaymentConfig instance) =>
    <String, dynamic>{
      'RetailerId': instance.retailerId,
      'UserName': instance.userName,
      'userId': instance.userId,
      'BankAcNumber': instance.bankAcNumber,
      'BankAcName': instance.bankAcName,
      'BankName': instance.bankName,
      'IFSC': instance.ifsc,
      'BankAccountType': instance.bankAccountType,
      'UPIId': instance.upiId,
    };

SegmentList _$SegmentListFromJson(Map<String, dynamic> json) => SegmentList(
      segments: (json['Segments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SegmentListToJson(SegmentList instance) =>
    <String, dynamic>{
      'Segments': instance.segments,
    };
