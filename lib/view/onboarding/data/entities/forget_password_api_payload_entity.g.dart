// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_api_payload_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordApiPayloadEntity _$ForgetPasswordApiPayloadEntityFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordApiPayloadEntity(
      mobileNumber: json['mobileNumber'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$ForgetPasswordApiPayloadEntityToJson(
        ForgetPasswordApiPayloadEntity instance) =>
    <String, dynamic>{
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
    };
