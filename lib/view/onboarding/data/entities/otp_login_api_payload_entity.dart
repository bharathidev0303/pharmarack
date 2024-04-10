import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_login_api_payload_entity.g.dart';

@JsonSerializable()
class OtpLoginApiPayloadEntity extends Equatable {
  @JsonKey(name: 'gcmregistration')
  final String? gcmRegistrationId;
  @JsonKey(name: 'appid')
  final String? appId;
  @JsonKey(name: 'NewApp')
  final String? newApp;
  @JsonKey(name: 'deviceplatform')
  final String? devicePlatform;
  @JsonKey(name: 'isotp')
  final String? isOtp;

  const OtpLoginApiPayloadEntity(
      {this.gcmRegistrationId,
      this.appId,
      this.isOtp,
      this.newApp,
      this.devicePlatform});

  factory OtpLoginApiPayloadEntity.fromJson(Map<String, dynamic> json) {
    return _$OtpLoginApiPayloadEntityFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OtpLoginApiPayloadEntityToJson(this);
  }

  @override
  String toString() {
    return jsonEncode(this);
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  bool operator ==(Object other) {
    return toString() == other.toString();
  }

  @override
  List<Object?> get props =>
      [gcmRegistrationId, appId, devicePlatform, isOtp, newApp];
}
