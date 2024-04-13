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
