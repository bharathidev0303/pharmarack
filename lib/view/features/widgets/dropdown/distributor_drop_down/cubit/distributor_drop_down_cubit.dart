import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_param.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/stockiest_priority_use_case.dart';
import 'package:pharmarack/view/features/widgets/dropdown/distributor_drop_down/use_case/distributor_drop_down_use_case.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';

class DistributorDropDownCubit extends Cubit<DistributorDropDownState> {
  final DistributorDropDownUseCase _distributorDropDownUseCase;
  final StockiestPriorityUseCase _stockiestPriorityUseCase;

  DistributorDropDownCubit(
    DistributorDropDownUseCase distributorDropDownUseCase,
    StockiestPriorityUseCase stockiestPriorityUseCase,
  )   : _distributorDropDownUseCase = distributorDropDownUseCase,
        _stockiestPriorityUseCase = stockiestPriorityUseCase,
        super(const DistributorDropDownInitState());

  textFieldTyped({required String query}) {
    if (query != '') {
      final response = _distributorDropDownUseCase.getMappedList(query);
      if (response.isNotEmpty) {
        if (response[0].isNotEmpty || response[1].isNotEmpty) {
          emit(DistributorFilteredDataState(response[0], response[1]));
        } else {
          emit(const DistributorDropDownEmptyState());
        }
      } else {
        emit(const DistributorDropDownEmptyState());
      }
    } else {
      getList();
    }
  }

  getList() {
    final distributorsList =
        _distributorDropDownUseCase.getListOfDistributors();

    distributorsList.fold((l) {
      emit(const DistributorDropDownEmptyState());
    }, (r) {
      emit(DistributorFilteredDataState(r[0], r[1]));
    });
  }

  fetchStockiestPriority(String page) async {
    final userId = onboardingDI<RetailerInfoEntity>().userId ?? 0;
    final retailerId = onboardingDI<RetailerInfoEntity>()
            .displayRetailers
            ?.where((e) => e.retailerId != null)
            .firstOrNull
            ?.retailerId ??
        0;
    if (page == 'order_history') {
      final response =
          await _stockiestPriorityUseCase.orderDistributorExecute();

      response.fold((l) => emit(const DistributorDropDownEmptyState()), (r) {
        if (r.isNotEmpty) {
          _distributorDropDownUseCase.updateStockiestPriorityLists(r);
        }
      });
    } else {
      final response = await _stockiestPriorityUseCase.execute(
          params: StockiestPriorityParams(
              StockiestPriorityParam(userId, retailedId: retailerId)));

      response.fold((l) => emit(const DistributorDropDownEmptyState()), (r) {
        if (r.isNotEmpty) {
          _distributorDropDownUseCase.updateStockiestPriorityLists(r);
        }
      });
    }
  }
}

class DistributorDropDownState extends Equatable {
  const DistributorDropDownState();

  @override
  List<Object?> get props => [];
}

class DistributorDropDownInitState extends DistributorDropDownState {
  const DistributorDropDownInitState();
}

class DistributorDropDownDataState extends DistributorDropDownState {
  final List<LoginResponseStores> list;

  const DistributorDropDownDataState(this.list);

  @override
  List<Object?> get props => [list];
}

class DistributorFilteredDataState extends DistributorDropDownState {
  final List<LoginResponseStores> mappedList;
  final List<LoginResponseStores> unMappedList;

  const DistributorFilteredDataState(this.mappedList, this.unMappedList);

  @override
  List<Object?> get props => [mappedList, unMappedList];
}

class DistributorDropDownFilterDataSate extends DistributorDropDownState {
  final List<LoginResponseStores> list;

  const DistributorDropDownFilterDataSate(this.list);
}

class DistributorDropDownEmptyState extends DistributorDropDownState {
  const DistributorDropDownEmptyState();
}

class ToggleDropDownState extends DistributorDropDownState {
  final bool toggle;

  const ToggleDropDownState({this.toggle = false});

  @override
  List<Object?> get props => [toggle];
}

class DistributorDropDownSearchState extends DistributorDropDownState {
  final bool isStarted;

  const DistributorDropDownSearchState({this.isStarted = false});
}
