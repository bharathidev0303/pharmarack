import 'package:equatable/equatable.dart';

abstract class ReferralTAndCState extends Equatable {
  const ReferralTAndCState();
  @override
  List<Object?> get props => [];
}

class ReferralTAndCInitialState extends ReferralTAndCState {}

class ReferralTAndCLoadingState extends ReferralTAndCState {}

class ReferralTAndCErrorState extends ReferralTAndCState {
  final String? statusMessage;

  const ReferralTAndCErrorState({this.statusMessage});

  @override
  List<Object?> get props => [
        statusMessage,
      ];
}

class ReferralTAndCDataState extends ReferralTAndCState {
  const ReferralTAndCDataState();
}
