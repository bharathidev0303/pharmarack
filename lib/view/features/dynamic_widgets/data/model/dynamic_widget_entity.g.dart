// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dynamic_widget_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DynamicWidgetEntity _$DynamicWidgetEntityFromJson(Map<String, dynamic> json) =>
    DynamicWidgetEntity(
      title: json['title'] as String?,
      description: json['description'] as String?,
      sequence: (json['sequence'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      components: json['components'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$DynamicWidgetEntityToJson(
        DynamicWidgetEntity instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'sequence': instance.sequence,
      'components': instance.components,
    };
