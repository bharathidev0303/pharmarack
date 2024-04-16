// import 'package:core_flutter/common_entity/login_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_order_param.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/display_orders_usecase.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';

// import '../../../../di/app_provider.dart';
import 'order_history_list_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  final DisplayOrdersUseCase _displayOrdersUseCase;
  // final LoginEntity _loginEntity;

  OrderHistoryCubit(DisplayOrdersUseCase displayOrdersUseCase)
      : _displayOrdersUseCase = displayOrdersUseCase,
        // _loginEntity = loginEntity,
        super(OrderHistoryInitialState());

  void getDisplayOrders({OrderHistoryFilterParams? filterParams}) async {
    final userId = onboardingDI<RetailerInfoEntity>().userId ?? 0;
    emit(OrderHistoryLoadingState());
    //hard coded params will replace when filter story will be ready
    DisplayOrderListParams params = DisplayOrderListParams(DisplayOrdersParam(
        storeId: filterParams != null ? filterParams.storeId : -1,
        userId: userId
            .toString(), //_loginEntity.userId.toString(),//RetailerInfoEntity().userId.toString(),//TODO:UserId need to assinged dynamically.
        searchText: filterParams != null ? filterParams.searchTxt : "",
        fromDate: filterParams != null ? filterParams.fromDate : "",
        toDate: filterParams != null ? filterParams.toDate : "",
        operation: "View",
        status: filterParams != null
            ? filterParams.status
            : "Placed,Uploaded,Processed"));

    final response = await _displayOrdersUseCase.execute(params: params);
    response.fold(
        (l) => {emit(OrderHistoryErrorState())},
        (r) => {
              if (r == null)
                {emit(OrderHistoryErrorState())}
              else if (r.isEmpty)
                {emit(OrderHistoryNoDataState())}
              else
                {
                  emit(OrderHistorySuccessState(
                      r, filterParams != null ? filterParams.status : ''))
                }
            });
  }

  void resetOrderSearch() {
    emit(OrderHistoryResetState());
  }
}
