// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'special_offer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialOfferEntity _$SpecialOfferEntityFromJson(Map<String, dynamic> json) =>
    SpecialOfferEntity(
      statusCode: json['statusCode'] as String?,
      message: json['message'] as String?,
      specialOffers: (json['specialOffers'] as List<dynamic>?)
          ?.map((e) => SpecialOffers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecialOfferEntityToJson(SpecialOfferEntity instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'specialOffers': instance.specialOffers,
    };

SpecialOffers _$SpecialOffersFromJson(Map<String, dynamic> json) =>
    SpecialOffers(
      id: json['id'] as String?,
      medicineName: json['medicineName'] as String?,
      ptr: json['ptr'] as String?,
      mrp: json['mrp'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$SpecialOffersToJson(SpecialOffers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'medicineName': instance.medicineName,
      'ptr': instance.ptr,
      'mrp': instance.mrp,
      'imageUrl': instance.imageUrl,
    };
