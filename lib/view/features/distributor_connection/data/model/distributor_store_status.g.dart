// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distributor_store_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistributorStoreStatus _$DistributorStoreStatusFromJson(
        Map<String, dynamic> json) =>
    DistributorStoreStatus(
      doNotShowToRetailer: json['DoNotShowToRetailer'] as int?,
      storeId: json['StoreId'] as int,
      storeName: json['StoreName'] as String,
      status: json['STATUS'] as String?,
      phone: json['ContactNo'] as String?,
      address: json['Address'] as String?,
    );

Map<String, dynamic> _$DistributorStoreStatusToJson(
        DistributorStoreStatus instance) =>
    <String, dynamic>{
      'StoreId': instance.storeId,
      'StoreName': instance.storeName,
      'STATUS': instance.status,
      'DoNotShowToRetailer': instance.doNotShowToRetailer,
      'ContactNo': instance.phone,
      'Address': instance.address,
    };
