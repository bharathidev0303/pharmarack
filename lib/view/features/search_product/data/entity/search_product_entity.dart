import 'package:json_annotation/json_annotation.dart';

part 'search_product_entity.g.dart';

@JsonSerializable()
class SearchProductEntity {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "StatusCode")
  int statusCode;
  @JsonKey(name: "data")
  List<SearchProductListEntity> data;
  @JsonKey(name: "message")
  String message;

  SearchProductEntity({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });

  factory SearchProductEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchProductEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProductEntityToJson(this);
}

@JsonSerializable()
class SearchProductListEntity {
  @JsonKey(name: "StoreId", defaultValue: 0)
  int storeId;
  @JsonKey(name: "StoreName", defaultValue: '')
  String storeName;
  @JsonKey(name: "ProductName", defaultValue: '')
  String productName;
  @JsonKey(name: "ProductCode", defaultValue: '')
  String productCode;
  @JsonKey(name: "DisplayProductCode", defaultValue: '')
  String displayProductCode;
  @JsonKey(name: "Packing", defaultValue: '')
  String packing;
  @JsonKey(name: "MRP", defaultValue: 0)
  double mrp;
  @JsonKey(name: "PTR", defaultValue: 0)
  double ptr;
  @JsonKey(name: "Company", defaultValue: '')
  String company;
  @JsonKey(name: "CompanyCode", defaultValue: '')
  String companyCode;
  @JsonKey(name: "Scheme", defaultValue: '')
  String scheme;
  @JsonKey(name: "Stock", defaultValue: 0)
  int stock;
  @JsonKey(name: "ProductFullName", defaultValue: '')
  String productFullName;
  @JsonKey(name: "ProductLock")
  bool productLock;
  @JsonKey(name: "HiddenPTR", defaultValue: 0)
  double hiddenPtr;
  @JsonKey(name: "ShowPTR")
  bool showPtr;
  @JsonKey(name: "RShowPtr", defaultValue: 0)
  int rShowPtr;
  @JsonKey(name: "RShowPtrForAllCompanies", defaultValue: 0)
  int rShowPtrForAllCompanies;
  @JsonKey(name: "AllowMinQty", defaultValue: 0)
  int allowMinQty;
  @JsonKey(name: "AllowMaxQty", defaultValue: 0)
  int allowMaxQty;
  @JsonKey(name: "StepUpValue", defaultValue: 0)
  int stepUpValue;
  @JsonKey(name: "AllowMOQ")
  bool allowMoq;
  @JsonKey(name: "RetailerSchemePreference", defaultValue: 0)
  int retailerSchemePreference;
  @JsonKey(name: "RetailerSchemePriority", defaultValue: 0)
  int retailerSchemePriority;
  @JsonKey(name: "RegExProductName", defaultValue: '')
  String regExProductName;
  @JsonKey(name: "DisplayHalfScheme")
  bool displayHalfScheme;
  @JsonKey(name: "DisplayHalfSchemeOn", defaultValue: '')
  String? displayHalfSchemeOn;
  @JsonKey(name: "RoundOffDisplayHalfScheme", defaultValue: 0)
  int roundOffDisplayHalfScheme;
  @JsonKey(name: "RStockVisibility", defaultValue: 0)
  int rStockVisibility;
  @JsonKey(name: "IsMapped", defaultValue: 0)
  int isMapped;
  @JsonKey(name: "NonMapPartyCode", defaultValue: '')
  String nonMapPartyCode;
  @JsonKey(name: "IsShowNonMappedOrderStock", defaultValue: 0)
  int isShowNonMappedOrderStock;
  @JsonKey(name: "OrderRemarks")
  bool orderRemarks;
  @JsonKey(name: "OrderDeliveryModeStatus")
  bool orderDeliveryModeStatus;
  @JsonKey(name: "IsPartyLocked", defaultValue: '')
  String isPartyLocked;
  @JsonKey(name: "IsPartyLockedSoonByDist", defaultValue: '')
  String isPartyLockedSoonByDist;
  @JsonKey(name: "HalfSchemeValueToRetailer", defaultValue: 0)
  int halfSchemeValueToRetailer;
  @JsonKey(name: "RewardSchemeId", defaultValue: '')
  String rewardSchemeId;
  @JsonKey(name: "NetRate", defaultValue: '')
  String netRate;
  @JsonKey(name: "PrProductName", defaultValue: '')
  String prProductName;
  @JsonKey(name: "PrProductId", defaultValue: 0)
  int prProductId;
  @JsonKey(name: "AvailDistributorCount", defaultValue: 0)
  int availDistributorCount;
  @JsonKey(name: "PrRegexProductName", defaultValue: '')
  String prRegexProductName;
  @JsonKey(name: "DiscountPercentScheme,")
  dynamic discountPercentScheme;
  @JsonKey(name: "Margin", defaultValue: '')
  String margin;
  @JsonKey(name: "CashbackMessage")
  dynamic cashbackMessage;
  @JsonKey(name: "CashbackMinQuantity", defaultValue: '')
  String cashbackMinQuantity;
  @JsonKey(name: "CashbackMaxQuantity")
  dynamic cashbackMaxQuantity;
  @JsonKey(name: "CashbackTermsAndConditions")
  dynamic cashbackTermsAndConditions;
  @JsonKey(name: "StoreProductGST", defaultValue: 0)
  double storeProductGst;
  @JsonKey(name: "AvailableStoreCount", defaultValue: '')
  String availableStoreCount;
  @JsonKey(name: "RateValidity", defaultValue: '')
  String rateValidity;
  @JsonKey(name: "CompanyId")
  dynamic companyId;
  @JsonKey(name: "CompanyName")
  dynamic companyName;
  @JsonKey(name: "ExpiryDate")
  dynamic expiryDate;
  @JsonKey(name: "CashbackFromDate")
  dynamic cashbackFromDate;
  @JsonKey(name: "CashbackEndDate")
  dynamic cashbackEndDate;
  @JsonKey(name: "MobileNumber", defaultValue: '')
  String mobileNumber;
  @JsonKey(name: "MaxCashback")
  dynamic maxCashback;
  @JsonKey(name: "BrandName", defaultValue: '')
  String brandName;
  @JsonKey(name: "motherBrandCode", defaultValue: '')
  String motherBrandCode;
  @JsonKey(name: "MotherBrandName", defaultValue: '')
  String motherBrandName;
  @JsonKey(name: "ManufactureName", defaultValue: '')
  String manufactureName;
  @JsonKey(name: "DrugCategoryName", defaultValue: '')
  String drugCategoryName;
  @JsonKey(name: "SuperGroupName", defaultValue: '')
  String superGroupName;
  @JsonKey(name: "SubGroupName", defaultValue: '')
  String subGroupName;
  @JsonKey(name: "SubGroupShortCode", defaultValue: '')
  String subGroupShortCode;
  @JsonKey(name: "DrugtypeName", defaultValue: '')
  String drugtypeName;
  @JsonKey(name: "ClassName", defaultValue: '')
  String className;
  @JsonKey(name: "BrandCode", defaultValue: '')
  String brandCode;
  @JsonKey(name: "UniformProductCode", defaultValue: '')
  String uniformProductCode;
  @JsonKey(name: "TherapyName", defaultValue: '')
  String therapyName;
  @JsonKey(name: "RegionName", defaultValue: '')
  String regionName;

  SearchProductListEntity({
    required this.storeId,
    required this.storeName,
    required this.productName,
    required this.productCode,
    required this.displayProductCode,
    required this.packing,
    required this.mrp,
    required this.ptr,
    required this.company,
    required this.companyCode,
    required this.scheme,
    required this.stock,
    required this.productFullName,
    required this.productLock,
    required this.hiddenPtr,
    required this.showPtr,
    required this.rShowPtr,
    required this.rShowPtrForAllCompanies,
    required this.allowMinQty,
    required this.allowMaxQty,
    required this.stepUpValue,
    required this.allowMoq,
    required this.retailerSchemePreference,
    required this.retailerSchemePriority,
    required this.regExProductName,
    required this.displayHalfScheme,
    required this.displayHalfSchemeOn,
    required this.roundOffDisplayHalfScheme,
    required this.rStockVisibility,
    required this.isMapped,
    required this.nonMapPartyCode,
    required this.isShowNonMappedOrderStock,
    required this.orderRemarks,
    required this.orderDeliveryModeStatus,
    required this.isPartyLocked,
    required this.isPartyLockedSoonByDist,
    required this.halfSchemeValueToRetailer,
    required this.rewardSchemeId,
    required this.netRate,
    required this.prProductName,
    required this.prProductId,
    required this.availDistributorCount,
    required this.prRegexProductName,
    required this.discountPercentScheme,
    required this.margin,
    required this.cashbackMessage,
    required this.cashbackMinQuantity,
    required this.cashbackMaxQuantity,
    required this.cashbackTermsAndConditions,
    required this.storeProductGst,
    required this.availableStoreCount,
    required this.rateValidity,
    required this.companyId,
    required this.companyName,
    required this.expiryDate,
    required this.cashbackFromDate,
    required this.cashbackEndDate,
    required this.mobileNumber,
    required this.maxCashback,
    required this.brandName,
    required this.motherBrandCode,
    required this.motherBrandName,
    required this.manufactureName,
    required this.drugCategoryName,
    required this.superGroupName,
    required this.subGroupName,
    required this.subGroupShortCode,
    required this.drugtypeName,
    required this.className,
    required this.brandCode,
    required this.uniformProductCode,
    required this.therapyName,
    required this.regionName,
  });

  factory SearchProductListEntity.fromJson(Map<String, dynamic> json) =>
      _$SearchProductListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProductListEntityToJson(this);
}
