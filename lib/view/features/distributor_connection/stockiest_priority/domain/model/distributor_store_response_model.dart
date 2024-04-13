import 'dart:convert';

import '../../../data/model/distributor_store_status.dart';

class DistributorStoreResponseModel {
  bool success;
  int statusCode;
  List<DistributorStoreStatus> data;
  String message;

  DistributorStoreResponseModel({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });

  factory DistributorStoreResponseModel.fromRawJson(String str) =>
      DistributorStoreResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DistributorStoreResponseModel.fromJson(Map<String, dynamic> json) =>
      DistributorStoreResponseModel(
        success: json["success"],
        statusCode: json["StatusCode"],
        data: List<DistributorStoreStatus>.from(
            json["data"].map((x) => DistributorStoreStatus.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "StatusCode": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}
