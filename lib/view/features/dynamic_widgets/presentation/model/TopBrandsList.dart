import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TopBrandsLists {
  @JsonKey(name: 'BrandId')
  int? brandId;
  @JsonKey(name: 'CompanyId')
  int? companyId;
  @JsonKey(name: 'GenericId')
  int? genericId;
  @JsonKey(name: 'Name')
  String? name;
  @JsonKey(name: 'Description')
  String? description;
  @JsonKey(name: 'AdditionalRemark')
  String? additionalRemark;
  @JsonKey(name: 'IsApproved')
  bool? isApproved;
  @JsonKey(name: 'IsDeleted')
  bool? isDeleted;
  @JsonKey(name: 'RegExBrandName')
  String? regExBrandName;

  TopBrandsLists({
    this.brandId,
    this.companyId,
    this.genericId,
    this.name,
    this.description,
    this.additionalRemark,
    this.isApproved,
    this.isDeleted,
    this.regExBrandName,
  });

  factory TopBrandsLists.fromJson(Map<String, dynamic> json) {
    return TopBrandsLists(
      brandId: json['BrandId'] as int?,
      companyId: json['CompanyId'] as int?,
      genericId: json['GenericId'] as int?,
      name: json['Name'] as String?,
      description: json['Description'] as String?,
      additionalRemark: json['AdditionalRemark'] as String?,
      isApproved: json['IsApproved'] as bool?,
      isDeleted: json['IsDeleted'] as bool?,
      regExBrandName: json['RegExBrandName'] as String?,
    );
  }

  TopBrandsLists copyWith({
    int? brandId,
    int? companyId,
    int? genericId,
    String? name,
    String? description,
    String? additionalRemark,
    bool? isApproved,
    bool? isDeleted,
    String? regExBrandName,
  }) {
    return TopBrandsLists(
      brandId: brandId ?? this.brandId,
      companyId: companyId ?? this.companyId,
      genericId: genericId ?? this.genericId,
      name: name ?? this.name,
      description: description ?? this.description,
      additionalRemark: additionalRemark ?? this.additionalRemark,
      isApproved: isApproved ?? this.isApproved,
      isDeleted: isDeleted ?? this.isDeleted,
      regExBrandName: regExBrandName ?? this.regExBrandName,
    );
  }
}
