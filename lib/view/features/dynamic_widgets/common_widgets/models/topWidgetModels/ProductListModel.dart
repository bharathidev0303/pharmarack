import 'package:json_annotation/json_annotation.dart';

class ProductsItemList {
  List<ProductListModel> products;

  ProductsItemList({
    required this.products,
  });

  factory ProductsItemList.fromJson(List<dynamic> json) {
    return ProductsItemList(
      products:
          json.map((products) => ProductListModel.fromJson(products)).toList(),
    );
  }

  ProductsItemList copyWith({
    List<ProductListModel>? products,
  }) {
    return ProductsItemList(
      products: products ?? this.products,
    );
  }
}

@JsonSerializable()
class ProductListModel {
  @JsonKey(name: 'ProductId')
  int? productId;
  @JsonKey(name: 'ProductName')
  String? productName;
  @JsonKey(name: 'ProductCode')
  String? productCode;
  @JsonKey(name: 'RegExProductName')
  String? regExProductName;
  @JsonKey(name: 'StoreId')
  int? storeId;
  @JsonKey(name: 'StoreName')
  String? storeName;
  @JsonKey(name: 'CompanyId')
  int? companyId;
  @JsonKey(name: 'CompanyName')
  String? companyName;
  @JsonKey(name: 'CompanyCode')
  String? companyCode;
  @JsonKey(name: 'PTR')
  double? ptr;
  @JsonKey(name: 'MRP')
  double? mrp;
  @JsonKey(name: 'Stock')
  int? stock;
  @JsonKey(name: 'Scheme')
  String? scheme;
  @JsonKey(name: 'qty')
  int? qty;
  @JsonKey(name: 'CashbackMessage')
  String? cashbackMessage;

  ProductListModel({
    this.productId,
    this.productName,
    this.productCode,
    this.regExProductName,
    this.storeId,
    this.storeName,
    this.companyId,
    this.companyName,
    this.companyCode,
    this.ptr,
    this.mrp,
    this.stock,
    this.scheme,
    this.qty,
    this.cashbackMessage,
  });

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      productId: json['ProductId'] as int?,
      productName: json['ProductName'] as String?,
      productCode: json['ProductCode'] as String?,
      regExProductName: json['RegExProductName'] as String?,
      storeId: json['StoreId'] as int?,
      storeName: json['StoreName'] as String?,
      companyId: json['CompanyId'] as int?,
      companyName: json['CompanyName'] as String?,
      companyCode: json['CompanyCode'] as String?,
      ptr: double.parse((json['PTR'] ?? 0.0).toString()),
      mrp: double.parse((json['MRP'] ?? 0.0).toString()),
      stock: json['Stock'] as int?,
      scheme: json['Scheme'] as String?,
      qty: json['qty'] as int?,
      cashbackMessage: json['CashbackMessage'] as String?,
    );
  }

  ProductListModel copyWith({
    int? productId,
    String? productName,
    String? productCode,
    String? regExProductName,
    int? storeId,
    String? storeName,
    int? companyId,
    String? companyName,
    String? companyCode,
    double? ptr,
    double? mrp,
    int? stock,
    String? scheme,
    int? qty,
    String? cashbackMessage,
  }) {
    return ProductListModel(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productCode: productCode ?? this.productCode,
      regExProductName: regExProductName ?? this.regExProductName,
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      companyId: companyId ?? this.companyId,
      companyName: companyName ?? this.companyName,
      companyCode: companyCode ?? this.companyCode,
      ptr: ptr ?? this.ptr,
      mrp: mrp ?? this.mrp,
      stock: stock ?? this.stock,
      scheme: scheme ?? this.scheme,
      qty: qty ?? this.qty,
      cashbackMessage: cashbackMessage ?? this.cashbackMessage,
    );
  }
}
