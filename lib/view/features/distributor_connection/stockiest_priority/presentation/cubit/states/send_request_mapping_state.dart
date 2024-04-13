import 'package:equatable/equatable.dart';

abstract class SendRequestMappingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SendRequestStoreMappingsInitialState extends SendRequestMappingState {}

class LoadingSendRequestStoreMappings extends SendRequestMappingState {
  final String uniqueString;

  LoadingSendRequestStoreMappings(this.uniqueString);

  @override
  List<Object?> get props => [uniqueString];
}

class SuccessSendRequestStoreMappings extends SendRequestMappingState {
  final String uniqueKey;

  SuccessSendRequestStoreMappings(this.uniqueKey);

  @override
  List<Object?> get props => [uniqueKey];
}

class FailureSendRequestStoreMappings extends SendRequestMappingState {
  final String errorText;
  final String uniqueKey;

  FailureSendRequestStoreMappings(this.errorText, this.uniqueKey);

  @override
  List<Object?> get props => [errorText, uniqueKey];
}

class MaximumLimitReachedState extends SendRequestMappingState {
  final String errorMessage;
  final String uniqueKey;

  MaximumLimitReachedState(this.errorMessage, this.uniqueKey);

  @override
  List<Object?> get props => [errorMessage, uniqueKey];
}
