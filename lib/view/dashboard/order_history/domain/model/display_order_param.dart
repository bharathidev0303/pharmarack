import 'package:equatable/equatable.dart';

class DisplayOrdersParam {
  final String userId;
  final int storeId;
  final String searchText;
  final String fromDate;
  final String toDate;
  final String operation;
  final String status;

  DisplayOrdersParam(
      {required this.storeId,
      required this.userId,
      required this.searchText,
      required this.fromDate,
      required this.toDate,
      required this.operation,
      required this.status});
}

class OrderHistoryFilterParams extends Equatable {
  final String fromDate;
  final String toDate;
  final String status;
  final String searchTxt;
  final int storeId;

  const OrderHistoryFilterParams(
      {required this.fromDate,
      required this.toDate,
      required this.status,
      required this.searchTxt,
      required this.storeId});

  @override
  List<Object?> get props => [fromDate, toDate, status, searchTxt, storeId];
}
