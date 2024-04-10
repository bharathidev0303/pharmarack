

import 'package:pharmarack/view/onboarding/data/entities/reset_password_response_entity.dart';

class ResetPasswordResponse {
  bool? success;
  int? statusCode;
  ResetPasswordModel? resetPasswordModel;
  String? message;

  ResetPasswordResponse(
      {this.success, this.statusCode, this.resetPasswordModel, this.message});

  ResetPasswordResponse.from(ResetPasswordResponseEntity r) {
    success = r.success;
    statusCode = r.statusCode;
    message = r.message;
    resetPasswordModel = ResetPasswordModel(
      token: r.entity?.token,
      expiryTime: r.entity?.expiryTime,
      refreshToken: r.entity?.refreshToken,
      refreshtokenExpiryTime: r.entity?.refreshtokenExpiryTime,
      gcmregistration: r.entity?.gcmregistration,
      users: UsersModel(
        userId: r.entity?.users?.userId,
        username: r.entity?.users?.username,
        firstName: r.entity?.users?.firstName,
        lastName: r.entity?.users?.lastName,
        email: r.entity?.users?.email,
        mobileNumber: r.entity?.users?.mobileNumber,
        createdBy: r.entity?.users?.createdBy,
        createdDate: r.entity?.users?.createdDate,
        modifiedBy: r.entity?.users?.modifiedBy,
        modifiedDate: r.entity?.users?.modifiedDate,
        distributorId: r.entity?.users?.distributorId,
        telephone: r.entity?.users?.telephone,
        isAuthorized: r.entity?.users?.isAuthorized,
        alternateMobileNumber: r.entity?.users?.alternateMobileNumber,
        alternateEmail: r.entity?.users?.alternateEmail,
        isDeleted: r.entity?.users?.isDeleted,
        unauthorizationRemark: r.entity?.users?.unauthorizationRemark,
        lastIsAuthorizedStatus: r.entity?.users?.lastIsAuthorizedStatus,
      ),
    );
  }
}

class ResetPasswordModel {
  String? token;
  String? expiryTime;
  String? refreshToken;
  String? refreshtokenExpiryTime;
  String? gcmregistration;
  UsersModel? users;

  ResetPasswordModel({
    required this.token,
    required this.expiryTime,
    required this.refreshToken,
    required this.refreshtokenExpiryTime,
    required this.gcmregistration,
    required this.users,
  });
}

class UsersModel {
  int? userId;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  int? createdBy;
  DateTime? createdDate;
  int? modifiedBy;
  DateTime? modifiedDate;
  dynamic distributorId;
  String? telephone;
  int? isAuthorized;
  dynamic alternateMobileNumber;
  dynamic alternateEmail;
  bool? isDeleted;
  dynamic unauthorizationRemark;
  int? lastIsAuthorizedStatus;

  UsersModel({
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
}
