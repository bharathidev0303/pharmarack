// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_distributors_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDistributorsResponseEntity _$ProductDistributorsResponseEntityFromJson(
        Map<String, dynamic> json) =>
    ProductDistributorsResponseEntity(
      productId: json['productId'] as int,
      productName: json['productName'] as String,
      offerName: json['offerName'] as String?,
      offer: json['offer'] as String?,
      distributors: (json['distributors'] as List<dynamic>)
          .map((e) => DistributorDetailResponseEntity.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDistributorsResponseEntityToJson(
        ProductDistributorsResponseEntity instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'productName': instance.productName,
      'offerName': instance.offerName,
      'offer': instance.offer,
      'distributors': instance.distributors,
    };

DistributorDetailResponseEntity _$DistributorDetailResponseEntityFromJson(
        Map<String, dynamic> json) =>
    DistributorDetailResponseEntity(
      storeId: json['storeId'] as int,
      distributorName: json['distributorName'] as String,
      ptr: (json['ptr'] as num?)?.toDouble(),
      gstPercentage: (json['GSTPercentage'] as num?)?.toDouble(),
      isDODProductCheck: json['IsDODProductCheck'] as int?,
      isDODPreferenceSet: json['IsDODPreferenceSet'] as int?,
      isDODProductSelected: json['IsDODProductSelected'] as int?,
      mrp: (json['mrp'] as num?)?.toDouble(),
      stock: json['stock'] as int?,
      scheme: json['scheme'] as String?,
      hiddenPtr: (json['hiddenPtr'] as num?)?.toDouble(),
      freeQuantity: json['freeQuantity'] as int?,
    );

Map<String, dynamic> _$DistributorDetailResponseEntityToJson(
        DistributorDetailResponseEntity instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'distributorName': instance.distributorName,
      'ptr': instance.ptr,
      'GSTPercentage': instance.gstPercentage,
      'IsDODProductCheck': instance.isDODProductCheck,
      'IsDODPreferenceSet': instance.isDODPreferenceSet,
      'IsDODProductSelected': instance.isDODProductSelected,
      'mrp': instance.mrp,
      'stock': instance.stock,
      'scheme': instance.scheme,
      'hiddenPtr': instance.hiddenPtr,
      'freeQuantity': instance.freeQuantity,
    };
