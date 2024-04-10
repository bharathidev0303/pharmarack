import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'verify_otp_response_entity.g.dart';

@JsonSerializable()
class VerifyOtpResponseEntity {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "expiryTime")
  String? expiryTime;
  @JsonKey(name: "refreshToken")
  String? refreshToken;
  @JsonKey(name: "refreshtokenExpiryTime")
  String? refreshtokenExpiryTime;
  @JsonKey(name: "gcmregistration")
  String? gcmregistration;
  @JsonKey(name: "userdata")
  UserData? userData;

  VerifyOtpResponseEntity(
      {this.token, this.refreshToken, this.expiryTime, this.userData});

  factory VerifyOtpResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyOtpResponseEntityToJson(this);

  static String serialize(VerifyOtpResponseEntity verifyOtpResponseEntity) =>
      json.encode(verifyOtpResponseEntity.toJson());

  static VerifyOtpResponseEntity deserialize(String json) =>
      VerifyOtpResponseEntity.fromJson(jsonDecode(json));
}

@JsonSerializable()
class UserData {
  @JsonKey(name: "UserId")
  int? userId;
  @JsonKey(name: "Username")
  String? username;
  @JsonKey(name: "FirstName")
  String? firstName;
  @JsonKey(name: "LastName")
  String? lastName;
  @JsonKey(name: "Email")
  String? email;
  @JsonKey(name: "MobileNumber")
  String? mobileNumber;
  @JsonKey(name: "CreatedBy")
  int? createdBy;
  @JsonKey(name: "CreatedDate")
  DateTime? createdDate;
  @JsonKey(name: "ModifiedBy")
  int? modifiedBy;
  @JsonKey(name: "ModifiedDate")
  DateTime? modifiedDate;
  @JsonKey(name: "DistributorId")
  dynamic distributorId;
  @JsonKey(name: "Telephone")
  dynamic telephone;
  @JsonKey(name: "IsAuthorized")
  int? isAuthorized;
  @JsonKey(name: "AlternateMobileNumber")
  dynamic alternateMobileNumber;
  @JsonKey(name: "AlternateEmail")
  dynamic alternateEmail;
  @JsonKey(name: "IsDeleted")
  bool? isDeleted;
  @JsonKey(name: "UnauthorizationRemark")
  dynamic unauthorizationRemark;
  @JsonKey(name: "LastIsAuthorizedStatus")
  int? lastIsAuthorizedStatus;

  UserData({
    this.userId,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.distributorId,
    this.telephone,
    this.isAuthorized,
    this.alternateMobileNumber,
    this.alternateEmail,
    this.isDeleted,
    this.unauthorizationRemark,
    this.lastIsAuthorizedStatus,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
