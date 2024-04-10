import 'package:equatable/equatable.dart';

abstract class ForgotPasswordScreenState extends Equatable {
  @override
  List<Object?> get props => [];

  const ForgotPasswordScreenState();
}

class ForgotPasswordScreenInitialState extends ForgotPasswordScreenState {}

class ForgotPasswordScreenLoadingState extends ForgotPasswordScreenState {}

class ForgotPasswordScreenErrorState extends ForgotPasswordScreenState {
  final String? statusMessage;

  const ForgotPasswordScreenErrorState({this.statusMessage});

  @override
  List<Object?> get props => [
        statusMessage,
      ];
}

class ForgotPasswordScreenDataState extends ForgotPasswordScreenState {
  const ForgotPasswordScreenDataState();
}
