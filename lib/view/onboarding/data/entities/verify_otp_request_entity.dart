import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_request_entity.g.dart';

@JsonSerializable()
class VerifyOtpRequestEntity {
  @JsonKey(name: "mobileno")
  String? mobileNo;
  @JsonKey(name: "modulename")
  String? moduleName;
  @JsonKey(name: "otp")
  String? otp;

  VerifyOtpRequestEntity({this.mobileNo, this.moduleName, this.otp});

  factory VerifyOtpRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpRequestEntityToJson(this);
}
