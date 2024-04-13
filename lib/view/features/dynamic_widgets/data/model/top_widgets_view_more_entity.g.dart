// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_widgets_view_more_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopWidgetsViewMoreEntity _$TopWidgetsViewMoreEntityFromJson(
        Map<String, dynamic> json) =>
    TopWidgetsViewMoreEntity(
      success: json['success'] as bool?,
      statusCode: json['StatusCode'] as int?,
      data: json['data'] as List<dynamic>?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$TopWidgetsViewMoreEntityToJson(
        TopWidgetsViewMoreEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'StatusCode': instance.statusCode,
      'data': instance.data,
      'message': instance.message,
    };
