import 'package:equatable/equatable.dart';

import '../../domain/model/display_orders_model.dart';

abstract class OrderHistoryState extends Equatable {
  @override
  List<Object?> get props => [];

  const OrderHistoryState();
}

class OrderHistoryInitialState extends OrderHistoryState {}

class OrderHistoryLoadingState extends OrderHistoryState {}

class OrderHistoryErrorState extends OrderHistoryState {}

class OrderHistoryNoDataState extends OrderHistoryState {}

class OrderHistoryResetState extends OrderHistoryState {}

class OrderHistorySuccessState extends OrderHistoryState {
  final List<DisplayOrder> orders;
  final String status;

  const OrderHistorySuccessState(this.orders, this.status);
}
