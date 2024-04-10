import 'package:json_annotation/json_annotation.dart';

class UpdateRetailerModel {
  Updateuser? updateuser;
  Updateretailer? updateretailer;
  RetailerPaymentConfig? retailerPaymentConfig;
  bool? newApp;
  String? isImageChanged;
  String? isRetailerNameEncoded;
  String? gstinOption;
  String? gcmregistration;

  UpdateRetailerModel({
    this.updateuser,
    this.updateretailer,
    this.retailerPaymentConfig,
    this.newApp,
    this.isImageChanged,
    this.isRetailerNameEncoded,
    this.gstinOption,
    this.gcmregistration,
  });

  UpdateRetailerModel.fromJson(Map<String, dynamic> json) {
    updateuser = json['updateuser'] != null
        ? Updateuser.fromJson(json['updateuser'])
        : null;
    updateretailer = json['updateretailer'] != null
        ? Updateretailer.fromJson(json['updateretailer'])
        : null;
    retailerPaymentConfig = json['retailerPaymentConfig'] != null
        ? RetailerPaymentConfig.fromJson(json['retailerPaymentConfig'])
        : null;
    newApp = json['newApp']; // Updated key name
    isImageChanged = json['isImageChanged']; // Updated key name
    isRetailerNameEncoded = json['isRetailerNameEncoded']; // Updated key name
    gstinOption = json['gstinOption']; // Updated key name
    gcmregistration = json['gcmregistration']; // Updated key name
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (updateuser != null) {
      data['updateuser'] = updateuser!.toJson();
    }
    if (updateretailer != null) {
      data['updateretailer'] = updateretailer!.toJson();
    }
    if (retailerPaymentConfig != null) {
      data['retailerPaymentConfig'] = retailerPaymentConfig!.toJson();
    }
    data['NewApp'] = newApp;
    data['IsImageChanged'] = isImageChanged;
    data['IsRetailerNameEncoded'] = isRetailerNameEncoded;
    data['GSTINOption'] = gstinOption;
    data['gcmregistration'] = gcmregistration;
    return data;
  }
}

@JsonSerializable()
class RetailerPaymentConfig {
  String? upiId;

  String? bankName;

  String? bankAccountType;

  String? accountType;

  String? bankAcNumber;

  String? bankAcName;

  String? ifsc;

  String? isUpiVerified;

  RetailerPaymentConfig({
    this.upiId,
    this.bankName,
    this.bankAccountType,
    this.accountType,
    this.bankAcNumber,
    this.bankAcName,
    this.ifsc,
    this.isUpiVerified,
  });

  RetailerPaymentConfig.fromJson(Map<String, dynamic> json) {
    upiId = json['UPIId'];
    bankName = json['BankName'];
    bankAccountType = json['BankAccountType'];
    accountType = json['AccountType'];
    bankAcNumber = json['BankAcNumber'];
    bankAcName = json['BankAcName'];
    ifsc = json['IFSC'];
    isUpiVerified = json['IsUPIVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UPIId'] = upiId;
    data['BankName'] = bankName;
    data['BankAccountType'] = bankAccountType;
    data['AccountType'] = accountType;
    data['BankAcNumber'] = bankAcNumber;
    data['BankAcName'] = bankAcName;
    data['IFSC'] = ifsc;
    data['IsUPIVerified'] = isUpiVerified;
    return data;
  }
}

class Updateretailer {
  int? retailerId;

  String? retailerName;

  String? address1;

  String? address2;

  String? city;

  String? pincode;

  int? regionId;

  String? stateId;

  String? mobileNumber;

  String? telephone;

  String? email;

  String? licenseNumber;

  String? secondDlNumber;

  String? thirdDlNumber;

  String? gstinNumber;

  String? contactPerson;

  String? businessType;

  String? panNumber;

  Updateretailer({
    this.retailerId,
    this.retailerName,
    this.address1,
    this.address2,
    this.city,
    this.pincode,
    this.regionId,
    this.stateId,
    this.mobileNumber,
    this.telephone,
    this.email,
    this.licenseNumber,
    this.secondDlNumber,
    this.thirdDlNumber,
    this.gstinNumber,
    this.contactPerson,
    this.businessType,
    this.panNumber,
  });

  Updateretailer.fromJson(Map<String, dynamic> json) {
    retailerId = json['RetailerId'];
    retailerName = json['RetailerName'];
    address1 = json['Address1'];
    address2 = json['Address2'];
    city = json['City'];
    pincode = json['Pincode'];
    regionId = json['RegionId'];
    stateId = json['StateId'];
    mobileNumber = json['MobileNumber'];
    telephone = json['Telephone'];
    email = json['email'];
    licenseNumber = json['LicenseNumber'];
    secondDlNumber = json['SecondDLNumber'];
    thirdDlNumber = json['ThirdDLNumber'];
    gstinNumber = json['GSTINNumber'];
    contactPerson = json['ContactPerson'];
    businessType = json['BusinessType'];
    panNumber = json['PanNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RetailerId'] = retailerId;
    data['RetailerName'] = retailerName;
    data['Address1'] = address1;
    data['Address2'] = address2;
    data['City'] = city;
    data['Pincode'] = pincode;
    data['RegionId'] = regionId;
    data['StateId'] = stateId;
    data['MobileNumber'] = mobileNumber;
    data['Telephone'] = telephone;
    data['email'] = email;
    data['LicenseNumber'] = licenseNumber;
    data['SecondDLNumber'] = secondDlNumber;
    data['ThirdDLNumber'] = thirdDlNumber;
    data['GSTINNumber'] = gstinNumber;
    data['ContactPerson'] = contactPerson;
    data['BusinessType'] = businessType;
    data['PanNumber'] = panNumber;
    return data;
  }
}

@JsonSerializable()
class Updateuser {
  String? firstName;

  String? lastName;

  String? email;

  String? partyname;

  String? mobileNumber;

  String? telephone;

  Updateuser({
    this.firstName,
    this.lastName,
    this.email,
    this.partyname,
    this.mobileNumber,
    this.telephone,
  });

  Updateuser.fromJson(Map<String, dynamic> json) {
    firstName = json['FirstName'];
    lastName = json['LastName'];
    email = json['Email'];
    partyname = json['Partyname'];
    mobileNumber = json['MobileNumber'];
    telephone = json['Telephone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['Email'] = email;
    data['Partyname'] = partyname;
    data['MobileNumber'] = mobileNumber;
    data['Telephone'] = telephone;
    return data;
  }
}
