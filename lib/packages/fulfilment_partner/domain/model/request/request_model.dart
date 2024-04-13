import 'package:pharmarack/packages/fulfilment_partner/data/model/request_model_entity.dart';

class RequestModel {
  List<Request>? data;

  RequestModel({
    this.data,
  });
}

class Request {
  int? retailerId;
  int? storeId;
  int? fulfillmentPartnerId;
  String? fulfillmentPartnerName;
  String? address;
  dynamic imageType;
  dynamic imagePath;
  int? imageId;
  String? profileImagePath;
  String? adharImagePath;
  dynamic isApproved;
  String? adharCardNumber;
  String? mobileNumber;
  String? email;
  dynamic storeName;
  bool isSelected;

  Request(
      {this.retailerId,
      this.storeId,
      this.fulfillmentPartnerId,
      this.fulfillmentPartnerName,
      this.address,
      this.imageType,
      this.imagePath,
      this.imageId,
      this.profileImagePath,
      this.adharImagePath,
      this.isApproved,
      this.adharCardNumber,
      this.mobileNumber,
      this.email,
      this.storeName,
      this.isSelected = false});

  factory Request.fromRequestEntity(FulfillmentPartnersforApproval approval) {
    return Request(
        retailerId: approval.retailerId,
        storeId: approval.storeId,
        fulfillmentPartnerId: approval.fulfillmentPartnerId,
        fulfillmentPartnerName: approval.fulfillmentPartnerName,
        address: approval.address,
        imageType: approval.imageType,
        imagePath: approval.imagePath,
        imageId: approval.imageId,
        profileImagePath: approval.profileImagePath,
        adharImagePath: approval.adharImagePath,
        isApproved: approval.isApproved,
        adharCardNumber: approval.adharCardNumber,
        mobileNumber: approval.mobileNumber,
        email: approval.email,
        storeName: approval.storeName);
  }

  Request copyWith({
    int? retailerId,
    int? storeId,
    int? fulfillmentPartnerId,
    String? fulfillmentPartnerName,
    String? address,
    dynamic imageType,
    dynamic imagePath,
    int? imageId,
    String? profileImagePath,
    String? adharImagePath,
    dynamic isApproved,
    String? adharCardNumber,
    String? mobileNumber,
    String? email,
    dynamic storeName,
    bool? isSelected,
  }) {
    return Request(
      retailerId: retailerId ?? this.retailerId,
      storeId: storeId ?? this.storeId,
      fulfillmentPartnerId: fulfillmentPartnerId ?? this.fulfillmentPartnerId,
      fulfillmentPartnerName:
          fulfillmentPartnerName ?? this.fulfillmentPartnerName,
      address: address ?? this.address,
      imageType: imageType ?? this.imageType,
      imagePath: imagePath ?? this.imagePath,
      imageId: imageId ?? this.imageId,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      adharImagePath: adharImagePath ?? this.adharImagePath,
      isApproved: isApproved ?? this.isApproved,
      adharCardNumber: adharCardNumber ?? this.adharCardNumber,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      email: email ?? this.email,
      storeName: storeName ?? this.storeName,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
