// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_login_api_payload_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpLoginApiPayloadEntity _$OtpLoginApiPayloadEntityFromJson(
        Map<String, dynamic> json) =>
    OtpLoginApiPayloadEntity(
      gcmRegistrationId: json['gcmregistration'] as String?,
      appId: json['appid'] as String?,
      isOtp: json['isotp'] as String?,
      newApp: json['NewApp'] as String?,
      devicePlatform: json['deviceplatform'] as String?,
    );

Map<String, dynamic> _$OtpLoginApiPayloadEntityToJson(
        OtpLoginApiPayloadEntity instance) =>
    <String, dynamic>{
      'gcmregistration': instance.gcmRegistrationId,
      'appid': instance.appId,
      'NewApp': instance.newApp,
      'deviceplatform': instance.devicePlatform,
      'isotp': instance.isOtp,
    };
