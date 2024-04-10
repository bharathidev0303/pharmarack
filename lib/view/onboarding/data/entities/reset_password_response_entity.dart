import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response_entity.g.dart';

@JsonSerializable()
class ResetPasswordResponseEntity {
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "StatusCode")
  int? statusCode;
  @JsonKey(name: "data")
  ResetPasswordEntity? entity;
  @JsonKey(name: "message")
  String? message;

  ResetPasswordResponseEntity(
      {this.success, this.statusCode, this.entity, this.message});

  factory ResetPasswordResponseEntity.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordResponseEntityFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordResponseEntityToJson(this);
  }
}

@JsonSerializable()
class ResetPasswordEntity {
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
  @JsonKey(name: "users")
  UsersEntity? users;

  ResetPasswordEntity({
    required this.token,
    required this.expiryTime,
    required this.refreshToken,
    required this.refreshtokenExpiryTime,
    required this.gcmregistration,
    required this.users,
  });

  factory ResetPasswordEntity.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordEntityFromJson(json);
  }

  static String serialize(ResetPasswordEntity resetPasswordEntity) =>
      json.encode(resetPasswordEntity.toJson());

  static ResetPasswordEntity deserialize(String json) =>
      ResetPasswordEntity.fromJson(jsonDecode(json));

  Map<String, dynamic> toJson() {
    return _$ResetPasswordEntityToJson(this);
  }
}

@JsonSerializable()
class UsersEntity {
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
  String? telephone;
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

  UsersEntity({
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
    required this.createdBy,
    required this.createdDate,
    required this.modifiedBy,
    required this.modifiedDate,
    required this.distributorId,
    required this.telephone,
    required this.isAuthorized,
    required this.alternateMobileNumber,
    required this.alternateEmail,
    required this.isDeleted,
    required this.unauthorizationRemark,
    required this.lastIsAuthorizedStatus,
  });

  factory UsersEntity.fromJson(Map<String, dynamic> json) {
    return _$UsersEntityFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UsersEntityToJson(this);
  }
}
