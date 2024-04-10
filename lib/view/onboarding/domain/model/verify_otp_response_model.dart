

import 'package:pharmarack/packages/common_entity/verify_otp_response_entity.dart';

class VerifyOtpResponseModel {
  String? token;
  String? refreshToken;
  String? expiryTime;

  VerifyOtpResponseModel({this.token, this.expiryTime, this.refreshToken});

  VerifyOtpResponseModel.from(VerifyOtpResponseEntity verifyOtpResponseEntity) {
    token = verifyOtpResponseEntity.token;
    refreshToken = verifyOtpResponseEntity.refreshToken;
    expiryTime = verifyOtpResponseEntity.expiryTime;
  }
}
