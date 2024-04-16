// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllFilter _$AllFilterFromJson(Map<String, dynamic> json) => AllFilter(
      success: json['success'] as bool,
      statusCode: json['StatusCode'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$AllFilterToJson(AllFilter instance) => <String, dynamic>{
      'success': instance.success,
      'StatusCode': instance.statusCode,
      'data': instance.data,
      'message': instance.message,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      orderStatusId: json['order_status_id'] as int,
      status: json['status'] as String,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'order_status_id': instance.orderStatusId,
      'status': instance.status,
    };
