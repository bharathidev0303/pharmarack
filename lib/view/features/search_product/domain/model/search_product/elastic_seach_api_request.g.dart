// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elastic_seach_api_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ElasticSearchApiRequest _$ElasticSearchApiRequestFromJson(
        Map<String, dynamic> json) =>
    ElasticSearchApiRequest(
      searchKeyword: json['SearchKeyword'] as String,
      cartSource: json['CartSource'] as String,
      storeName:
          (json['StoreName'] as List<dynamic>).map((e) => e as String).toList(),
      count: json['Count'] as int,
      skipCount: json['SkipCount'] as int,
    );

Map<String, dynamic> _$ElasticSearchApiRequestToJson(
        ElasticSearchApiRequest instance) =>
    <String, dynamic>{
      'SearchKeyword': instance.searchKeyword,
      'CartSource': instance.cartSource,
      'StoreName': instance.storeName,
      'Count': instance.count,
      'SkipCount': instance.skipCount,
    };

ElasticSearchCompanyApiRequest _$ElasticSearchCompanyApiRequestFromJson(
        Map<String, dynamic> json) =>
    ElasticSearchCompanyApiRequest(
      searchKeyword: json['SearchKeyword'] as String,
      company:
          (json['Company'] as List<dynamic>).map((e) => e as String).toList(),
      storeName:
          (json['StoreName'] as List<dynamic>).map((e) => e as String).toList(),
      count: json['Count'] as int,
      skipCount: json['SkipCount'] as int,
    );

Map<String, dynamic> _$ElasticSearchCompanyApiRequestToJson(
        ElasticSearchCompanyApiRequest instance) =>
    <String, dynamic>{
      'SearchKeyword': instance.searchKeyword,
      'Company': instance.company,
      'StoreName': instance.storeName,
      'Count': instance.count,
      'SkipCount': instance.skipCount,
    };

ElasticSearchTheropyApiRequest _$ElasticSearchTheropyApiRequestFromJson(
        Map<String, dynamic> json) =>
    ElasticSearchTheropyApiRequest(
      therapyName: json['TherapyName'] as String,
      company:
          (json['Company'] as List<dynamic>).map((e) => e as String).toList(),
      storeName:
          (json['StoreName'] as List<dynamic>).map((e) => e as String).toList(),
      count: json['Count'] as int,
      skipCount: json['SkipCount'] as int,
    );

Map<String, dynamic> _$ElasticSearchTheropyApiRequestToJson(
        ElasticSearchTheropyApiRequest instance) =>
    <String, dynamic>{
      'TherapyName': instance.therapyName,
      'Company': instance.company,
      'StoreName': instance.storeName,
      'Count': instance.count,
      'SkipCount': instance.skipCount,
    };
