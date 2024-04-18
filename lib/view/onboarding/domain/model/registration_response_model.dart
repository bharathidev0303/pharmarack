import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RegistrationResponseModel {
  @JsonKey(name: 'UserId')
  int? userId;
  @JsonKey(name: 'MobileNumber')
  String? mobileNumber;
  @JsonKey(name: 'Version')
  int? version;

  RegistrationResponseModel({this.userId, this.mobileNumber, this.version});

  RegistrationResponseModel.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    mobileNumber = json['MobileNumber'];
    version = json['Version'];
  }

  String toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserId'] = userId;
    data['MobileNumber'] = mobileNumber;
    data['Version'] = version;
    return data.toString();
  }
}
