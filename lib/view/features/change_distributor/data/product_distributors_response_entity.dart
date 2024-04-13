import 'package:json_annotation/json_annotation.dart';

part 'product_distributors_response_entity.g.dart';

@JsonSerializable()
class ProductDistributorsResponseEntity {
  @JsonKey(name: 'productId')
  final int productId;
  @JsonKey(name: 'productName')
  final String productName;
  @JsonKey(name: 'offerName')
  final String? offerName;
  @JsonKey(name: 'offer')
  final String? offer;
  @JsonKey(name: 'distributors')
  final List<DistributorDetailResponseEntity> distributors;

  ProductDistributorsResponseEntity({
    required this.productId,
    required this.productName,
    required this.offerName,
    required this.offer,
    required this.distributors,
  });

  factory ProductDistributorsResponseEntity.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$ProductDistributorsResponseEntityFromJson(json);
  }
}

@JsonSerializable()
class DistributorDetailResponseEntity {
  @JsonKey(name: 'storeId')
  final int storeId;
  @JsonKey(name: 'distributorName')
  final String distributorName;
  @JsonKey(name: 'ptr')
  final double? ptr;
  @JsonKey(name: 'GSTPercentage')
  final double? gstPercentage;
  @JsonKey(name: 'IsDODProductCheck')
  final int? isDODProductCheck;
  @JsonKey(name: 'IsDODPreferenceSet')
  final int? isDODPreferenceSet;
  @JsonKey(name: 'IsDODProductSelected')
  final int? isDODProductSelected;
  @JsonKey(name: 'mrp')
  final double? mrp;
  @JsonKey(name: 'stock')
  final int? stock;
  @JsonKey(name: 'scheme')
  final String? scheme;
  @JsonKey(name: 'hiddenPtr')
  final double? hiddenPtr;
  @JsonKey(name: 'freeQuantity')
  final int? freeQuantity;

  DistributorDetailResponseEntity({
    required this.storeId,
    required this.distributorName,
    required this.ptr,
    required this.gstPercentage,
    required this.isDODProductCheck,
    required this.isDODPreferenceSet,
    required this.isDODProductSelected,
    required this.mrp,
    required this.stock,
    required this.scheme,
    required this.hiddenPtr,
    required this.freeQuantity,
  });

  factory DistributorDetailResponseEntity.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$DistributorDetailResponseEntityFromJson(json);
  }
}
