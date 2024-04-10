// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_api_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackApiRequestEntity _$FeedbackApiRequestEntityFromJson(
        Map<String, dynamic> json) =>
    FeedbackApiRequestEntity(
      type: json['type'] as String?,
      feedbackTo: json['feedbackto'] as String?,
      remarks: json['remarks'] as String?,
      rating: json['rating'] as String?,
      platform: json['platform'] as String?,
      appVersion: json['appversion'] as String?,
      storeId: json['storeid'] as String?,
    );

Map<String, dynamic> _$FeedbackApiRequestEntityToJson(
        FeedbackApiRequestEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'feedbackto': instance.feedbackTo,
      'remarks': instance.remarks,
      'rating': instance.rating,
      'storeid': instance.storeId,
      'appversion': instance.appVersion,
      'platform': instance.platform,
    };
