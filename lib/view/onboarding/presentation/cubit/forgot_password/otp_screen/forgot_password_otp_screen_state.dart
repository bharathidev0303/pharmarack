import 'package:equatable/equatable.dart';

abstract class ForgotPasswordOtpScreenState extends Equatable {
  @override
  List<Object?> get props => [];

  const ForgotPasswordOtpScreenState();
}

class ForgotPasswordOtpScreenInitialState
    extends ForgotPasswordOtpScreenState {}

class ForgotPasswordOtpScreenLoadingState
    extends ForgotPasswordOtpScreenState {}

class ForgotPasswordOtpScreenErrorState extends ForgotPasswordOtpScreenState {
  final String? statusMessage;

  const ForgotPasswordOtpScreenErrorState({this.statusMessage});

  @override
  List<Object?> get props => [
        statusMessage,
      ];
}

class ForgotPasswordOtpScreenDataState extends ForgotPasswordOtpScreenState {
  const ForgotPasswordOtpScreenDataState();
}

class ForgotPasswordResendOtpErrorState extends ForgotPasswordOtpScreenState {}

class ForgotPasswordResendOtpSuccessState
    extends ForgotPasswordOtpScreenState {}
