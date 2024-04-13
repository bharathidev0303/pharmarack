// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDetailEntity _$CartDetailEntityFromJson(Map<String, dynamic> json) =>
    CartDetailEntity(
      json['StatusCode'] as int?,
      json['Message'] as String?,
      (json['IList'] as List<dynamic>?)
          ?.map((e) => CartListItemEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartDetailEntityToJson(CartDetailEntity instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'Message': instance.message,
      'IList': instance.cartListItem,
    };

CartListItemEntity _$CartListItemEntityFromJson(Map<String, dynamic> json) =>
    CartListItemEntity(
      json['StoreId'] as int?,
      json['ProductId'] as int?,
      json['StoreName'] as String?,
      json['PartyCode'] as String?,
      json['ProductCode'] as String?,
      json['RetailerId'] as int?,
      json['Quantity'] as int?,
      (json['PTR'] as num?)?.toDouble(),
      json['Free'] as int?,
      (json['HiddenPTR'] as num?)?.toDouble(),
      (json['NetRate'] as num?)?.toDouble(),
      json['Scheme'] as String?,
      json['SchemeType'] as String?,
      (json['GSTPercentage'] as num?)?.toDouble(),
      (json['ItemGSTValue'] as num?)?.toDouble(),
      json['CartSource'] as String?,
      json['DeliveryOption'] as String?,
      json['RemarkForStore'] as String?,
      json['ProductAddedBy'] as int?,
      json['Priority'] as String?,
      json['OrderPlaced'] as int?,
      json['OrderPlacedBy'] as int?,
      json['CreatedBy'] as int?,
      json['CreatedDate'] as String?,
      json['ModifiedBy'] as int?,
      json['ModifiedDate'] as String?,
      json['ProductName'] as String?,
      (json['ProductWiseAmount'] as num?)?.toDouble(),
      (json['ProductWiseGSTAmount'] as num?)?.toDouble(),
      (json['StoreWiseAmount'] as num?)?.toDouble(),
      (json['StoreWiseGSTAmount'] as num?)?.toDouble(),
      json['IsDeleted'] as int?,
      json['AllowMinQty'] as int?,
      json['AllowMaxQty'] as int?,
      json['StepUpValue'] as int?,
      json['AllowMOQ'] as bool?,
      json['MinItemLimit'] as int?,
      json['MaxItemLimit'] as int?,
      (json['MinAmountLimit'] as num?)?.toDouble(),
      (json['MaxAmountLimit'] as num?)?.toDouble(),
      json['DODIsPrefenceSet'] as int?,
      json['DisplayHalfSchemeOn'] as String?,
      json['DisplayHalfScheme'] as String?,
      json['RetailerSchemePreference'] as int?,
      json['HalfSchemeValueToRetailer'] as int?,
      json['RoundOffDisplayHS'] as String?,
      json['MinOrderQuantity'] as int?,
      json['MaxOrderQuantity'] as int?,
      json['IsDODProduct'] as int?,
      json['OrderDeliveryModeStatus'] as int?,
      json['OrderRemarks'] as int?,
      (json['DeliveryPersonList'] as List<dynamic>?)
          ?.map((e) => DeliveryPersonEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['SpecialRate'] as num?)?.toDouble(),
      json['Stock'] as int?,
      json['RShowPtr'] as int?,
      json['IsPartyLocked'] as int?,
      json['RewardSchemeId'] as int?,
      json['IsProductChecked'] as int?,
      json['DeliveryPerson'] as String?,
      json['DeliveryPersonCode'] as String?,
      json['SchemeFrom'] as String?,
      json['SchemeTo'] as String?,
      json['DateFormat'] as String?,
      json['RShowPtrForAllCompanies'] as int?,
      json['Company'] as String?,
      json['IsGroupWisePTR'] as int?,
      json['IsGroupWisePTRRetailer'] as int?,
      json['RateValidity'] as int?,
      json['MRP'] as String?,
    );

Map<String, dynamic> _$CartListItemEntityToJson(CartListItemEntity instance) =>
    <String, dynamic>{
      'StoreId': instance.storeId,
      'ProductId': instance.productId,
      'StoreName': instance.storeName,
      'PartyCode': instance.partyCode,
      'ProductCode': instance.productCode,
      'RetailerId': instance.retailerId,
      'Quantity': instance.quantity,
      'PTR': instance.ptr,
      'Free': instance.free,
      'HiddenPTR': instance.hiddenPtr,
      'NetRate': instance.netRate,
      'Scheme': instance.scheme,
      'SchemeType': instance.schemeType,
      'GSTPercentage': instance.gstPercentage,
      'ItemGSTValue': instance.itemGSTValue,
      'CartSource': instance.cartSource,
      'DeliveryOption': instance.deliveryOption,
      'RemarkForStore': instance.remarkForStore,
      'ProductAddedBy': instance.productAddedBy,
      'Priority': instance.priority,
      'OrderPlaced': instance.orderPlaced,
      'OrderPlacedBy': instance.orderPlacedBy,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'ModifiedBy': instance.modifiedBy,
      'ModifiedDate': instance.modifiedDate,
      'ProductName': instance.productName,
      'ProductWiseAmount': instance.productWiseAmount,
      'ProductWiseGSTAmount': instance.productWiseGSTAmount,
      'StoreWiseAmount': instance.storeWiseAmount,
      'StoreWiseGSTAmount': instance.storeWiseGSTAmount,
      'IsDeleted': instance.isDeleted,
      'AllowMinQty': instance.allowMinQty,
      'AllowMaxQty': instance.allowMaxQty,
      'StepUpValue': instance.stepUpValue,
      'AllowMOQ': instance.allowMOQ,
      'MinItemLimit': instance.minItemLimit,
      'MaxItemLimit': instance.maxItemLimit,
      'MinAmountLimit': instance.minAmountLimit,
      'MaxAmountLimit': instance.maxAmountLimit,
      'DODIsPrefenceSet': instance.dODIsPrefenceSet,
      'DisplayHalfSchemeOn': instance.displayHalfSchemeOn,
      'DisplayHalfScheme': instance.displayHalfScheme,
      'RetailerSchemePreference': instance.retailerSchemePreference,
      'HalfSchemeValueToRetailer': instance.halfSchemeValueToRetailer,
      'RoundOffDisplayHS': instance.roundOffDisplayHS,
      'MinOrderQuantity': instance.minOrderQuantity,
      'MaxOrderQuantity': instance.maxOrderQuantity,
      'IsDODProduct': instance.isDODProduct,
      'OrderDeliveryModeStatus': instance.orderDeliveryModeStatus,
      'OrderRemarks': instance.orderRemarks,
      'DeliveryPersonList': instance.deliveryPersonList,
      'SpecialRate': instance.specialRate,
      'Stock': instance.stock,
      'RShowPtr': instance.rShowPtr,
      'IsPartyLocked': instance.isPartyLocked,
      'RewardSchemeId': instance.rewardSchemeId,
      'IsProductChecked': instance.isProductChecked,
      'DeliveryPerson': instance.deliveryPerson,
      'DeliveryPersonCode': instance.deliveryPersonCode,
      'SchemeFrom': instance.schemeFrom,
      'SchemeTo': instance.schemeTo,
      'DateFormat': instance.dateFormat,
      'RShowPtrForAllCompanies': instance.rShowPtrForAllCompanies,
      'Company': instance.company,
      'IsGroupWisePTR': instance.isGroupWisePTR,
      'IsGroupWisePTRRetailer': instance.isGroupWisePTRRetailer,
      'RateValidity': instance.rateValidity,
      'MRP': instance.mrp,
    };

DeliveryPersonEntity _$DeliveryPersonEntityFromJson(
        Map<String, dynamic> json) =>
    DeliveryPersonEntity(
      json['StoreSalesmanId'] as int?,
      json['StoreId'] as int?,
      json['SalesmanName'] as String?,
      json['SalesmanCode'] as String?,
      json['CreatedBy'] as int?,
      json['CreatedDate'] as String?,
      json['ModifiedBy'] as int?,
      json['ModifiedDate'] as String?,
      json['Store'] as String?,
    );

Map<String, dynamic> _$DeliveryPersonEntityToJson(
        DeliveryPersonEntity instance) =>
    <String, dynamic>{
      'StoreSalesmanId': instance.storeSalesmanId,
      'StoreId': instance.storeId,
      'SalesmanName': instance.salesmanName,
      'SalesmanCode': instance.salesmanCode,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'ModifiedBy': instance.modifiedBy,
      'ModifiedDate': instance.modifiedDate,
      'Store': instance.store,
    };
