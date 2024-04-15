import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'cart_detail.g.dart';

@JsonSerializable()
class CartDetailEntity {
  @JsonKey(name: 'StatusCode')
  int? statusCode;
  @JsonKey(name: 'Message')
  String? message;
  @JsonKey(name: 'IList')
  List<CartListItemEntity>? cartListItem;

  CartDetailEntity(this.statusCode, this.message, this.cartListItem);

  factory CartDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$CartDetailEntityFromJson(json);

  //Map<String, dynamic> toJson() => _$CartDetailEntityToJson(this);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'StatusCode': statusCode,
        'Message': message,
        'IList': cartListItem?.map((v) => v.toJson()).toList(),
      };

  static String serialize(CartDetailEntity cartDetailEntity) =>
      json.encode(cartDetailEntity.toJson());

  static CartDetailEntity deserialize(String json) =>
      CartDetailEntity.fromJson(jsonDecode(json));
}

@JsonSerializable()
class CartListItemEntity {
  @JsonKey(name: 'StoreId')
  int? storeId;
  @JsonKey(name: 'ProductId')
  int? productId;
  @JsonKey(name: 'StoreName')
  String? storeName;
  @JsonKey(name: 'PartyCode')
  String? partyCode;
  @JsonKey(name: 'ProductCode')
  String? productCode;
  @JsonKey(name: 'RetailerId')
  int? retailerId;
  @JsonKey(name: 'Quantity')
  int? quantity;
  @JsonKey(name: 'PTR')
  double? ptr;
  @JsonKey(name: 'Free')
  int? free;
  @JsonKey(name: 'HiddenPTR')
  double? hiddenPtr;
  @JsonKey(name: 'NetRate')
  double? netRate;
  @JsonKey(name: 'Scheme')
  String? scheme;
  @JsonKey(name: 'SchemeType')
  String? schemeType;
  @JsonKey(name: 'GSTPercentage')
  double? gstPercentage;
  @JsonKey(name: 'ItemGSTValue')
  double? itemGSTValue;
  @JsonKey(name: 'CartSource')
  String? cartSource;
  @JsonKey(name: 'DeliveryOption')
  String? deliveryOption;
  @JsonKey(name: 'RemarkForStore')
  String? remarkForStore;
  @JsonKey(name: 'ProductAddedBy')
  int? productAddedBy;
  @JsonKey(name: 'Priority')
  String? priority;
  @JsonKey(name: 'OrderPlaced')
  int? orderPlaced;
  @JsonKey(name: 'OrderPlacedBy')
  int? orderPlacedBy;
  @JsonKey(name: 'CreatedBy')
  int? createdBy;
  @JsonKey(name: 'CreatedDate')
  String? createdDate;
  @JsonKey(name: 'ModifiedBy')
  int? modifiedBy;
  @JsonKey(name: 'ModifiedDate')
  String? modifiedDate;
  @JsonKey(name: 'ProductName')
  String? productName;
  @JsonKey(name: 'ProductWiseAmount')
  double? productWiseAmount;
  @JsonKey(name: 'ProductWiseGSTAmount')
  double? productWiseGSTAmount;
  @JsonKey(name: 'StoreWiseAmount')
  double? storeWiseAmount;
  @JsonKey(name: 'StoreWiseGSTAmount')
  double? storeWiseGSTAmount;
  @JsonKey(name: 'IsDeleted')
  int? isDeleted;
  @JsonKey(name: 'AllowMinQty')
  int? allowMinQty;
  @JsonKey(name: 'AllowMaxQty')
  int? allowMaxQty;
  @JsonKey(name: 'StepUpValue')
  int? stepUpValue;
  @JsonKey(name: 'AllowMOQ')
  bool? allowMOQ;
  @JsonKey(name: 'MinItemLimit')
  int? minItemLimit;
  @JsonKey(name: 'MaxItemLimit')
  int? maxItemLimit;
  @JsonKey(name: 'MinAmountLimit')
  double? minAmountLimit;
  @JsonKey(name: 'MaxAmountLimit')
  double? maxAmountLimit;
  @JsonKey(name: 'DODIsPrefenceSet')
  int? dODIsPrefenceSet;
  @JsonKey(name: 'DisplayHalfSchemeOn')
  String? displayHalfSchemeOn;
  @JsonKey(name: 'DisplayHalfScheme')
  String? displayHalfScheme;
  @JsonKey(name: 'RetailerSchemePreference')
  int? retailerSchemePreference;
  @JsonKey(name: 'HalfSchemeValueToRetailer')
  int? halfSchemeValueToRetailer;
  @JsonKey(name: 'RoundOffDisplayHS')
  String? roundOffDisplayHS;
  @JsonKey(name: 'MinOrderQuantity')
  int? minOrderQuantity;
  @JsonKey(name: 'MaxOrderQuantity')
  int? maxOrderQuantity;
  @JsonKey(name: 'IsDODProduct')
  int? isDODProduct;
  @JsonKey(name: 'OrderDeliveryModeStatus')
  int? orderDeliveryModeStatus;
  @JsonKey(name: 'OrderRemarks')
  int? orderRemarks;
  @JsonKey(name: 'DeliveryPersonList')
  List<DeliveryPersonEntity>? deliveryPersonList;
  @JsonKey(name: 'SpecialRate')
  double? specialRate;
  @JsonKey(name: 'Stock')
  int? stock;
  @JsonKey(name: 'RShowPtr')
  int? rShowPtr;
  @JsonKey(name: 'IsPartyLocked')
  int? isPartyLocked;
  @JsonKey(name: 'RewardSchemeId')
  int? rewardSchemeId;
  @JsonKey(name: 'IsProductChecked')
  int? isProductChecked;
  @JsonKey(name: 'DeliveryPerson')
  String? deliveryPerson;
  @JsonKey(name: 'DeliveryPersonCode')
  String? deliveryPersonCode;
  @JsonKey(name: 'SchemeFrom')
  String? schemeFrom;
  @JsonKey(name: 'SchemeTo')
  String? schemeTo;
  @JsonKey(name: 'DateFormat')
  String? dateFormat;
  @JsonKey(name: 'RShowPtrForAllCompanies')
  int? rShowPtrForAllCompanies;
  @JsonKey(name: 'Company')
  String? company;
  @JsonKey(name: 'IsGroupWisePTR')
  int? isGroupWisePTR;
  @JsonKey(name: 'IsGroupWisePTRRetailer')
  int? isGroupWisePTRRetailer;
  @JsonKey(name: 'RateValidity')
  int? rateValidity;
  @JsonKey(name: 'MRP')
  String? mrp;

  CartListItemEntity(
    this.storeId,
    this.productId,
    this.storeName,
    this.partyCode,
    this.productCode,
    this.retailerId,
    this.quantity,
    this.ptr,
    this.free,
    this.hiddenPtr,
    this.netRate,
    this.scheme,
    this.schemeType,
    this.gstPercentage,
    this.itemGSTValue,
    this.cartSource,
    this.deliveryOption,
    this.remarkForStore,
    this.productAddedBy,
    this.priority,
    this.orderPlaced,
    this.orderPlacedBy,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.productName,
    this.productWiseAmount,
    this.productWiseGSTAmount,
    this.storeWiseAmount,
    this.storeWiseGSTAmount,
    this.isDeleted,
    this.allowMinQty,
    this.allowMaxQty,
    this.stepUpValue,
    this.allowMOQ,
    this.minItemLimit,
    this.maxItemLimit,
    this.minAmountLimit,
    this.maxAmountLimit,
    this.dODIsPrefenceSet,
    this.displayHalfSchemeOn,
    this.displayHalfScheme,
    this.retailerSchemePreference,
    this.halfSchemeValueToRetailer,
    this.roundOffDisplayHS,
    this.minOrderQuantity,
    this.maxOrderQuantity,
    this.isDODProduct,
    this.orderDeliveryModeStatus,
    this.orderRemarks,
    this.deliveryPersonList,
    this.specialRate,
    this.stock,
    this.rShowPtr,
    this.isPartyLocked,
    this.rewardSchemeId,
    this.isProductChecked,
    this.deliveryPerson,
    this.deliveryPersonCode,
    this.schemeFrom,
    this.schemeTo,
    this.dateFormat,
    this.rShowPtrForAllCompanies,
    this.company,
    this.isGroupWisePTR,
    this.isGroupWisePTRRetailer,
    this.rateValidity,
    this.mrp,
  );

  factory CartListItemEntity.fromJson(Map<String, dynamic> json) =>
      _$CartListItemEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CartListItemEntityToJson(this);

  static String serialize(CartListItemEntity cartListItemEntity) =>
      json.encode(cartListItemEntity.toJson());

  static CartListItemEntity deserialize(String json) =>
      CartListItemEntity.fromJson(jsonDecode(json));
}

@JsonSerializable()
class DeliveryPersonEntity {
  @JsonKey(name: 'StoreSalesmanId')
  int? storeSalesmanId;
  @JsonKey(name: 'StoreId')
  int? storeId;
  @JsonKey(name: 'SalesmanName')
  String? salesmanName;
  @JsonKey(name: 'SalesmanCode')
  String? salesmanCode;
  @JsonKey(name: 'CreatedBy')
  int? createdBy;
  @JsonKey(name: 'CreatedDate')
  String? createdDate;
  @JsonKey(name: 'ModifiedBy')
  int? modifiedBy;
  @JsonKey(name: 'ModifiedDate')
  String? modifiedDate;
  @JsonKey(name: 'Store')
  String? store;

  DeliveryPersonEntity(
    this.storeSalesmanId,
    this.storeId,
    this.salesmanName,
    this.salesmanCode,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.store,
  );

  factory DeliveryPersonEntity.fromJson(Map<String, dynamic> json) =>
      _$DeliveryPersonEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryPersonEntityToJson(this);

  static String serialize(DeliveryPersonEntity deliveryPersonEntity) =>
      json.encode(deliveryPersonEntity.toJson());

  static DeliveryPersonEntity deserialize(String json) =>
      DeliveryPersonEntity.fromJson(jsonDecode(json));
}
