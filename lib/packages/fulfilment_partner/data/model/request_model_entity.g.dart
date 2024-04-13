// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestModelEntity _$RequestModelEntityFromJson(Map<String, dynamic> json) =>
    RequestModelEntity(
      fulfillmentPartnersforApproval:
          (json['FulfillmentPartnersforApproval'] as List<dynamic>?)
              ?.map((e) => FulfillmentPartnersforApproval.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$RequestModelEntityToJson(RequestModelEntity instance) =>
    <String, dynamic>{
      'FulfillmentPartnersforApproval': instance.fulfillmentPartnersforApproval,
    };

FulfillmentPartnersforApproval _$FulfillmentPartnersforApprovalFromJson(
        Map<String, dynamic> json) =>
    FulfillmentPartnersforApproval(
      retailerId: json['RetailerId'] as int?,
      storeId: json['StoreId'] as int?,
      fulfillmentPartnerId: json['FulfillmentPartnerId'] as int?,
      fulfillmentPartnerName: json['FulfillmentPartnerName'] as String?,
      address: json['Address'] as String?,
      imageType: json['ImageType'],
      imagePath: json['ImagePath'],
      imageId: json['ImageId'] as int?,
      profileImagePath: json['ProfileImagePath'],
      adharImagePath: json['AdharImagePath'],
      isApproved: json['IsApproved'],
      adharCardNumber: json['AdharCardNumber'] as String?,
      mobileNumber: json['MobileNumber'] as String?,
      email: json['Email'] as String?,
      storeName: json['StoreName'],
    );

Map<String, dynamic> _$FulfillmentPartnersforApprovalToJson(
        FulfillmentPartnersforApproval instance) =>
    <String, dynamic>{
      'RetailerId': instance.retailerId,
      'StoreId': instance.storeId,
      'FulfillmentPartnerId': instance.fulfillmentPartnerId,
      'FulfillmentPartnerName': instance.fulfillmentPartnerName,
      'Address': instance.address,
      'ImageType': instance.imageType,
      'ImagePath': instance.imagePath,
      'ImageId': instance.imageId,
      'ProfileImagePath': instance.profileImagePath,
      'AdharImagePath': instance.adharImagePath,
      'IsApproved': instance.isApproved,
      'AdharCardNumber': instance.adharCardNumber,
      'MobileNumber': instance.mobileNumber,
      'Email': instance.email,
      'StoreName': instance.storeName,
    };
