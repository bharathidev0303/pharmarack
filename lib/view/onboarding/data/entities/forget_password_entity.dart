import 'package:json_annotation/json_annotation.dart';

part 'forget_password_entity.g.dart';

@JsonSerializable()
class ForgetPasswordEntity {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "StatusCode")
  int statusCode;
  @JsonKey(name: "data")
  DataEntity data;
  @JsonKey(name: "message")
  String message;

  ForgetPasswordEntity({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });

  factory ForgetPasswordEntity.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ForgetPasswordEntityToJson(this);
}

@JsonSerializable()
class DataEntity {
  @JsonKey(name: "mobileNumber")
  String mobileNumber;

  DataEntity({
    required this.mobileNumber,
  });
  factory DataEntity.fromJson(Map<String, dynamic> json) =>
      _$DataEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DataEntityToJson(this);
}
