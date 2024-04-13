import 'package:json_annotation/json_annotation.dart';

part 'banner_products_list_entity.g.dart';

@JsonSerializable()
class BannerProductsListEntity {
  @JsonKey(name: 'StatusCode')
  final int? statusCode;
  @JsonKey(name: 'Message')
  final String? message;
  @JsonKey(name: 'ProductList')
  final List<dynamic>? productList;

  BannerProductsListEntity({this.statusCode, this.message, this.productList});

  factory BannerProductsListEntity.fromJson(Map<String, dynamic> json) =>
      _$BannerProductsListEntityFromJson(json);

  Map<String, dynamic> toJson() => _$BannerProductsListEntityToJson(this);

  @override
  String toString() {
    return 'BannerProductsListEntity{statusCode: $statusCode, message: $message, productList: $productList}';
  }
}
