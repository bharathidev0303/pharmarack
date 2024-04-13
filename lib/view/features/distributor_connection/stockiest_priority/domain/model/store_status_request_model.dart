import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/model/store_status_mapping_request_entity.dart';

class StoreStatusRequestModel {
  final int storeId;
  final String storeName;
  final String? partyCode;
  final String? status;
  final bool? saved;

  StoreStatusRequestModel({
    required this.storeId,
    required this.storeName,
    this.partyCode,
    this.status,
    this.saved,
  });

  factory StoreStatusRequestModel.fromStockiestEntity(
    StoreStatusMappingRequestEntity entity,
  ) {
    return StoreStatusRequestModel(
      storeId: entity.storeId,
      storeName: entity.storeName,
      partyCode: entity.partyCode,
      status: entity.status,
      saved: entity.saved,
    );
  }

  StoreStatusRequestModel copyWith({
    int? storeId,
    String? storeName,
    String? partyCode,
    String? status,
    bool? saved,
  }) {
    return StoreStatusRequestModel(
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      partyCode: partyCode ?? this.partyCode,
      status: status ?? this.status,
      saved: saved ?? this.saved,
    );
  }
}
