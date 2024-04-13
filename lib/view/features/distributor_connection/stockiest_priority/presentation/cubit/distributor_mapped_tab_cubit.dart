import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/search_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/distributor_store_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_param.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/mapped_non_mapped_search_use_case.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/non_mapped_distributors_use_case.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/stockiest_priority_use_case.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/save_priority_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/states/stockiest_priority_state.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';

class DistributorMappedTabCubit extends Cubit<StockiestPriorityState> {
  final StockiestPriorityUseCase _stockiestPriorityUseCase;
  final NonMappedDistributorsUseCase _nonMappedDistributorsUseCase;
  final MappedNonMappedSearchUseCase _mappedNonMappedSearchUseCase;
  final SavePriorityCubit _savePriorityCubit;
  final SearchCubit _searchCubit;
  final userId = onboardingDI<RetailerInfoEntity>().userId ?? 0;
  final retailerId = onboardingDI<RetailerInfoEntity>().getRetailerId() ?? 0;

  DistributorMappedTabCubit(
    StockiestPriorityUseCase stockiestPriorityUseCase,
    NonMappedDistributorsUseCase nonMappedDistributorsUseCase,
    MappedNonMappedSearchUseCase mappedNonMappedSearchUseCase,
    SearchCubit searchCubit,
    SavePriorityCubit savePriorityCubit,
  )   : _stockiestPriorityUseCase = stockiestPriorityUseCase,
        _nonMappedDistributorsUseCase = nonMappedDistributorsUseCase,
        _mappedNonMappedSearchUseCase = mappedNonMappedSearchUseCase,
        _searchCubit = searchCubit,
        _savePriorityCubit = savePriorityCubit,
        super(StockiestPriorityInitialState());

  void requestStockiestResponse(String? page) async {
    emit(StockiestLoadingState());

    var (List<StockiestPriorityModel> mappedResponses, BaseError? _) =
        ([], null);
    var (List<DistributorStoreModel> nonMappedResponses, BaseError? _) =
        ([], null);
    final mappedResponse;
    if (page == 'order_history') {
      mappedResponse =
          await _stockiestPriorityUseCase.orderDistributorExecute();
    } else {
      mappedResponse = await _stockiestPriorityUseCase.execute(
          params: StockiestPriorityParams(
        StockiestPriorityParam(userId),
      ));
    }

    final nonMappedResponse = await _nonMappedDistributorsUseCase.execute(
      params: StockiestPriorityParams(
        StockiestPriorityParam(userId, retailedId: retailerId),
      ),
    );

    mappedResponse.fold((l) {}, (r) {
      mappedResponses.addAll(r);
    });

    nonMappedResponse.fold((l) {
      if (mappedResponses.isEmpty && nonMappedResponses.isEmpty) {
        emit(StockiestNoDataState());
      } else {
        final results = _addDataInNonMappedUseCaseAndSortData(
          mappedResponses,
          nonMappedResponses,
        );
        updateListWhenListReorder(results);
        _savePrioritiesInitially(results);
        emit(
          StockiestSuccessState(
            results,
            nonMappedResponses,
          ),
        );
      }
    }, (r) {
      nonMappedResponses.addAll(r);
      if (mappedResponses.isEmpty && nonMappedResponses.isEmpty) {
        emit(StockiestNoDataState());
      } else {
        final results = _addDataInNonMappedUseCaseAndSortData(
          mappedResponses,
          nonMappedResponses,
        );
        updateListWhenListReorder(results);
        _savePrioritiesInitially(results);
        emit(
          StockiestSuccessState(
            results,
            nonMappedResponses,
          ),
        );
      }
    });
  }

  void performSearch() async {
    var (mappedList, nonMappedList) = _mappedNonMappedSearchUseCase
        .searchMappedNonMappedResults(_searchCubit.state);

    emit(
      StockiestSearchState(
        stockiestResponses: mappedList,
        distributorResponses: nonMappedList,
      ),
    );
  }

  void _savePrioritiesInitially(
    List<StockiestPriorityModel> mappedResponses,
  ) {
    _savePriorityCubit.saveDistributorPriorities(
      userId,
      mappedResponses,
      shouldEmitState: false,
    );
  }

  void updateNonMappedState(DistributorStoreModel distributorStoreModel) {
    final (mappedResults, nonMappedResults) =
        _mappedNonMappedSearchUseCase.updateNonMappedState(
      distributorStoreModel.storeId ?? -1,
      distributorStoreModel.status ?? "",
      _searchCubit.state,
    );

    emit(
      StockiestSuccessState(
        mappedResults,
        nonMappedResults,
      ),
    );
  }

  void updateListWhenListReorder(List<StockiestPriorityModel> mappedValues) {
    _mappedNonMappedSearchUseCase.updateListBasedOnReorder(mappedValues);
  }

  List<StockiestPriorityModel> _addDataInNonMappedUseCaseAndSortData(
    List<StockiestPriorityModel> mappedResponses,
    List<DistributorStoreModel> nonMappedResponses,
  ) {
    _mappedNonMappedSearchUseCase.updateList(
        mappedResponses, nonMappedResponses);
    return _mappedNonMappedSearchUseCase.sortMappedListOnPriority();
  }
}
