import 'package:json_annotation/json_annotation.dart';

part 'top_widgets_view_more_entity.g.dart';

@JsonSerializable()
class TopWidgetsViewMoreEntity {
  @JsonKey(name: 'success')
  final bool? success;
  @JsonKey(name: 'StatusCode')
  final int? statusCode;
  @JsonKey(name: 'data')
  final List<dynamic>? data;
  @JsonKey(name: 'message')
  final String? message;

  TopWidgetsViewMoreEntity(
      {this.success, this.statusCode, this.data, this.message});

  factory TopWidgetsViewMoreEntity.fromJson(Map<String, dynamic> json) =>
      _$TopWidgetsViewMoreEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TopWidgetsViewMoreEntityToJson(this);

  @override
  String toString() {
    return 'TopWidgetsViewMoreEntity{success: $success, statusCode: $statusCode, data: $data, message: $message}';
  }
}
