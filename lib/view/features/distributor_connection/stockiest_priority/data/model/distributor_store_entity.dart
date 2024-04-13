import 'package:json_annotation/json_annotation.dart';

part 'distributor_store_entity.g.dart';

@JsonSerializable()
class DistributorStoreEntity {
  @JsonKey(name: 'StoreId')
  final int? storeId;
  @JsonKey(name: 'StoreName')
  final String? storeName;
  @JsonKey(name: 'Status')
  final String? status;
  @JsonKey(name: 'Phone')
  final String? phone;
  @JsonKey(name: 'Address')
  final String? address;

  DistributorStoreEntity({
    this.storeId,
    this.storeName,
    this.status,
    this.phone,
    this.address,
  });

  factory DistributorStoreEntity.fromJson(Map<String, dynamic> json) =>
      _$DistributorStoreEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DistributorStoreEntityToJson(this);
}
