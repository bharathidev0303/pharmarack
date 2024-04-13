// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_products_list_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerProductsListEntity _$BannerProductsListEntityFromJson(
        Map<String, dynamic> json) =>
    BannerProductsListEntity(
      statusCode: json['StatusCode'] as int?,
      message: json['Message'] as String?,
      productList: json['ProductList'] as List<dynamic>?,
    );

Map<String, dynamic> _$BannerProductsListEntityToJson(
        BannerProductsListEntity instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'Message': instance.message,
      'ProductList': instance.productList,
    };
