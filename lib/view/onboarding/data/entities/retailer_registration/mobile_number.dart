import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MobileNumberEntity {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "StatusCode")
  int? statusCode;
  @JsonKey(name: "data")
  bool? data;
  @JsonKey(name: "message")
  String? message;

  MobileNumberEntity({
    this.success,
    this.statusCode,
    this.data,
    this.message,
  });

  MobileNumberEntity.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['StatusCode'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['StatusCode'] = statusCode;
    data['data'] = data;
    data['message'] = message;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MobileNumberEntity &&
          runtimeType == other.runtimeType &&
          success == other.success &&
          statusCode == other.statusCode &&
          message == other.message &&
          data == other.data;

  @override
  int get hashCode =>
      success.hashCode ^ statusCode.hashCode ^ success.hashCode ^ data.hashCode;
}
