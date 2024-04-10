import 'package:json_annotation/json_annotation.dart';

part 'common_response_entity.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CommonResponseEntity<T> {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "data")
  T? data;
  @JsonKey(name: "message")
  String? message;

  CommonResponseEntity({this.success, this.data, this.message});

  factory CommonResponseEntity.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CommonResponseEntityFromJson(json, fromJsonT);

  Map<String, dynamic> toJson({Object Function(dynamic value)? toJsonT}) =>
      _$CommonResponseEntityToJson(this, toJsonT!);
}
