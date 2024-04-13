import 'dart:convert';

import 'package:pharmarack/view/features/distributor_connection/data/model/store_status_mapping_request_model.dart';

class MultipleStoreMappingResponseModel {
  bool success;
  int statusCode;
  List<StoreStatusMappingRequestModel> data;
  String message;

  MultipleStoreMappingResponseModel({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });

  factory MultipleStoreMappingResponseModel.fromRawJson(String str) =>
      MultipleStoreMappingResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MultipleStoreMappingResponseModel.fromJson(
          Map<String, dynamic> json) =>
      MultipleStoreMappingResponseModel(
        success: json["success"],
        statusCode: json["StatusCode"],
        data: List<StoreStatusMappingRequestModel>.from(json["data"]
            .map((x) => StoreStatusMappingRequestModel.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "StatusCode": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}
