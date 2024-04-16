import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/order_history_detail_use_case.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/order_history_detail_state.dart';


class OrderHistoryDetailCubit extends Cubit<OrderHistoryDetailState> {
  final OrderHistoryDetailUseCase orderHistoryDetailUseCase;

  OrderHistoryDetailCubit(super.initialState, this.orderHistoryDetailUseCase);

  void displayOrderDetail(double orderId) async {
    emit(state.copyWith(orderDetailMessage: OrderDetailLoading()));

    final result = await orderHistoryDetailUseCase.execute(
      params: OrderHistoryDetailParams(
        OrderHistoryDetailParam(orderId),
      ),
    );

    result.fold(
      (l) {
        emit(
          state.copyWith(
            orderDetailMessage: OrderDetailFailure(l.error.message),
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
              orderDetailMessage: OrderDetailSuccess(),
              displayOrderDetailModel: r),
        );
      },
    );
  }
}
