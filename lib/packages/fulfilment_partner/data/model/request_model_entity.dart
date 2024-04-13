import 'package:json_annotation/json_annotation.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/endpoints_constants/fulfilment_partner_options.dart';

part 'request_model_entity.g.dart';

@JsonSerializable()
class RequestModelEntity {
  @JsonKey(name: FulfilmentPartnerOptions.fulfillmentPartnersForApproval)
  List<FulfillmentPartnersforApproval>? fulfillmentPartnersforApproval;

  RequestModelEntity({
    this.fulfillmentPartnersforApproval,
  });

  factory RequestModelEntity.fromJson(Map<String, dynamic> json) =>
      _$RequestModelEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RequestModelEntityToJson(this);

  RequestModelEntity copyWith({
    List<FulfillmentPartnersforApproval>? fulfillmentPartnersforApproval,
  }) {
    return RequestModelEntity(
      fulfillmentPartnersforApproval:
          fulfillmentPartnersforApproval ?? this.fulfillmentPartnersforApproval,
    );
  }
}

@JsonSerializable()
class FulfillmentPartnersforApproval {
  @JsonKey(name: FulfilmentPartnerOptions.retailerId)
  int? retailerId;
  @JsonKey(name: FulfilmentPartnerOptions.storeId)
  int? storeId;
  @JsonKey(name: FulfilmentPartnerOptions.fulfillmentPartnerId)
  int? fulfillmentPartnerId;
  @JsonKey(name: FulfilmentPartnerOptions.fulfillmentPartnerName)
  String? fulfillmentPartnerName;
  @JsonKey(name: FulfilmentPartnerOptions.address)
  String? address;
  @JsonKey(name: FulfilmentPartnerOptions.imageType)
  dynamic imageType;
  @JsonKey(name: FulfilmentPartnerOptions.imagePath)
  dynamic imagePath;
  @JsonKey(name: FulfilmentPartnerOptions.imageId)
  int? imageId;
  @JsonKey(name: FulfilmentPartnerOptions.profileImagePath)
  dynamic profileImagePath;
  @JsonKey(name: FulfilmentPartnerOptions.aadhaarImagePath)
  dynamic adharImagePath;
  @JsonKey(name: FulfilmentPartnerOptions.isApproved)
  dynamic isApproved;
  @JsonKey(name: FulfilmentPartnerOptions.aadhaarCardNumber)
  String? adharCardNumber;
  @JsonKey(name: FulfilmentPartnerOptions.mobileNumber)
  String? mobileNumber;
  @JsonKey(name: FulfilmentPartnerOptions.email)
  String? email;
  @JsonKey(name: FulfilmentPartnerOptions.storeName)
  dynamic storeName;

  FulfillmentPartnersforApproval({
    this.retailerId,
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
  });

  factory FulfillmentPartnersforApproval.fromJson(Map<String, dynamic> json) =>
      _$FulfillmentPartnersforApprovalFromJson(json);

  Map<String, dynamic> toJson() => _$FulfillmentPartnersforApprovalToJson(this);

  FulfillmentPartnersforApproval copyWith({
    int? retailerId,
    int? storeId,
    int? fulfillmentPartnerId,
    String? fulfillmentPartnerName,
    String? address,
    dynamic imageType,
    dynamic imagePath,
    int? imageId,
    dynamic profileImagePath,
    dynamic adharImagePath,
    dynamic isApproved,
    String? adharCardNumber,
    String? mobileNumber,
    String? email,
    dynamic storeName,
  }) {
    return FulfillmentPartnersforApproval(
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
    );
  }
}
