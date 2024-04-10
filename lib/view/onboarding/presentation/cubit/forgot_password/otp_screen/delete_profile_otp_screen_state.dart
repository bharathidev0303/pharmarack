import 'package:equatable/equatable.dart';

abstract class DeleteAccountOtpScreenState extends Equatable {
  @override
  List<Object?> get props => [];

  const DeleteAccountOtpScreenState();
}

class DeleteAccountOtpScreenInitialState extends DeleteAccountOtpScreenState {}

class DeleteAccountOtpScreenLoadingState extends DeleteAccountOtpScreenState {}

class DeleteAccountOtpScreenErrorState extends DeleteAccountOtpScreenState {
  final String? statusMessage;

  const DeleteAccountOtpScreenErrorState({this.statusMessage});

  @override
  List<Object?> get props => [
        statusMessage,
      ];
}

class DeleteAccountOtpScreenSuccessState extends DeleteAccountOtpScreenState {}

class AccountDeletedSuccessState extends DeleteAccountOtpScreenState {}

// class DeleteAccountOtpScreenDataState extends DeleteAccountOtpScreenState {
//   const DeleteAccountOtpScreenDataState();
// }

class DeleteAccountResendOtpErrorState extends DeleteAccountOtpScreenState {}

class DeleteAccountResendOtpSuccessState extends DeleteAccountOtpScreenState {}
