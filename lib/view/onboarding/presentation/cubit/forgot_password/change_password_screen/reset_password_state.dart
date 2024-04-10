import 'package:equatable/equatable.dart';

abstract class ResetPasswordScreenState extends Equatable {
  @override
  List<Object?> get props => [];

  const ResetPasswordScreenState();
}

class ResetPasswordScreenInitialState extends ResetPasswordScreenState {}

class ResetPasswordScreenLoadingState extends ResetPasswordScreenState {}

class ResetPasswordUnAuthorizeState extends ResetPasswordScreenState {}

class ResetPasswordScreenErrorState extends ResetPasswordScreenState {
  final String? statusMessage;

  const ResetPasswordScreenErrorState({this.statusMessage});

  @override
  List<Object?> get props => [
        statusMessage,
      ];
}

class ResetPasswordScreenDataState extends ResetPasswordScreenState {
  const ResetPasswordScreenDataState();
}
