
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/failure_custom_dialog.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_order_param.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/status_item.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/order_history_filter_use_case.dart';


class OrderHistoryFilterCubit extends Cubit<OrderHistoryFilterState> {
  final OrderHistoryFilterUseCase orderHistoryFilterUseCase;
  OrderHistoryFilterCubit(this.orderHistoryFilterUseCase)
      : super(OrderHistoryFilterInitState());
  String from = '';
  String to = '';
  int storeId = -1;
  String searchTxt = '';
  String status = '';

  getListOfStatus() async {
    final statusList = orderHistoryFilterUseCase
        .execute(); //orderHistoryFilterUseCase.getStatusList();
    statusList.then((value) => value.fold(
        (l) => FailureCustomDialog(
            title: 'Something went wrong', subTitle: l.error.message),
        (r) => {
              if (r.data != null &&
                  orderHistoryFilterUseCase.statusList.length == 1)
                {
                  for (int i = 0; i < r.data!.length; i++)
                    {
                      orderHistoryFilterUseCase.statusList.add(StatusItem(
                          name: r.data![i].status,
                          id: r.data![i].orderStatusId))
                    },
                  emit(OrderHistoryFilterDataState(
                      orderHistoryFilterUseCase.statusList))
                }
              else
                {
                  emit(OrderHistoryFilterDataState(
                      orderHistoryFilterUseCase.statusList))
                }
            }));
    // orderHistoryFilterUseCase.statusList != null && orderHistoryFilterUseCase.statusList!=[] ? emit(OrderHistoryFilterDataState(orderHistoryFilterUseCase.statusList)):emit(OrderHistoryFilterInitState());
  }

  updateStatusList(int index, bool isSelected, String status) {
    final statusList = orderHistoryFilterUseCase.updateTheStatusList(index);
    emit(OrderHistoryFilterUpdatedDataState(
        statusList, isSelected, index, status));
  }

  OrderHistoryFilterParams? apiCallWithFilters() {
    final list = orderHistoryFilterUseCase.getStatusList();
    List<String> selectedStatus = [];

    for (StatusItem statusItem in list) {
      if (statusItem.isSelected) {
        selectedStatus.add(statusItem.id.toString());
      }
    }

    final fromDate = from;
    final toDate = to;

    if (selectedStatus.isNotEmpty) {
      final String list = selectedStatus.join(',');
      status = list;

      return OrderHistoryFilterParams(
          fromDate: fromDate,
          toDate: toDate,
          status: list,
          storeId: storeId,
          searchTxt: searchTxt);
    } else if (selectedStatus.isEmpty &&
        fromDate.isNotEmpty &&
        toDate.isNotEmpty) {
      return OrderHistoryFilterParams(
          fromDate: fromDate,
          toDate: toDate,
          status: '',
          storeId: storeId,
          searchTxt: searchTxt);
    } else {
      return OrderHistoryFilterParams(
          fromDate: '',
          toDate: '',
          status: '',
          storeId: storeId,
          searchTxt: searchTxt);
    }
  }

  OrderHistoryFilterParams? resetCallWithFilters() {
    final list = orderHistoryFilterUseCase.resetTheStatusList();
    from = '';
    to = '';
    List<String> selectedStatus = [];

    for (StatusItem statusItem in list) {
      if (statusItem.isSelected) {
        selectedStatus.add(statusItem.name);
      }
    }
    return OrderHistoryFilterParams(
        fromDate: '',
        toDate: '',
        status: '',
        storeId: storeId,
        searchTxt: searchTxt);
  }

  updateFomDate(String selectedDate) {
    orderHistoryFilterUseCase.fromDate = selectedDate;
    from = selectedDate;
    emit(FromChangeDateState(selectedDate));
  }

  updateToDate(String selectedDate) {
    to = selectedDate;
    orderHistoryFilterUseCase.toDate = selectedDate;
    emit(ToChangeDateState(selectedDate));
  }
}

class OrderHistoryFilterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrderHistoryFilterInitState extends OrderHistoryFilterState {}

class OrderHistoryFilterDataState extends OrderHistoryFilterState {
  final List<StatusItem> list;
  OrderHistoryFilterDataState(this.list);

  @override
  List<Object?> get props => [list];
}

class OrderHistoryFilterUpdatedDataState extends OrderHistoryFilterState {
  final List<StatusItem> list;
  final bool isSelected;
  final int index;
  final String status;
  OrderHistoryFilterUpdatedDataState(
      this.list, this.isSelected, this.index, this.status);

  @override
  List<Object?> get props => [isSelected, index, status];
}

class FromChangeDateState extends OrderHistoryFilterState {
  final String dateTime;
  FromChangeDateState(this.dateTime);

  @override
  List<Object?> get props => [dateTime];
}

class ToChangeDateState extends OrderHistoryFilterState {
  final String dateTime;
  ToChangeDateState(this.dateTime);

  @override
  List<Object?> get props => [dateTime];
}
