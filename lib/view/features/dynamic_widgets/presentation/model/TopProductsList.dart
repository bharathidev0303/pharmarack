import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TopProductsList {
  @JsonKey(name: 'ProductId')
  int? productId;
  @JsonKey(name: 'BrandId')
  int? brandId;
  @JsonKey(name: 'Name')
  String? productName;
  @JsonKey(name: 'ProductCode')
  String? productCode;
  @JsonKey(name: 'MRP')
  String? mrp;
  @JsonKey(name: 'PTR')
  String? ptr;
  @JsonKey(name: 'Stock')
  int? stock;
  @JsonKey(name: 'Scheme')
  String? scheme;
  @JsonKey(name: 'StoreId')
  String? storeId;
  @JsonKey(name: 'StoreName')
  String? storeName;
  @JsonKey(name: 'CompanyId')
  int? companyId;
  @JsonKey(name: 'CompanyName')
  String? companyName;
  @JsonKey(name: 'CompanyCode')
  String? companyCode;
  @JsonKey(name: 'Margin')
  String? margin;
  @JsonKey(name: 'StoreProductGST')
  int? storeProductGST;
  @JsonKey(name: 'Quantity')
  String? quantity;

  TopProductsList({
    this.productId,
    this.brandId,
    this.productName,
    this.productCode,
    this.mrp,
    this.ptr,
    this.stock,
    this.scheme,
    this.storeId,
    this.storeName,
    this.companyId,
    this.companyName,
    this.companyCode,
    this.margin,
    this.storeProductGST,
    this.quantity,
  });

  factory TopProductsList.fromJson(Map<String, dynamic> json) {
    return TopProductsList(
      productId: json['ProductId'] as int?,
      brandId: json['BrandId'] as int?,
      productName: json['Name'] as String?,
      productCode: json['ProductCode'] as String?,
      mrp: json['MRP'] as String?,
      ptr: json['PTR'] as String?,
      stock: json['Stock'] as int?,
      scheme: json['Scheme'] as String?,
      storeId: json['StoreId'] as String?,
      storeName: json['StoreName'] as String?,
      companyId: json['CompanyId'] as int?,
      companyName: json['CompanyName'] as String?,
      companyCode: json['CompanyCode'] as String?,
      margin: json['Margin'] as String?,
      storeProductGST: json['StoreProductGST'] as int?,
      quantity: json['Quantity'] as String?,
    );
  }

  TopProductsList copyWith({
    int? productId,
    int? brandId,
    String? productName,
    String? productCode,
    String? mrp,
    String? ptr,
    int? stock,
    String? scheme,
    String? storeId,
    String? storeName,
    int? companyId,
    String? companyName,
    String? companyCode,
    String? margin,
    int? storeProductGST,
    String? quantity,
  }) {
    return TopProductsList(
      productId: productId ?? this.productId,
      brandId: brandId ?? this.brandId,
      productName: productName ?? this.productName,
      productCode: productCode ?? this.productCode,
      mrp: mrp ?? this.mrp,
      ptr: ptr ?? this.ptr,
      stock: stock ?? this.stock,
      scheme: scheme ?? this.scheme,
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      companyId: companyId ?? this.companyId,
      companyName: companyName ?? this.companyName,
      companyCode: companyCode ?? this.companyCode,
      margin: margin ?? this.margin,
      storeProductGST: storeProductGST ?? this.storeProductGST,
      quantity: quantity ?? this.quantity,
    );
  }
}
