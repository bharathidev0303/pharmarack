import 'package:json_annotation/json_annotation.dart';

part 'products_entity.g.dart';

@JsonSerializable()
class ProductsEntity {
  @JsonKey(name: 'success')
  final bool? success;
  @JsonKey(name: 'StatusCode')
  final int? statusCode;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data')
  final List<ProductsItem>? products;

  ProductsEntity({this.success, this.statusCode, this.message, this.products});

  factory ProductsEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsEntityToJson(this);

  ProductsEntity copyWith(
      {bool? success,
      int? statusCode,
      String? message,
      List<ProductsItem>? products}) {
    return ProductsEntity(
      success: success ?? this.success,
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      products: products ?? this.products,
    );
  }
}

@JsonSerializable()
class ProductsItem {
  @JsonKey(name: 'product_id')
  int? productId;
  @JsonKey(name: 'storeId')
  int? storeId;
  @JsonKey(name: 'product_code')
  String? productCode;
  @JsonKey(name: 'product_title')
  String? productTitle;
  @JsonKey(name: 'company')
  String? company;
  @JsonKey(name: 'ptr')
  String? ptr;
  @JsonKey(name: 'mrp')
  String? mrp;
  @JsonKey(name: 'stock')
  int? stock;
  @JsonKey(name: 'cart_quantity')
  int? cartQuantity;
  @JsonKey(name: 'moq')
  int? moq;
  @JsonKey(name: 'boq')
  int? boq;
  @JsonKey(name: 'offer_top_corner_title')
  String? offerTopCornerTitle;
  @JsonKey(name: 'offer_bottom_title')
  String? offerBottomTitle;

  ProductsItem({
    this.productId,
    this.storeId,
    this.productCode,
    this.productTitle,
    this.company,
    this.ptr,
    this.mrp,
    this.stock,
    this.cartQuantity,
    this.moq,
    this.boq,
    this.offerBottomTitle,
    this.offerTopCornerTitle,
  });

  factory ProductsItem.fromJson(Map<String, dynamic> json) =>
      _$ProductsItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsItemToJson(this);

  ProductsItem copyWith({
    int? productId,
    int? storeId,
    String? productCode,
    String? productTitle,
    String? company,
    String? ptr,
    String? mrp,
    int? stock,
    int? cartQuantity,
    int? moq,
    int? boq,
    String? offerBottomTitle,
    String? offerTopCornerTitle,
  }) {
    return ProductsItem(
      productId: productId ?? this.productId,
      storeId: storeId ?? this.storeId,
      productCode: productCode ?? this.productCode,
      productTitle: productTitle ?? this.productTitle,
      company: company ?? this.company,
      ptr: ptr ?? this.ptr,
      mrp: mrp ?? this.mrp,
      stock: stock ?? this.stock,
      cartQuantity: cartQuantity ?? this.cartQuantity,
      moq: moq ?? this.moq,
      boq: boq ?? this.boq,
      offerBottomTitle: offerBottomTitle ?? this.offerBottomTitle,
      offerTopCornerTitle: offerTopCornerTitle ?? this.offerTopCornerTitle,
    );
  }
}
