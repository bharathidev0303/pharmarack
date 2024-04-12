// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommonResponseEntity<T> _$CommonResponseEntityFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    CommonResponseEntity<T>(
      success: json['success'] as bool?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      message: json['message'] as String?,
    )..status = json['status'] as String?;

Map<String, dynamic> _$CommonResponseEntityToJson<T>(
  CommonResponseEntity<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'message': instance.message,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
