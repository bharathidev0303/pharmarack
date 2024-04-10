// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPasswordResponseEntity _$ResetPasswordResponseEntityFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordResponseEntity(
      success: json['success'] as bool?,
      statusCode: json['StatusCode'] as int?,
      entity: json['data'] == null
          ? null
          : ResetPasswordEntity.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ResetPasswordResponseEntityToJson(
        ResetPasswordResponseEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'StatusCode': instance.statusCode,
      'data': instance.entity,
      'message': instance.message,
    };

ResetPasswordEntity _$ResetPasswordEntityFromJson(Map<String, dynamic> json) =>
    ResetPasswordEntity(
      token: json['token'] as String?,
      expiryTime: json['expiryTime'] as String?,
      refreshToken: json['refreshToken'] as String?,
      refreshtokenExpiryTime: json['refreshtokenExpiryTime'] as String?,
      gcmregistration: json['gcmregistration'] as String?,
      users: json['users'] == null
          ? null
          : UsersEntity.fromJson(json['users'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResetPasswordEntityToJson(
        ResetPasswordEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiryTime': instance.expiryTime,
      'refreshToken': instance.refreshToken,
      'refreshtokenExpiryTime': instance.refreshtokenExpiryTime,
      'gcmregistration': instance.gcmregistration,
      'users': instance.users,
    };

UsersEntity _$UsersEntityFromJson(Map<String, dynamic> json) => UsersEntity(
      userId: json['UserId'] as int?,
      username: json['Username'] as String?,
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      email: json['Email'] as String?,
      mobileNumber: json['MobileNumber'] as String?,
      createdBy: json['CreatedBy'] as int?,
      createdDate: json['CreatedDate'] == null
          ? null
          : DateTime.parse(json['CreatedDate'] as String),
      modifiedBy: json['ModifiedBy'] as int?,
      modifiedDate: json['ModifiedDate'] == null
          ? null
          : DateTime.parse(json['ModifiedDate'] as String),
      distributorId: json['DistributorId'],
      telephone: json['Telephone'] as String?,
      isAuthorized: json['IsAuthorized'] as int?,
      alternateMobileNumber: json['AlternateMobileNumber'],
      alternateEmail: json['AlternateEmail'],
      isDeleted: json['IsDeleted'] as bool?,
      unauthorizationRemark: json['UnauthorizationRemark'],
      lastIsAuthorizedStatus: json['LastIsAuthorizedStatus'] as int?,
    );

Map<String, dynamic> _$UsersEntityToJson(UsersEntity instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'Username': instance.username,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'Email': instance.email,
      'MobileNumber': instance.mobileNumber,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate?.toIso8601String(),
      'ModifiedBy': instance.modifiedBy,
      'ModifiedDate': instance.modifiedDate?.toIso8601String(),
      'DistributorId': instance.distributorId,
      'Telephone': instance.telephone,
      'IsAuthorized': instance.isAuthorized,
      'AlternateMobileNumber': instance.alternateMobileNumber,
      'AlternateEmail': instance.alternateEmail,
      'IsDeleted': instance.isDeleted,
      'UnauthorizationRemark': instance.unauthorizationRemark,
      'LastIsAuthorizedStatus': instance.lastIsAuthorizedStatus,
    };
