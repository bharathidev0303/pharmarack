import 'dart:convert';

import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/model/stockiest_entity.dart';

class StockiestPriorityResponseModel {
  bool success;
  int statusCode;
  List<StockiestResponseEntity> data;
  String message;

  StockiestPriorityResponseModel({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });

  factory StockiestPriorityResponseModel.fromRawJson(String str) =>
      StockiestPriorityResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StockiestPriorityResponseModel.fromJson(Map<String, dynamic> json) =>
      StockiestPriorityResponseModel(
        success: json["success"],
        statusCode: json["StatusCode"],
        data: List<StockiestResponseEntity>.from(
            json["data"].map((x) => StockiestResponseEntity.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "StatusCode": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}
