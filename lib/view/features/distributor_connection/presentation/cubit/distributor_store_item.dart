import 'package:equatable/equatable.dart';

// Data to display list item ui
class DistributorStoreItem extends Equatable {
  final int id;
  final bool mappingRequestSent;
  final String storeName;
  final String storeAddress;

  const DistributorStoreItem({
    required this.id,
    required this.storeName,
    required this.storeAddress,
    this.mappingRequestSent = false,
  });

  DistributorStoreItem copyWith({
    int? id,
    bool? mappingRequestSent,
    String? storeName,
    String? storeAddress,
  }) {
    return DistributorStoreItem(
      id: id ?? this.id,
      mappingRequestSent: mappingRequestSent ?? this.mappingRequestSent,
      storeName: storeName ?? this.storeName,
      storeAddress: storeAddress ?? this.storeAddress,
    );
  }

  @override
  List<Object?> get props => [id, mappingRequestSent, storeName, storeAddress];

  @override
  bool? get stringify => true;
}
