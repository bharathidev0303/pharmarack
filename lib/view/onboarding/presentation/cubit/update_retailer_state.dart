import 'package:equatable/equatable.dart';

abstract class UpdateRetailerState extends Equatable {
  const UpdateRetailerState();

  @override
  List<Object?> get props => [];
}

class UpdateRetailerInitialState extends UpdateRetailerState {}

class UpdateRetailerLoadingState extends UpdateRetailerState {}

class UpdateRetailerErrorState extends UpdateRetailerState {
  final String? statusMessage;

  const UpdateRetailerErrorState({this.statusMessage});

  @override
  List<Object?> get props => [
        statusMessage,
      ];
}

class UpdateRetailerDataState extends UpdateRetailerState {}
