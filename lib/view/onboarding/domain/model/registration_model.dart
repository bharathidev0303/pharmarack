class RegistrationModel {
  Newuser? newuser;
  int? businessType;
  List<DrugLicenseImages>? drugLicenseImages;
  Newretailer? newretailer;
  String? gcmregistration;
  String? isNewApp;
  String? isRetailerNameEncoded;
  String? deviceplatform;
  bool? newApp;

  RegistrationModel(
      {this.newuser,
      this.businessType,
      this.drugLicenseImages,
      this.newretailer,
      this.gcmregistration,
      this.isNewApp,
      this.isRetailerNameEncoded,
      this.deviceplatform,
      this.newApp});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    newuser =
        json['newuser'] != null ? Newuser.fromJson(json['newuser']) : null;
    businessType = json['BusinessType'];
    if (json['drugLicenseImages'] != null) {
      drugLicenseImages = <DrugLicenseImages>[];
      json['drugLicenseImages'].forEach((v) {
        drugLicenseImages!.add(DrugLicenseImages.fromJson(v));
      });
    }
    newretailer = json['newretailer'] != null
        ? Newretailer.fromJson(json['newretailer'])
        : null;
    gcmregistration = json['gcmregistration'];
    isNewApp = json['IsNewApp'];
    isRetailerNameEncoded = json['IsRetailerNameEncoded'];
    deviceplatform = json['deviceplatform'];
    newApp = json['NewApp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (newuser != null) {
      data['newuser'] = newuser!.toJson();
    }
    data['BusinessType'] = businessType;
    if (drugLicenseImages != null) {
      data['drugLicenseImages'] =
          drugLicenseImages!.map((v) => v.toJson()).toList();
    }
    if (newretailer != null) {
      data['newretailer'] = newretailer!.toJson();
    }
    data['gcmregistration'] = gcmregistration;
    data['IsNewApp'] = isNewApp;
    data['IsRetailerNameEncoded'] = isRetailerNameEncoded;
    data['deviceplatform'] = deviceplatform;
    data['NewApp'] = newApp;
    return data;
  }
}

class Newuser {
  String? firstName;
  String? lastName;
  String? email;
  String? mobileNumber;
  String? password;

  Newuser(
      {firstName, this.lastName, this.email, this.mobileNumber, this.password});

  Newuser.fromJson(Map<String, dynamic> json) {
    firstName = json['FirstName'];
    lastName = json['LastName'];
    email = json['Email'];
    mobileNumber = json['MobileNumber'];
    password = json['Password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['Email'] = email;
    data['MobileNumber'] = mobileNumber;
    data['Password'] = password;
    return data;
  }
}

class DrugLicenseImages {
  String? imageUrl;
  String? imageDbPath;
  String? type;

  DrugLicenseImages({this.imageUrl, this.imageDbPath, this.type});

  DrugLicenseImages.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    imageDbPath = json['imageDbPath'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    data['imageDbPath'] = imageDbPath;
    data['type'] = type;
    return data;
  }
}

class Newretailer {
  String? retailerName;
  String? address1;
  String? address2;
  String? city;
  int? pincode;
  int? regionId;
  int? stateId;
  int? mobileNumber;
  String? email;
  String? licenseNumber;
  String? panNumber;
  String? referralCode;
  String? isWhatsappConsentAgree;
  String? appVersion;
  String? gSTINNumber;
  String? contactPerson;
  List<PharmacistDetails>? pharmacistDetails;

  Newretailer(
      {this.retailerName,
      this.address1,
      this.address2,
      this.city,
      this.pincode,
      this.regionId,
      this.stateId,
      this.mobileNumber,
      this.email,
      this.licenseNumber,
      this.panNumber,
      this.referralCode,
      this.isWhatsappConsentAgree,
      this.appVersion,
      this.gSTINNumber,
      this.contactPerson,
      this.pharmacistDetails});

  Newretailer.fromJson(Map<String, dynamic> json) {
    retailerName = json['RetailerName'];
    address1 = json['Address1'];
    address2 = json['Address2'];
    city = json['City'];
    pincode = json['Pincode'];
    regionId = json['RegionId'];
    stateId = json['StateId'];
    mobileNumber = json['MobileNumber'];
    email = json['email'];
    licenseNumber = json['LicenseNumber'];
    panNumber = json['PanNumber'];
    referralCode = json['ReferralCode'];
    isWhatsappConsentAgree = json['IsWhatsappConsentAgree'];
    appVersion = json['AppVersion'];
    gSTINNumber = json['GSTINNumber'];
    contactPerson = json['ContactPerson'];
    if (json['pharmacistDetails'] != null) {
      pharmacistDetails = <PharmacistDetails>[];
      json['pharmacistDetails'].forEach((v) {
        pharmacistDetails!.add(PharmacistDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['RetailerName'] = retailerName;
    data['Address1'] = address1;
    data['Address2'] = address2;
    data['City'] = city;
    data['Pincode'] = pincode;
    data['RegionId'] = regionId;
    data['StateId'] = stateId;
    data['MobileNumber'] = mobileNumber;
    data['email'] = email;
    data['LicenseNumber'] = licenseNumber;
    data['PanNumber'] = panNumber;
    data['ReferralCode'] = referralCode;
    data['IsWhatsappConsentAgree'] = isWhatsappConsentAgree;
    data['AppVersion'] = appVersion;
    data['GSTINNumber'] = gSTINNumber;
    data['ContactPerson'] = contactPerson;
    if (pharmacistDetails != null) {
      data['pharmacistDetails'] =
          pharmacistDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PharmacistDetails {
  String? firstPharmacistName;
  String? firstPharmacistMobNo;

  PharmacistDetails({this.firstPharmacistName, this.firstPharmacistMobNo});

  PharmacistDetails.fromJson(Map<String, dynamic> json) {
    firstPharmacistName = json['FirstPharmacistName'];
    firstPharmacistMobNo = json['FirstPharmacistMobNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FirstPharmacistName'] = firstPharmacistName;
    data['FirstPharmacistMobNo'] = firstPharmacistMobNo;
    return data;
  }
}
