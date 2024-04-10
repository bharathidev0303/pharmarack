// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_password_update_status_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckPasswordStatusEntity _$CheckPasswordStatusEntityFromJson(
        Map<String, dynamic> json) =>
    CheckPasswordStatusEntity(
      success: json['success'] as bool?,
      statusCode: json['StatusCode'] as int?,
      data: json['data'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CheckPasswordStatusEntityToJson(
        CheckPasswordStatusEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'StatusCode': instance.statusCode,
      'data': instance.data,
      'message': instance.message,
    };
