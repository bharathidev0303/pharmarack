import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class SavePriorityState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SavePriorityInitialState extends SavePriorityState {}

class SuccessSavePriorityState extends SavePriorityState {
  final PriorityState priorityState;

  SuccessSavePriorityState(this.priorityState);

  @override
  List<Object?> get props => [priorityState];
}

class FailureSavePriorityState extends SavePriorityState {}

class PriorityState {
  final bool isPriorityChanged;
  final String uniqueKey;

  PriorityState(this.isPriorityChanged, this.uniqueKey);

  PriorityState copyWith({bool? isChange, String? uniqueKey}) {
    return PriorityState(
        isChange ?? isPriorityChanged, uniqueKey ?? UniqueKey().toString());
  }
}
