import 'package:equatable/equatable.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/approve_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_model.dart';

/// This class [RequestCubitState] which should be consume by Cubit as it's state
abstract class RequestCubitState extends Equatable {
  @override
  List<Object?> get props => [];

  const RequestCubitState();
}

class RequestCubitInitialState extends RequestCubitState {}

class RequestCubitLoadingState extends RequestCubitState {}

class RequestCubitNoDataState extends RequestCubitState {}

class RequestCubitDataState extends RequestCubitState {
  final RequestModel model;

  const RequestCubitDataState(this.model);

  bool isAnyRequestChecked() =>
      model.data?.any((element) => element.isSelected) ?? false;

  @override
  List<Object?> get props => [model];
}

class RequestSearchState extends RequestCubitState {
  final List<Request> requests;

  const RequestSearchState(this.requests);

  bool isAnyRequestChecked() => requests.any((element) => element.isSelected);

  @override
  List<Object?> get props => [requests];
}

class RequestCheckedState extends RequestCubitState {
  final List<Request> requests;

  const RequestCheckedState(this.requests);

  bool isAnyRequestChecked() => requests.any((element) => element.isSelected);

  @override
  List<Object?> get props => [requests];
}

class RequestCubitErrorState extends RequestCubitState {
  final String errorMessage;
  final List<Request> requests;

  bool isAnyRequestChecked() => requests.any((element) => element.isSelected);

  const RequestCubitErrorState(this.errorMessage, this.requests);

  @override
  List<Object?> get props => [requests, errorMessage];
}

class ApproveRequestState extends RequestCubitState {
  final ApproveRejectMappingModel approveRejectMappingModel;

  const ApproveRequestState(this.approveRejectMappingModel);

  @override
  List<Object?> get props => [approveRejectMappingModel];
}

class RejectRequestState extends RequestCubitState {
  final List<Request> requests;
  final ApproveRejectMappingModel approveRejectMappingModel;

  bool isAnyRequestChecked() => requests.any((element) => element.isSelected);

  const RejectRequestState(this.approveRejectMappingModel, this.requests);

  @override
  List<Object?> get props => [requests, approveRejectMappingModel];
}
