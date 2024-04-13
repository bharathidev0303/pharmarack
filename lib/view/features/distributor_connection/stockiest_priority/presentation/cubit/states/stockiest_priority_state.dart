import 'package:equatable/equatable.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/distributor_store_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_model.dart';

/// This class [StockiestPriorityState] which should be consume by Cubit as it's state
abstract class StockiestPriorityState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StockiestPriorityInitialState extends StockiestPriorityState {}

class StockiestNoDataState extends StockiestPriorityState {}

class StockiestLoadingState extends StockiestPriorityState {}

class StockiestSuccessState extends StockiestPriorityState {
  final List<StockiestPriorityModel> stockiestResponses;
  final List<DistributorStoreModel> distributorResponses;

  StockiestSuccessState(this.stockiestResponses, this.distributorResponses);

  @override
  List<Object?> get props => [stockiestResponses, distributorResponses];
}

class StockiestSearchState extends StockiestPriorityState {
  final List<StockiestPriorityModel> stockiestResponses;
  final List<DistributorStoreModel> distributorResponses;

  StockiestSearchState({
    required this.stockiestResponses,
    required this.distributorResponses,
  });

  @override
  List<Object?> get props => [stockiestResponses, distributorResponses];
}

class StockiestErrorState extends StockiestPriorityState {
  final BaseError error;

  StockiestErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
