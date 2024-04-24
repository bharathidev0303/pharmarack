import 'package:json_annotation/json_annotation.dart';

class BrandItemsItemList {
  final List<BrandListModel> brands;

  BrandItemsItemList({
    required this.brands,
  });

  factory BrandItemsItemList.fromJson(List<dynamic> children) {
    final List<BrandListModel> brandsItem = children
        .map((brandsItem) => BrandListModel.fromJson(brandsItem))
        .toList();
    return BrandItemsItemList(brands: brandsItem);
  }

  BrandItemsItemList copyWith({
    List<BrandListModel>? brands,
  }) {
    return BrandItemsItemList(
      brands: brands ?? this.brands,
    );
  }
}

@JsonSerializable()
class BrandListModel {
  @JsonKey(name: 'CompanyId')
  int? companyId;
  @JsonKey(name: 'CompanyName')
  String? companyName;
  @JsonKey(name: 'CompanyCode')
  String? companyCode;
  @JsonKey(name: 'CompanyShortName')
  String? companyShortName;
  @JsonKey(name: 'CompanyType')
  String? companyType;
  @JsonKey(name: 'CoId')
  int? coId;

  BrandListModel({
    this.companyId,
    this.companyName,
    this.companyCode,
    this.companyShortName,
    this.companyType,
    this.coId,
  });

  factory BrandListModel.fromJson(Map<String, dynamic> json) {
    return BrandListModel(
      companyId: json['CompanyId'] ?? 0,
      companyName: json['CompanyName'] ?? "",
      companyCode: json['CompanyCode'] == null ? "" : json['CompanyCode'],
      companyShortName:
          json['CompanyShortName'] == null ? "" : json['CompanyShortName'],
      companyType: json['CompanyType'] == null ? "" : json['CompanyType'],
      coId: json['CoId'] ?? 0,
    );
  }

  BrandListModel copyWith({
    int? companyId,
    String? companyName,
    String? companyCode,
    String? companyShortName,
    String? companyType,
    int? coId,
  }) {
    return BrandListModel(
      companyId: companyId ?? this.companyId,
      companyName: companyName ?? this.companyName,
      companyCode: companyCode ?? this.companyCode,
      companyShortName: companyShortName ?? this.companyShortName,
      companyType: companyType ?? this.companyType,
      coId: coId ?? this.coId,
    );
  }
}
