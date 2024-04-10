import 'package:json_annotation/json_annotation.dart';

part 'delete_account_otp_entity.g.dart';

@JsonSerializable()
class DeleteAccountOtpEntity {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "StatusCode")
  int statusCode;
  @JsonKey(name: "data")
  DataEntity data;
  @JsonKey(name: "message")
  String message;

  DeleteAccountOtpEntity({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });

  factory DeleteAccountOtpEntity.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountOtpEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteAccountOtpEntityToJson(this);
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
