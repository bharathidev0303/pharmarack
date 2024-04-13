// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_status_mapping_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreStatusMappingRequestEntity _$StoreStatusMappingRequestEntityFromJson(
        Map<String, dynamic> json) =>
    StoreStatusMappingRequestEntity(
      storeId: json['StoreId'] as int,
      storeName: json['StoreName'] as String,
      partyCode: json['PartyCode'] as String?,
      status: json['Status'] as String?,
      saved: json['Saved'] as bool?,
    );

Map<String, dynamic> _$StoreStatusMappingRequestEntityToJson(
    StoreStatusMappingRequestEntity instance) {
  final val = <String, dynamic>{
    'StoreId': instance.storeId,
    'StoreName': instance.storeName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PartyCode', instance.partyCode);
  writeNotNull('Status', instance.status);
  writeNotNull('Saved', instance.saved);
  return val;
}
