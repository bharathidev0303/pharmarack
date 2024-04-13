import 'package:json_annotation/json_annotation.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/endpoints_constants/fulfilment_partner_options.dart';

part 'mapped_settings_entity.g.dart';

@JsonSerializable()
class MappedSettingsEntity {
  @JsonKey(name: FulfilmentPartnerOptions.mappedFulfillmentPartnerList)
  List<MappedFulfillmentPartnerList>? mappedFulfillmentPartnerList;

  MappedSettingsEntity({
    this.mappedFulfillmentPartnerList,
  });

  factory MappedSettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$MappedSettingsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MappedSettingsEntityToJson(this);

  MappedSettingsEntity copyWith({
    List<MappedFulfillmentPartnerList>? mappedFulfillmentPartnerList,
  }) {
    return MappedSettingsEntity(
      mappedFulfillmentPartnerList:
          mappedFulfillmentPartnerList ?? this.mappedFulfillmentPartnerList,
    );
  }
}

@JsonSerializable()
class MappedFulfillmentPartnerList {
  @JsonKey(name: FulfilmentPartnerOptions.fPlist)
  dynamic fPlist;
  @JsonKey(name: FulfilmentPartnerOptions.retailerId)
  int? retailerId;
  @JsonKey(name: FulfilmentPartnerOptions.fulfillmentPartnerId)
  int? fulfillmentPartnerId;
  @JsonKey(name: FulfilmentPartnerOptions.fulfillmentPartnerName)
  String? fulfillmentPartnerName;
  @JsonKey(name: FulfilmentPartnerOptions.city)
  String? city;
  @JsonKey(name: FulfilmentPartnerOptions.mobileNumber)
  String? mobileNumber;
  @JsonKey(name: FulfilmentPartnerOptions.address2)
  String? address2;
  @JsonKey(name: FulfilmentPartnerOptions.isShowViewOrder)
  bool? isShowViewOrder;
  @JsonKey(name: FulfilmentPartnerOptions.isShowPlaceOrder)
  bool? isShowPlaceOrder;
  @JsonKey(name: FulfilmentPartnerOptions.isShowLogistics)
  bool? isShowLogistics;
  @JsonKey(name: FulfilmentPartnerOptions.isShowPurchesReturn)
  bool? isShowPurchesReturn;
  @JsonKey(name: FulfilmentPartnerOptions.isShowOutstanding)
  bool? isShowOutstanding;
  @JsonKey(name: FulfilmentPartnerOptions.regionName)
  dynamic regionName;
  @JsonKey(name: FulfilmentPartnerOptions.regions)
  dynamic regions;
  @JsonKey(name: FulfilmentPartnerOptions.enabledSettings)
  dynamic enabledSettings;
  @JsonKey(name: FulfilmentPartnerOptions.dataforController)
  dynamic dataforController;
  @JsonKey(name: FulfilmentPartnerOptions.fPSelectList)
  dynamic fPSelectList;

  MappedFulfillmentPartnerList({
    this.fPlist,
    this.retailerId,
    this.fulfillmentPartnerId,
    this.fulfillmentPartnerName,
    this.city,
    this.mobileNumber,
    this.address2,
    this.isShowViewOrder,
    this.isShowPlaceOrder,
    this.isShowLogistics,
    this.isShowPurchesReturn,
    this.isShowOutstanding,
    this.regionName,
    this.regions,
    this.enabledSettings,
    this.dataforController,
    this.fPSelectList,
  });

  factory MappedFulfillmentPartnerList.fromJson(Map<String, dynamic> json) =>
      _$MappedFulfillmentPartnerListFromJson(json);

  Map<String, dynamic> toJson() => _$MappedFulfillmentPartnerListToJson(this);

  MappedFulfillmentPartnerList copyWith({
    dynamic fPlist,
    int? retailerId,
    int? fulfillmentPartnerId,
    String? fulfillmentPartnerName,
    String? city,
    String? mobileNumber,
    String? address2,
    bool? isShowViewOrder,
    bool? isShowPlaceOrder,
    bool? isShowLogistics,
    bool? isShowPurchesReturn,
    bool? isShowOutstanding,
    dynamic regionName,
    dynamic regions,
    dynamic enabledSettings,
    dynamic dataforController,
    dynamic fPSelectList,
  }) {
    return MappedFulfillmentPartnerList(
      fPlist: fPlist ?? this.fPlist,
      retailerId: retailerId ?? this.retailerId,
      fulfillmentPartnerId: fulfillmentPartnerId ?? this.fulfillmentPartnerId,
      fulfillmentPartnerName:
          fulfillmentPartnerName ?? this.fulfillmentPartnerName,
      city: city ?? this.city,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      address2: address2 ?? this.address2,
      isShowViewOrder: isShowViewOrder ?? this.isShowViewOrder,
      isShowPlaceOrder: isShowPlaceOrder ?? this.isShowPlaceOrder,
      isShowLogistics: isShowLogistics ?? this.isShowLogistics,
      isShowPurchesReturn: isShowPurchesReturn ?? this.isShowPurchesReturn,
      isShowOutstanding: isShowOutstanding ?? this.isShowOutstanding,
      regionName: regionName ?? this.regionName,
      regions: regions ?? this.regions,
      enabledSettings: enabledSettings ?? this.enabledSettings,
      dataforController: dataforController ?? this.dataforController,
      fPSelectList: fPSelectList ?? this.fPSelectList,
    );
  }
}
