import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core/log_util/log_util.dart';
import 'package:pharmarack/view/features/distributor_connection/distributor_connection_constants.dart';
import 'package:pharmarack/view/features/distributor_connection/presentation/cubit/request_distributor_connection_state.dart';

import '../../data/model/distributor_store_status.dart';
import '../../data/model/store_status_mapping_request_model.dart';
import '../../domain/usecase/get_nonmapped_stores_usecase.dart';
import '../../domain/usecase/request_store_mapping_usecase.dart';
import 'distributor_store_item.dart';

class RequestDistributorConnectionCubit
    extends Cubit<RequestDistributorConnectionState> {
  final GetNonmappedStoresUseCase _getNonmappedStoresUseCase;
  final RequestStoreMappingUseCase _requestStoreMappingUseCase;

  RequestDistributorConnectionCubit(
    this._getNonmappedStoresUseCase,
    this._requestStoreMappingUseCase,
  ) : super(RequestDistributorConnectionState.initial());

  Future<void> fetchNonMappedStores() async {
    emit(state.copyWith(isLoading: true));
    await _getNonmappedStoresUseCase
        .execute()
        .then((stores) => _onSuccessFetchNonMappedStores(stores))
        .catchError((e, stack) => _onErrorFetchNonMappedStores(e, stack))
        .whenComplete(() => emit(state.copyWith(isLoading: false)));
  }

  Future<void> sendStoreMappingRequest({
    required int storeId,
    required String storeName,
    required String partyCode,
  }) async {
    final request = [
      StoreStatusMappingRequestModel(
        storeId: storeId,
        storeName: storeName,
        partyCode: partyCode,
      ),
    ];
    emit(state.copyWith(mappingRequest: () => SendingMappingRequest()));
    await _requestStoreMappingUseCase
        .execute(request)
        .then((response) => _onSuccessRequestStoreMapping(response.data))
        .catchError((e, stack) => _onErrorRequestStoreMapping(e, stack));
  }

  void showMappingRequest(int storeId) {
    final store = state.storeItems.firstWhere(
      (element) => element.id == storeId,
      orElse: () => throw Exception('Store not found'),
    );
    emit(state.copyWith(
      mappingRequest: () => MappingRequestDetails(
        storeId: store.id,
        storeName: store.storeName,
        address: store.storeAddress,
      ),
    ));
  }

  void removeMappingRequest() {
    emit(state.copyWith(mappingRequest: () => null));
  }

  void removeMessage() {
    emit(state.copyWith(message: () => null));
  }

  void _onSuccessRequestStoreMapping(
    List<StoreStatusMappingRequestModel> response,
  ) {
    final success =
        response.where((element) => element.saved == true).isNotEmpty;

    emit(state.copyWith(
      mappingRequest: () {
        return success ? MappingRequestSent() : MappingRequestLimitExceeded();
      },
    ));
  }

  void _onErrorRequestStoreMapping(e, stack) {
    emit(
      state.copyWith(mappingRequest: () => MappingRequestFailed()),
    );
    LogUtil.error(
      'Error fetching non mapped stores: ',
      error: e,
      stackTrace: stack,
    );
  }

  void _onErrorFetchNonMappedStores(e, stack) {
    emit(state.copyWith(message: () => ErrorFetchingNonMappedStores()));
    LogUtil.error(
      'Error fetching non mapped stores: ',
      error: e,
      stackTrace: stack,
    );
  }

  void _onSuccessFetchNonMappedStores(List<DistributorStoreStatus> storeList) {
    return emit(
      state.copyWith(storeItems: _mapStoreListToStoreItems(storeList)),
    );
  }

  List<DistributorStoreItem> _mapStoreListToStoreItems(
    List<DistributorStoreStatus> storeList,
  ) {
    return storeList.map(
      (store) {
        return DistributorStoreItem(
          id: store.storeId,
          storeName: store.storeName,
          storeAddress: store.address ?? "N/A",
          mappingRequestSent:
              store.status == DistributorConnectionConstants.statusPending,
        );
      },
    ).toList(growable: false);
  }

  void searchDistributor(String value) {
    if (value.isEmpty) {
      emit(state.copyWith(searchResult: () => null));
      return;
    }
    final searchResult = state.storeItems.where(
      (element) {
        return element.storeName.toLowerCase().contains(value.toLowerCase());
      },
    ).toList(growable: false);
    emit(state.copyWith(searchResult: () => searchResult));
  }
}
