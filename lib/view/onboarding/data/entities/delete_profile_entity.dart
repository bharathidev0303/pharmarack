import 'package:json_annotation/json_annotation.dart';

part 'delete_profile_entity.g.dart';

@JsonSerializable()
class DeleteProfileEntity {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "StatusCode")
  int statusCode;
  @JsonKey(name: "data")
  DataEntity data;
  @JsonKey(name: "message")
  String message;

  DeleteProfileEntity({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });

  factory DeleteProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$DeleteProfileEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteProfileEntityToJson(this);
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
