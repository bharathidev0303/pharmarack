import 'package:json_annotation/json_annotation.dart';

part 'distributor_store_status.g.dart';

@JsonSerializable()
class DistributorStoreStatus {
  @JsonKey(name: 'StoreId')
  final int storeId;
  @JsonKey(name: 'StoreName')
  final String storeName;
  @JsonKey(name: 'STATUS')
  final String? status;
  @JsonKey(name: 'DoNotShowToRetailer')
  final int? doNotShowToRetailer;
  @JsonKey(name: 'ContactNo')
  final String? phone;
  @JsonKey(name: 'Address')
  final String? address;

  DistributorStoreStatus({
    this.doNotShowToRetailer,
    required this.storeId,
    required this.storeName,
    this.status,
    this.phone,
    this.address,
  });

  factory DistributorStoreStatus.fromJson(Map<String, dynamic> json) =>
      _$DistributorStoreStatusFromJson(json);

  Map<String, dynamic> toJson() => _$DistributorStoreStatusToJson(this);
}
