// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackEntity _$FeedbackEntityFromJson(Map<String, dynamic> json) =>
    FeedbackEntity(
      success: json['success'] as bool?,
      statusCode: json['StatusCode'] as int?,
      feedback: (json['data'] as List<dynamic>?)
          ?.map((e) => FeedbackItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeedbackEntityToJson(FeedbackEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'StatusCode': instance.statusCode,
      'data': instance.feedback,
    };

FeedbackItem _$FeedbackItemFromJson(Map<String, dynamic> json) => FeedbackItem(
      feedbackId: json['FeedbackId'] as int?,
      title: json['title'] as String?,
      rating: json['rating'] as String?,
    );

Map<String, dynamic> _$FeedbackItemToJson(FeedbackItem instance) =>
    <String, dynamic>{
      'FeedbackId': instance.feedbackId,
      'title': instance.title,
      'rating': instance.rating,
    };
