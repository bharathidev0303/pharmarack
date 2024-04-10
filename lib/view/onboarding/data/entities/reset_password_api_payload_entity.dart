import 'package:json_annotation/json_annotation.dart';

part 'reset_password_api_payload_entity.g.dart';

@JsonSerializable()
class ResetPasswordApiPayloadEntity {
  @JsonKey(name: 'mobileNumber')
  String? mobileNumber;
  @JsonKey(name: 'otp')
  String? otp;
  @JsonKey(name: 'newPassword')
  String? newPassword;

  ResetPasswordApiPayloadEntity(
      {this.mobileNumber, this.otp, this.newPassword});

  factory ResetPasswordApiPayloadEntity.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordApiPayloadEntityFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordApiPayloadEntityToJson(this);
  }
}
