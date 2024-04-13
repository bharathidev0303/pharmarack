import 'dart:convert';

class SaveRetailerStoreResponse {
  bool success;
  int statusCode;
  dynamic data;
  String message;

  SaveRetailerStoreResponse({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });

  factory SaveRetailerStoreResponse.fromRawJson(String str) =>
      SaveRetailerStoreResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SaveRetailerStoreResponse.fromJson(Map<String, dynamic> json) =>
      SaveRetailerStoreResponse(
        success: json["success"],
        statusCode: json["StatusCode"],
        data: json["data"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "StatusCode": statusCode,
        "data": data,
        "message": message,
      };
}
