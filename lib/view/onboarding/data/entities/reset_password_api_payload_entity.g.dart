// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_api_payload_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordApiPayloadEntity _$ResetPasswordApiPayloadEntityFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordApiPayloadEntity(
      mobileNumber: json['mobileNumber'] as String?,
      otp: json['otp'] as String?,
      newPassword: json['newPassword'] as String?,
    );

Map<String, dynamic> _$ResetPasswordApiPayloadEntityToJson(
        ResetPasswordApiPayloadEntity instance) =>
    <String, dynamic>{
      'mobileNumber': instance.mobileNumber,
      'otp': instance.otp,
      'newPassword': instance.newPassword,
    };
