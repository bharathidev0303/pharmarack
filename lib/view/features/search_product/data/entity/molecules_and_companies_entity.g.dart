// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'molecules_and_companies_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoleculesAndCompaniesEntity _$MoleculesAndCompaniesEntityFromJson(
        Map<String, dynamic> json) =>
    MoleculesAndCompaniesEntity(
      json['StatusCode'] as String?,
      json['StatusName'] as String?,
      json['IList'],
    );

Map<String, dynamic> _$MoleculesAndCompaniesEntityToJson(
        MoleculesAndCompaniesEntity instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusName': instance.statusName,
      'IList': instance.iList,
    };
