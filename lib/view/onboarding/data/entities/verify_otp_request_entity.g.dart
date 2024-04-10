// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpRequestEntity _$VerifyOtpRequestEntityFromJson(
        Map<String, dynamic> json) =>
    VerifyOtpRequestEntity(
      mobileNo: json['mobileno'] as String?,
      moduleName: json['modulename'] as String?,
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$VerifyOtpRequestEntityToJson(
        VerifyOtpRequestEntity instance) =>
    <String, dynamic>{
      'mobileno': instance.mobileNo,
      'modulename': instance.moduleName,
      'otp': instance.otp,
    };
