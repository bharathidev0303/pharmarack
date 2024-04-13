import 'package:json_annotation/json_annotation.dart';

part 'store_status_mapping_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class StoreStatusMappingRequestModel {
  @JsonKey(name: 'StoreId')
  final int storeId;

  @JsonKey(name: 'StoreName')
  final String storeName;

  @JsonKey(name: 'PartyCode')
  final String? partyCode;

  @JsonKey(name: 'Status')
  final String? status;

  @JsonKey(name: 'Saved')
  final bool? saved;

  StoreStatusMappingRequestModel({
    required this.storeId,
    required this.storeName,
    this.partyCode,
    this.status,
    this.saved,
  });

  factory StoreStatusMappingRequestModel.fromJson(Map<String, dynamic> json) =>
      _$StoreStatusMappingRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreStatusMappingRequestModelToJson(this);
}
