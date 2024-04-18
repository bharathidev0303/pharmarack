import 'package:json_annotation/json_annotation.dart';

part 'login_response_entity.g.dart';

@JsonSerializable()
class LoginResponseEntity {
  @JsonKey(name: "mobileNumber")
  String? mobileNumber;
  @JsonKey(name: "version")
  int? version;

  LoginResponseEntity({this.mobileNumber});

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseEntityToJson(this);
}
