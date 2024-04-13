import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/distributor_connection/presentation/cubit/distributor_store_item.dart';

class RequestDistributorConnectionState extends Equatable {
  final bool isLoading;
  final UserMessage? message;
  final List<DistributorStoreItem> storeItems;
  final MappingRequest? mappingRequest;
  final List<DistributorStoreItem>? searchResult;

  const RequestDistributorConnectionState(
    this.isLoading,
    this.message,
    this.storeItems,
    this.mappingRequest,
    this.searchResult,
  );

  factory RequestDistributorConnectionState.initial() {
    return const RequestDistributorConnectionState(
      false,
      null,
      [],
      null,
      null,
    );
  }

  RequestDistributorConnectionState copyWith({
    bool? isLoading,
    UserMessage? Function()? message,
    List<DistributorStoreItem>? storeItems,
    MappingRequest? Function()? mappingRequest,
    List<DistributorStoreItem>? Function()? searchResult,
  }) {
    return RequestDistributorConnectionState(
      isLoading ?? this.isLoading,
      message != null ? message() : this.message,
      storeItems ?? this.storeItems,
      mappingRequest != null ? mappingRequest() : this.mappingRequest,
      searchResult != null ? searchResult() : this.searchResult,
    );
  }

  @override
  List<Object?> get props =>
      [isLoading, message, storeItems, mappingRequest, searchResult];

  @override
  bool get stringify => true;
}

sealed class MappingRequest with EquatableMixin {
  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}

class SendingMappingRequest extends MappingRequest {}

class MappingRequestFailed extends MappingRequest {}

class MappingRequestLimitExceeded extends MappingRequest {}

class MappingRequestSent extends MappingRequest {}

class MappingRequestDetails extends MappingRequest {
  final int storeId;
  final String storeName;
  final String? address;

  MappingRequestDetails({
    required this.storeId,
    required this.storeName,
    this.address,
  });

  @override
  List<Object?> get props {
    return [storeId, storeName, address];
  }
}

class UserMessage with EquatableMixin {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

class ErrorFetchingNonMappedStores extends UserMessage {}
