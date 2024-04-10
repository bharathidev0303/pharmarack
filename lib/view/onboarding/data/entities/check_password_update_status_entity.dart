import 'package:json_annotation/json_annotation.dart';

part 'check_password_update_status_entity.g.dart';

@JsonSerializable()
class CheckPasswordStatusEntity {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "StatusCode")
  int? statusCode;
  @JsonKey(name: "data")
  String? data;
  @JsonKey(name: "message")
  String? message;

  CheckPasswordStatusEntity({
    this.success,
    this.statusCode,
    this.data,
    this.message,
  });

  CheckPasswordStatusEntity copyWith({
    bool? success,
    int? statusCode,
    String? data,
    String? message,
  }) =>
      CheckPasswordStatusEntity(
        success: success ?? this.success,
        statusCode: statusCode ?? this.statusCode,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory CheckPasswordStatusEntity.fromJson(Map<String, dynamic> json) =>
      _$CheckPasswordStatusEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CheckPasswordStatusEntityToJson(this);
}
