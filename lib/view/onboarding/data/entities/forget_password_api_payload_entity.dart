import 'package:json_annotation/json_annotation.dart';

part 'forget_password_api_payload_entity.g.dart';

@JsonSerializable()
class ForgetPasswordApiPayloadEntity {
  @JsonKey(name: 'mobileNumber')
  String? mobileNumber;
  @JsonKey(name: 'email')
  String? email;

  ForgetPasswordApiPayloadEntity({this.mobileNumber, this.email});

  factory ForgetPasswordApiPayloadEntity.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordApiPayloadEntityFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ForgetPasswordApiPayloadEntityToJson(this);
  }
}
