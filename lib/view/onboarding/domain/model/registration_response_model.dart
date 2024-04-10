import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RegistrationResponseModel {
  @JsonKey(name: 'UserId')
  int? userId;
  @JsonKey(name: 'MobileNumber')
  String? mobileNumber;

  RegistrationResponseModel({this.userId, this.mobileNumber});

  RegistrationResponseModel.fromJson(String json) {
    // userId = json['UserId'];
    mobileNumber = json;
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['MobileNumber'] = mobileNumber;
    return data.toString();
  }
}
