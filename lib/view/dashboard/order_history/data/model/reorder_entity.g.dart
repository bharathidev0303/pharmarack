// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reorder_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReorderEntity _$ReorderEntityFromJson(Map<String, dynamic> json) =>
    ReorderEntity(
      statusCode: json['StatusCode'] as String?,
      message: json['Message'] as String?,
      hideProductMSG: json['HideProductMSG'],
      iList: json['IList'],
    );

Map<String, dynamic> _$ReorderEntityToJson(ReorderEntity instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'Message': instance.message,
      'HideProductMSG': instance.hideProductMSG,
      'IList': instance.iList,
    };
