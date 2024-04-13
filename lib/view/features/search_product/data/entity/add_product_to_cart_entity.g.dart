// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_to_cart_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductToCartEntity _$AddProductToCartEntityFromJson(
        Map<String, dynamic> json) =>
    AddProductToCartEntity(
      statusCode: json['StatusCode'] as int?,
      message: json['Message'] as String?,
    );

Map<String, dynamic> _$AddProductToCartEntityToJson(
        AddProductToCartEntity instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'Message': instance.message,
    };
