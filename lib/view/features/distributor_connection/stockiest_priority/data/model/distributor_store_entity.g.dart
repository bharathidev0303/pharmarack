// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distributor_store_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistributorStoreEntity _$DistributorStoreEntityFromJson(
        Map<String, dynamic> json) =>
    DistributorStoreEntity(
      storeId: json['StoreId'] as int?,
      storeName: json['StoreName'] as String?,
      status: json['Status'] as String?,
      phone: json['Phone'] as String?,
      address: json['Address'] as String?,
    );

Map<String, dynamic> _$DistributorStoreEntityToJson(
        DistributorStoreEntity instance) =>
    <String, dynamic>{
      'StoreId': instance.storeId,
      'StoreName': instance.storeName,
      'Status': instance.status,
      'Phone': instance.phone,
      'Address': instance.address,
    };
