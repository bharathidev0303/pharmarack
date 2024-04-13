// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stockiest_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockiestResponseEntity _$StockiestResponseEntityFromJson(
        Map<String, dynamic> json) =>
    StockiestResponseEntity(
      setDistributorPriorityId: json['SetDistributorPriorityId'] as String?,
      storeId: json['StoreId'] as int?,
      retailerId: json['RetailerId'] as int?,
      priority: json['Priority'] as int?,
      createdBy: json['CreatedBy'] as String?,
      storeName: json['StoreName'] as String?,
    );

Map<String, dynamic> _$StockiestResponseEntityToJson(
        StockiestResponseEntity instance) =>
    <String, dynamic>{
      'SetDistributorPriorityId': instance.setDistributorPriorityId,
      'StoreId': instance.storeId,
      'RetailerId': instance.retailerId,
      'Priority': instance.priority,
      'CreatedBy': instance.createdBy,
      'StoreName': instance.storeName,
    };
