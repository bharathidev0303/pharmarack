import 'package:equatable/equatable.dart';

abstract class OtpScreenState extends Equatable {
  @override
  List<Object?> get props => [];

  const OtpScreenState();
}

/// Initial state
class OtpScreenInitialState extends OtpScreenState {}

/// When APIs / async tasks are getting called
class OtpScreenLoadingState extends OtpScreenState {}

/// Some error
class OtpScreenErrorState extends OtpScreenState {}

class OtpPageUnAuthorizedDetectState extends OtpScreenState {}

/// Received the OTP
class OtpScreenDataState extends OtpScreenState {}

/// Verification state
class OtpVerificationState extends OtpScreenState {}

class EmptyOtpState extends OtpScreenState {}

/// Verification start state
class OtpVerificationSuccessState extends OtpScreenState {}

/// Verification start state
class OtpVerificationDeleteAccountState extends OtpScreenState {}

/// Verification start state
class OtpVerificationDeleteAccountSuccessState extends OtpScreenState {}

/// Verification failed state
/// This error state wont have any message as OTP verification done locally
class OtpVerificationFailedState extends OtpScreenState {
  final String? statusMessage;

  const OtpVerificationFailedState({this.statusMessage});

  @override
  List<Object?> get props => [
        statusMessage,
      ];
}

/// Resend OTP states
/// Enable
class ResendOtpButtonEnableState extends OtpScreenState {}

/// Disable
class ResendOtpButtonDisableState extends OtpScreenState {}
