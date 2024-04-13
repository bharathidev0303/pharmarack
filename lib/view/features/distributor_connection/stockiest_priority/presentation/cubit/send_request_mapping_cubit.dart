import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/view/features/distributor_connection/data/model/multiple_store_mapping_request_model.dart';
import 'package:pharmarack/view/features/distributor_connection/data/model/store_status_mapping_request_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/endpoints_constants/stockiest_priority_options.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/distributor_store_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/store_request_mapping_use_case.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/distributor_mapped_tab_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/states/send_request_mapping_state.dart';

class SendRequestMappingCubit extends Cubit<SendRequestMappingState> {
  final StoreRequestMappingUseCase _storeRequestMappingUseCase;
  final DistributorMappedTabCubit _distributorMappedTabCubit;

  SendRequestMappingCubit(
      this._storeRequestMappingUseCase, this._distributorMappedTabCubit)
      : super(SendRequestStoreMappingsInitialState());

  void sendStoreRequestMapping(RetailerInfoEntity retailerEntity,
      DistributorStoreModel store, String partyCode) async {
    emit(LoadingSendRequestStoreMappings(UniqueKey().toString()));
    final response = await _storeRequestMappingUseCase.execute(
      params: StoreRequestMappingParams(
        StoreRequestMappingParam(
          {
            StockiestPriorityOptions.mapRequests: jsonEncode(
              MultipleStoreMappingRequestModel(
                rid: retailerEntity.getRetailerId() ?? 0,
                maprequests: [
                  StoreStatusMappingRequestModel(
                    storeId: store.storeId ?? -1,
                    storeName: store.storeName ?? "",
                    partyCode: partyCode,
                  ),
                ],
              ),
            )
            // StockiestPriorityOptions.rId: retailerEntity.getRetailerId(),
            // StockiestPriorityOptions.uId: retailerEntity.userId,
            // StockiestPriorityOptions.mapRequests: jsonEncode(
            //   [
            //     StoreStatusMappingRequestEntity(
            //       storeId: store.storeId ?? -1,
            //       storeName: store.storeName ?? "",
            //       partyCode: partyCode,
            //     ),
            //   ],
            // ),
          },
        ),
      ),
    );

    response.fold((l) {
      emit(
        FailureSendRequestStoreMappings(
          l.error.message,
          UniqueKey().toString(),
        ),
      );
    }, (r) {
      if (r.first.saved ?? false) {
        _distributorMappedTabCubit.updateNonMappedState(
          store.copyWith(
            storeId: r.first.storeId,
            storeName: null,
            status: StockiestPriorityOptions.pending,
            phone: null,
            address: null,
          ),
        );
        emit(
          SuccessSendRequestStoreMappings(
            UniqueKey().toString(),
          ),
        );
      } else {
        emit(
          MaximumLimitReachedState(
            r.first.status ?? "",
            UniqueKey().toString(),
          ),
        );
      }
    });
  }
}
