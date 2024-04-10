// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_account_otp_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteAccountOtpEntity _$DeleteAccountOtpEntityFromJson(
        Map<String, dynamic> json) =>
    DeleteAccountOtpEntity(
      success: json['success'] as bool,
      statusCode: json['StatusCode'] as int,
      data: DataEntity.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$DeleteAccountOtpEntityToJson(
        DeleteAccountOtpEntity instance) =>
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
