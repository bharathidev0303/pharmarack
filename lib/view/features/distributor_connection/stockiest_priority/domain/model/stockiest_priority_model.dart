import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/model/stockiest_entity.dart';

class StockiestPriorityModel {
  String? setDistributorPriorityId;
  int? storeId;
  int? retailerId;
  int? priority;
  String? createdBy;
  String? storeName;
  int? displayIndex;

  StockiestPriorityModel(
      {this.setDistributorPriorityId,
      this.storeId,
      this.retailerId,
      this.priority,
      this.createdBy,
      this.storeName,
      this.displayIndex});

  factory StockiestPriorityModel.fromStockiestEntity(
      StockiestResponseEntity entity) {
    return StockiestPriorityModel(
        setDistributorPriorityId: entity.setDistributorPriorityId,
        storeId: entity.storeId,
        retailerId: entity.retailerId,
        priority: entity.priority,
        createdBy: entity.createdBy,
        storeName: entity.storeName,
        displayIndex: 0);
  }

  StockiestPriorityModel copyWith(
      {String? setDistributorPriorityId,
      int? storeId,
      int? retailerId,
      int? priority,
      String? createdBy,
      String? storeName,
      int? displayIndex}) {
    return StockiestPriorityModel(
      setDistributorPriorityId:
          setDistributorPriorityId ?? this.setDistributorPriorityId,
      storeId: storeId ?? this.storeId,
      retailerId: retailerId ?? this.retailerId,
      priority: priority ?? this.priority,
      createdBy: createdBy ?? this.createdBy,
      storeName: storeName ?? this.storeName,
      displayIndex: displayIndex ?? this.displayIndex,
    );
  }
}
