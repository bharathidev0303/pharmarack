

class DeleteAccountOtpModel {
  bool? success;
  int? statusCode;
  Data? data;
  String? message;

  DeleteAccountOtpModel({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });

  factory DeleteAccountOtpModel.fromJson(Map<String, dynamic> json) {
    return DeleteAccountOtpModel(
      success: json['success'] as bool?,
      statusCode: json['statusCode'] as int?,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      message: json['message'] as String?,
    );
  }
}

class Data {
  String? mobileNumber;

  Data({
    required this.mobileNumber,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      mobileNumber: json['mobileNumber'] as String?,
    );
  }
}
