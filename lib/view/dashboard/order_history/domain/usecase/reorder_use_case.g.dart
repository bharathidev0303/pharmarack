// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reorder_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReorderParam _$ReorderParamFromJson(Map<String, dynamic> json) => ReorderParam(
      orderId: json['OrderId'] as String,
      orderGuId: json['OrderGuId'] as String,
      ipAddress: json['IpAddress'] as String,
      version: json['Version'] as String,
      latitude: json['Latitude'] as String,
      longitude: json['Longitude'] as String,
      deviceName: json['DeviceName'] as String,
      deviceId: json['DeviceId'] as String,
      os: json['OS'] as String,
      androidVersion: json['AndroidVersion'] as String,
      isStoreMapped: json['IsStoreMapped'] as int,
    );

Map<String, dynamic> _$ReorderParamToJson(ReorderParam instance) =>
    <String, dynamic>{
      'OrderId': instance.orderId,
      'OrderGuId': instance.orderGuId,
      'IpAddress': instance.ipAddress,
      'Version': instance.version,
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
      'DeviceName': instance.deviceName,
      'DeviceId': instance.deviceId,
      'OS': instance.os,
      'AndroidVersion': instance.androidVersion,
      'IsStoreMapped': instance.isStoreMapped,
    };
