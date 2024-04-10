// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyOtpResponseEntity _$VerifyOtpResponseEntityFromJson(
        Map<String, dynamic> json) =>
    VerifyOtpResponseEntity(
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      expiryTime: json['expiryTime'] as String?,
      userData: json['userdata'] == null
          ? null
          : UserData.fromJson(json['userdata'] as Map<String, dynamic>),
    )
      ..refreshtokenExpiryTime = json['refreshtokenExpiryTime'] as String?
      ..gcmregistration = json['gcmregistration'] as String?;

Map<String, dynamic> _$VerifyOtpResponseEntityToJson(
        VerifyOtpResponseEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiryTime': instance.expiryTime,
      'refreshToken': instance.refreshToken,
      'refreshtokenExpiryTime': instance.refreshtokenExpiryTime,
      'gcmregistration': instance.gcmregistration,
      'userdata': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
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
      telephone: json['Telephone'],
      isAuthorized: json['IsAuthorized'] as int?,
      alternateMobileNumber: json['AlternateMobileNumber'],
      alternateEmail: json['AlternateEmail'],
      isDeleted: json['IsDeleted'] as bool?,
      unauthorizationRemark: json['UnauthorizationRemark'],
      lastIsAuthorizedStatus: json['LastIsAuthorizedStatus'] as int?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
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
