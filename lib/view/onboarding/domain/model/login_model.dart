import 'package:pharmarack/packages/core_flutter/common_entity/login_entity.dart';

class LoginModel {
  int? userId;
  String? username;
  String? firstname;
  String? lastname;
  String? email;
  String? mobileNumber;
  String? telephone;
  int? createdBy;
  String? createdDate;
  int? modifiedBy;
  String? modifiedDate;
  List<String>? roles;
  LoginResponseStatusModel? status;
  List<Retailer>? retailers;

  LoginModel(
      {this.userId,
      this.username,
      this.firstname,
      this.lastname,
      this.email,
      this.mobileNumber,
      this.telephone,
      this.createdBy,
      this.createdDate,
      this.modifiedBy,
      this.modifiedDate,
      this.roles,
      this.status,
      this.retailers});

  LoginModel.from(LoginEntity parsedJson) {
    userId = parsedJson.userId;
    username = parsedJson.username;
    firstname = parsedJson.firstname;
    lastname = parsedJson.lastname;
    mobileNumber = parsedJson.mobileNumber;
    email = parsedJson.email;
    roles = parsedJson.roles;
    telephone = parsedJson.telephone;
    status = LoginResponseStatusModel(
      statusId: parsedJson.status?.statusId,
      statusMessage: parsedJson.status?.statusMessage,
    );
    retailers = parsedJson.displayRetailers
        ?.map((e) => Retailer(retailerId: e.retailerId))
        .toList();
  }
}

class LoginResponseStatusModel {
  int? statusId;
  String? statusMessage;

  LoginResponseStatusModel({
    this.statusId,
    this.statusMessage,
  });
}

class Retailer {
  int? retailerId;

  Retailer({this.retailerId});
}
