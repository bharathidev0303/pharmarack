// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapped_settings_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MappedSettingsEntity _$MappedSettingsEntityFromJson(
        Map<String, dynamic> json) =>
    MappedSettingsEntity(
      mappedFulfillmentPartnerList: (json['MappedFulfillmentPartnerList']
              as List<dynamic>?)
          ?.map((e) =>
              MappedFulfillmentPartnerList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MappedSettingsEntityToJson(
        MappedSettingsEntity instance) =>
    <String, dynamic>{
      'MappedFulfillmentPartnerList': instance.mappedFulfillmentPartnerList,
    };

MappedFulfillmentPartnerList _$MappedFulfillmentPartnerListFromJson(
        Map<String, dynamic> json) =>
    MappedFulfillmentPartnerList(
      fPlist: json['FPlist'],
      retailerId: json['RetailerId'] as int?,
      fulfillmentPartnerId: json['FulfillmentPartnerId'] as int?,
      fulfillmentPartnerName: json['FulfillmentPartnerName'] as String?,
      city: json['City'] as String?,
      mobileNumber: json['MobileNumber'] as String?,
      address2: json['Address2'] as String?,
      isShowViewOrder: json['IsShowViewOrder'] as bool?,
      isShowPlaceOrder: json['IsShowPlaceOrder'] as bool?,
      isShowLogistics: json['IsShowLogistics'] as bool?,
      isShowPurchesReturn: json['IsShowPurchesReturn'] as bool?,
      isShowOutstanding: json['IsShowOutstanding'] as bool?,
      regionName: json['RegionName'],
      regions: json['Regions'],
      enabledSettings: json['EnabledSettings'],
      dataforController: json['dataforController'],
      fPSelectList: json['FPSelectList'],
    );

Map<String, dynamic> _$MappedFulfillmentPartnerListToJson(
        MappedFulfillmentPartnerList instance) =>
    <String, dynamic>{
      'FPlist': instance.fPlist,
      'RetailerId': instance.retailerId,
      'FulfillmentPartnerId': instance.fulfillmentPartnerId,
      'FulfillmentPartnerName': instance.fulfillmentPartnerName,
      'City': instance.city,
      'MobileNumber': instance.mobileNumber,
      'Address2': instance.address2,
      'IsShowViewOrder': instance.isShowViewOrder,
      'IsShowPlaceOrder': instance.isShowPlaceOrder,
      'IsShowLogistics': instance.isShowLogistics,
      'IsShowPurchesReturn': instance.isShowPurchesReturn,
      'IsShowOutstanding': instance.isShowOutstanding,
      'RegionName': instance.regionName,
      'Regions': instance.regions,
      'EnabledSettings': instance.enabledSettings,
      'dataforController': instance.dataforController,
      'FPSelectList': instance.fPSelectList,
    };
