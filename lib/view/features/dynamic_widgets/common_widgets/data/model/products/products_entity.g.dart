// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsEntity _$ProductsEntityFromJson(Map<String, dynamic> json) =>
    ProductsEntity(
      success: json['success'] as bool?,
      statusCode: json['StatusCode'] as int?,
      message: json['message'] as String?,
      products: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsEntityToJson(ProductsEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'StatusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.products,
    };

ProductsItem _$ProductsItemFromJson(Map<String, dynamic> json) => ProductsItem(
      productId: json['product_id'] as int?,
      storeId: json['storeId'] as int?,
      productCode: json['product_code'] as String?,
      productTitle: json['product_title'] as String?,
      company: json['company'] as String?,
      ptr: json['ptr'] as String?,
      mrp: json['mrp'] as String?,
      stock: json['stock'] as int?,
      cartQuantity: json['cart_quantity'] as int?,
      moq: json['moq'] as int?,
      boq: json['boq'] as int?,
      offerBottomTitle: json['offer_bottom_title'] as String?,
      offerTopCornerTitle: json['offer_top_corner_title'] as String?,
    );

Map<String, dynamic> _$ProductsItemToJson(ProductsItem instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'storeId': instance.storeId,
      'product_code': instance.productCode,
      'product_title': instance.productTitle,
      'company': instance.company,
      'ptr': instance.ptr,
      'mrp': instance.mrp,
      'stock': instance.stock,
      'cart_quantity': instance.cartQuantity,
      'moq': instance.moq,
      'boq': instance.boq,
      'offer_top_corner_title': instance.offerTopCornerTitle,
      'offer_bottom_title': instance.offerBottomTitle,
    };
