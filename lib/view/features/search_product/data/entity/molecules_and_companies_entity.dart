import 'package:json_annotation/json_annotation.dart';

part 'molecules_and_companies_entity.g.dart';

@JsonSerializable()
class MoleculesAndCompaniesEntity {
  @JsonKey(name: 'StatusCode')
  final String? statusCode;

  @JsonKey(name: 'StatusName')
  final String? statusName;

  @JsonKey(name: 'IList')
  dynamic iList;

  MoleculesAndCompaniesEntity(this.statusCode, this.statusName, this.iList);

  factory MoleculesAndCompaniesEntity.fromJson(Map<String, dynamic> json) =>
      _$MoleculesAndCompaniesEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MoleculesAndCompaniesEntityToJson(this);
}
