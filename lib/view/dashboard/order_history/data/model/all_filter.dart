import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'all_filter.g.dart';

AllFilter allFilterFromJson(String str) => AllFilter.fromJson(json.decode(str));

String allFilterToJson(AllFilter data) => json.encode(data.toJson());

@JsonSerializable()
class AllFilter {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "StatusCode")
  int statusCode;
  @JsonKey(name: "data")
  List<Datum> data;
  @JsonKey(name: "message")
  String message;

  AllFilter({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });

  factory AllFilter.fromJson(Map<String, dynamic> json) =>
      _$AllFilterFromJson(json);

  Map<String, dynamic> toJson() => _$AllFilterToJson(this);
}

@JsonSerializable()
class Datum {
  @JsonKey(name: "order_status_id")
  int orderStatusId;
  @JsonKey(name: "status")
  String status;

  Datum({
    required this.orderStatusId,
    required this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
