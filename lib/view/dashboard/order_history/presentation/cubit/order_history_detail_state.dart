import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_order_detail_model.dart';

class OrderHistoryDetailState extends Equatable {
  final OrderDetailMessage orderDetailMessage;
  final DisplayOrderDetailModel? displayOrderDetailModel;

  const OrderHistoryDetailState(
      this.orderDetailMessage, this.displayOrderDetailModel);

  factory OrderHistoryDetailState.initial() {
    return OrderHistoryDetailState(OrderDetailNone(), null);
  }

  OrderHistoryDetailState copyWith({
    OrderDetailMessage? orderDetailMessage,
    DisplayOrderDetailModel? displayOrderDetailModel,
  }) {
    return OrderHistoryDetailState(
      orderDetailMessage ?? this.orderDetailMessage,
      displayOrderDetailModel ?? this.displayOrderDetailModel,
    );
  }

  @override
  List<Object?> get props => [
        orderDetailMessage,
        displayOrderDetailModel,
      ];
}

class OrderDetailMessage with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class OrderDetailNone extends OrderDetailMessage {}

class OrderDetailSuccess extends OrderDetailMessage {}

class OrderDetailFailure extends OrderDetailMessage {
  final String errorMsg;

  OrderDetailFailure(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}

class OrderDetailLoading extends OrderDetailMessage {}
