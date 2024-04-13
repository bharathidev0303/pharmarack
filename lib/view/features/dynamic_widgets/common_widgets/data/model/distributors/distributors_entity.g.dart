// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distributors_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistributorsEntity _$DistributorsEntityFromJson(Map<String, dynamic> json) =>
    DistributorsEntity(
      success: json['success'] as bool?,
      statusCode: json['StatusCode'] as int?,
      message: json['message'] as String?,
      distributors: (json['data'] as List<dynamic>?)
          ?.map((e) => DistributorsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DistributorsEntityToJson(DistributorsEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'StatusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.distributors,
    };

DistributorsItem _$DistributorsItemFromJson(Map<String, dynamic> json) =>
    DistributorsItem(
      distributorId: json['distributor_id'] as int?,
      distributorName: json['distributor_name'] as String?,
      distributorAddress1: json['distributor_address1'] as String?,
      distributorAddress2: json['distributor_address2'] as String?,
      distributorCity: json['distributor_city'] as String?,
      distributorState: json['distributor_state'] as String?,
    );

Map<String, dynamic> _$DistributorsItemToJson(DistributorsItem instance) =>
    <String, dynamic>{
      'distributor_id': instance.distributorId,
      'distributor_name': instance.distributorName,
      'distributor_address1': instance.distributorAddress1,
      'distributor_address2': instance.distributorAddress2,
      'distributor_city': instance.distributorCity,
      'distributor_state': instance.distributorState,
    };
