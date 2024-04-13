import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/model/distributor_store_entity.dart';

class DistributorStoreModel {
  final int? storeId;
  final String? storeName;
  final String? status;
  final String? phone;
  final String? address;

  DistributorStoreModel({
    this.storeId,
    this.storeName,
    this.status,
    this.phone,
    this.address,
  });

  factory DistributorStoreModel.fromDistributorsStoreEntity(
      DistributorStoreEntity entity) {
    return DistributorStoreModel(
      storeId: entity.storeId,
      storeName: entity.storeName,
      status: entity.status,
      phone: entity.phone,
      address: entity.address,
    );
  }

  DistributorStoreModel copyWith({
    int? storeId,
    String? storeName,
    String? status,
    String? phone,
    String? address,
  }) {
    return DistributorStoreModel(
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      status: status ?? this.status,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }
}
