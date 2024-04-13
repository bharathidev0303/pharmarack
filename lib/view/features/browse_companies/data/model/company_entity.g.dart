// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyEntity _$CompanyEntityFromJson(Map<String, dynamic> json) =>
    CompanyEntity(
      statusCode: json['StatusCode'] as int?,
      message: json['message'] as String?,
      companies: (json['data'] as List<dynamic>?)
          ?.map((e) => Companies.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..success = json['success'] as bool?;

Map<String, dynamic> _$CompanyEntityToJson(CompanyEntity instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'success': instance.success,
      'message': instance.message,
      'data': instance.companies,
    };

Companies _$CompaniesFromJson(Map<String, dynamic> json) => Companies(
      companyId: json['CompanyId'] as int?,
      companyName: json['CompanyName'] as String?,
      companyLogo: json['CompanyLogo'] as String?,
      skuCount: json['skuCount'] as int?,
      brandCount: json['brandCount'] as int?,
      link: json['link'] as String?,
      therapy:
          (json['therapy'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CompaniesToJson(Companies instance) => <String, dynamic>{
      'CompanyId': instance.companyId,
      'CompanyName': instance.companyName,
      'CompanyLogo': instance.companyLogo,
      'skuCount': instance.skuCount,
      'brandCount': instance.brandCount,
      'link': instance.link,
      'therapy': instance.therapy,
    };
