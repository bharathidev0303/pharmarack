

import 'package:pharmarack/view/onboarding/data/entities/forget_password_entity.dart';

class ForgetPasswordModel {
  bool? success;
  int? statusCode;
  Data? data;
  String? message;
  ForgetPasswordModel({
    required this.success,
    required this.statusCode,
    required this.data,
    required this.message,
  });

  ForgetPasswordModel.from(ForgetPasswordEntity forgetPasswordEntity) {
    success = forgetPasswordEntity.success;
    statusCode = forgetPasswordEntity.statusCode;
    message = forgetPasswordEntity.message;
    data = Data(mobileNumber: forgetPasswordEntity.data.mobileNumber);
  }
}

class Data {
  String? mobileNumber;

  Data({
    required this.mobileNumber,
  });

  Data.from(DataEntity data) {
    mobileNumber = data.mobileNumber;
  }
}
