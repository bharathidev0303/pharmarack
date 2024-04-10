// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordEntity _$ForgetPasswordEntityFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordEntity(
      success: json['success'] as bool,
      statusCode: json['StatusCode'] as int,
      data: DataEntity.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ForgetPasswordEntityToJson(
        ForgetPasswordEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'StatusCode': instance.statusCode,
      'data': instance.data,
      'message': instance.message,
    };

DataEntity _$DataEntityFromJson(Map<String, dynamic> json) => DataEntity(
      mobileNumber: json['mobileNumber'] as String,
    );

Map<String, dynamic> _$DataEntityToJson(DataEntity instance) =>
    <String, dynamic>{
      'mobileNumber': instance.mobileNumber,
    };
