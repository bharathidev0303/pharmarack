import 'package:json_annotation/json_annotation.dart';

part 'company_entity.g.dart';

@JsonSerializable()
class CompanyEntity {
  @JsonKey(name: 'StatusCode')
  int? statusCode;
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  List<Companies>? companies;

  CompanyEntity({
    this.statusCode,
    this.message,
    this.companies,
  });

  factory CompanyEntity.fromJson(Map<String, dynamic> json) =>
      _$CompanyEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyEntityToJson(this);
}

@JsonSerializable()
class Companies {
  @JsonKey(name: 'CompanyId')
  int? companyId;
  @JsonKey(name: 'CompanyName')
  String? companyName;
  @JsonKey(name: 'CompanyLogo')
  String? companyLogo;
  @JsonKey(name: 'skuCount')
  int? skuCount;
  @JsonKey(name: 'brandCount')
  int? brandCount;
  @JsonKey(name: 'link')
  String? link;
  @JsonKey(name: 'therapy')
  List<String>? therapy;

  Companies({
    this.companyId,
    this.companyName,
    this.companyLogo,
    this.skuCount,
    this.brandCount,
    this.link,
    this.therapy,
  });

  factory Companies.fromJson(Map<String, dynamic> json) =>
      _$CompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$CompaniesToJson(this);
}
