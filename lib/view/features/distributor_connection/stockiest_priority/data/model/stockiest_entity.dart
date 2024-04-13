import 'package:json_annotation/json_annotation.dart';

part 'stockiest_entity.g.dart';

@JsonSerializable()
class StockiestResponseEntity {
  @JsonKey(name: 'SetDistributorPriorityId')
  String? setDistributorPriorityId;
  @JsonKey(name: 'StoreId')
  int? storeId;
  @JsonKey(name: 'RetailerId')
  int? retailerId;
  @JsonKey(name: 'Priority')
  int? priority;
  @JsonKey(name: 'CreatedBy')
  String? createdBy;
  @JsonKey(name: 'StoreName')
  String? storeName;

  StockiestResponseEntity({
    this.setDistributorPriorityId,
    this.storeId,
    this.retailerId,
    this.priority,
    this.createdBy,
    this.storeName,
  });

  factory StockiestResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$StockiestResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$StockiestResponseEntityToJson(this);

  StockiestResponseEntity copyWith({
    String? setDistributorPriorityId,
    int? storeId,
    int? retailerId,
    int? priority,
    String? createdBy,
    String? storeName,
  }) {
    return StockiestResponseEntity(
      setDistributorPriorityId:
          setDistributorPriorityId ?? this.setDistributorPriorityId,
      storeId: storeId ?? this.storeId,
      retailerId: retailerId ?? this.retailerId,
      priority: priority ?? this.priority,
      createdBy: createdBy ?? this.createdBy,
      storeName: storeName ?? this.storeName,
    );
  }
}
