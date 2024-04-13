import 'dart:convert';

class SaveDistributorPriorityResponse {
  bool success;
  int statusCode;
  bool data;
  String message;

  SaveDistributorPriorityResponse({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });

  factory SaveDistributorPriorityResponse.fromRawJson(String str) =>
      SaveDistributorPriorityResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SaveDistributorPriorityResponse.fromJson(Map<String, dynamic> json) =>
      SaveDistributorPriorityResponse(
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
