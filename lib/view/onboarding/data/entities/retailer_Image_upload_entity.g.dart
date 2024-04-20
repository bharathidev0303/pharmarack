// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retailer_Image_upload_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetailerImageUploadEntity _$RetailerImageUploadEntityFromJson(
        Map<String, dynamic> json) =>
    RetailerImageUploadEntity(
      success: json['success'] as bool?,
      statusCode: json['StatusCode'] as int?,
      data: json['data'] == null
          ? null
          : ImageUploadResponceEntity.fromJson(
              json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$RetailerImageUploadEntityToJson(
        RetailerImageUploadEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'StatusCode': instance.statusCode,
      'data': instance.data,
      'message': instance.message,
    };

ImageUploadResponceEntity _$ImageUploadResponceEntityFromJson(
        Map<String, dynamic> json) =>
    ImageUploadResponceEntity(
      imageDbPath: json['imageDbPath'] as String?,
      imageUrl: json['imageUrl'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ImageUploadResponceEntityToJson(
        ImageUploadResponceEntity instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'imageDbPath': instance.imageDbPath,
      'type': instance.type,
    };
