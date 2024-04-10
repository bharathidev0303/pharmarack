import '../../../data/entities/retailer_registration/mobile_number.dart';

class MobileNumberModel {
  bool? success;
  int? statusCode;
  bool? data;
  String? message;

  MobileNumberModel({this.success, this.statusCode, this.data, this.message});

  MobileNumberModel.from(MobileNumberEntity mobileNumberEntity) {
    success = mobileNumberEntity.success;
    statusCode = mobileNumberEntity.statusCode;
    message = mobileNumberEntity.message;
    data = mobileNumberEntity.data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MobileNumberModel &&
          runtimeType == other.runtimeType &&
          success == other.success &&
          statusCode == other.statusCode &&
          message == other.message &&
          data == other.data;

  @override
  int get hashCode =>
      success.hashCode ^ statusCode.hashCode ^ success.hashCode ^ data.hashCode;
}
