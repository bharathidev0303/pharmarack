import 'package:equatable/equatable.dart';

abstract class LoginScreenTextState extends Equatable {
  @override
  List<Object?> get props => [];

  const LoginScreenTextState();
}

abstract class PasswordTextState extends Equatable {
  @override
  List<Object?> get props => [];

  const PasswordTextState();
}

/// Abstract state class for OTP text field
abstract class OtpTextState extends Equatable {
  @override
  List<Object?> get props => [];

  const OtpTextState();
}

abstract class MobileNumberTextState extends Equatable {
  @override
  List<Object?> get props => [];

  const MobileNumberTextState();
}

abstract class ResendButtonState extends Equatable {
  @override
  List<Object?> get props => [];

  const ResendButtonState();
}

abstract class NewPasswordFieldState extends Equatable {
  @override
  List<Object?> get props => [];

  const NewPasswordFieldState();
}

abstract class ConfirmNewPasswordState extends Equatable {
  @override
  List<Object?> get props => [];

  const ConfirmNewPasswordState();
}

class LoginScreenTextInitState extends LoginScreenTextState {}

class PasswordInitState extends PasswordTextState {}

class LoginScreenTextInvalidState extends LoginScreenTextState {}

class PasswordNotValidState extends PasswordTextState {}

class LoginScreenTextValidState extends LoginScreenTextState {}

class PasswordValidState extends PasswordTextState {}

///Otp
class OtpInitState extends OtpTextState {}

class OtpValidState extends OtpTextState {}

class OtpInvalidState extends OtpTextState {}

class MobileNumberTextInitState extends MobileNumberTextState {}

class MobileNumberTextValidState extends MobileNumberTextState {}

class MobileNumberTextInvalidState extends MobileNumberTextState {}

class ResendButtonInitState extends ResendButtonState {}

class ResendButtonEnabledState extends ResendButtonState {}

class ResendButtonDisabledState extends ResendButtonState {
  final String timer;

  const ResendButtonDisabledState({required this.timer});

  @override
  List<Object?> get props => [
        timer,
      ];
}

class NewPasswordCheckState extends NewPasswordFieldState {
  final bool isAtLeastSixLetter;
  final bool isAnNumberAnUpperLowerCase;
  final bool isSpecialChar;
  final bool isNoSpaceStartEnd;
  final bool isPasswordFulfilledFlag;

  const NewPasswordCheckState({
    required this.isAtLeastSixLetter,
    required this.isAnNumberAnUpperLowerCase,
    required this.isSpecialChar,
    required this.isNoSpaceStartEnd,
    required this.isPasswordFulfilledFlag,
  });
  NewPasswordCheckState copyWith({
    bool? isAtLeastSixLetter,
    bool? isAnNumberAnUpperLowerCase,
    bool? isSpecialChar,
    bool? isNoSpaceStartEnd,
    bool? isPasswordFulfilledFlag,
  }) {
    return NewPasswordCheckState(
      isAtLeastSixLetter: isAtLeastSixLetter ?? this.isAtLeastSixLetter,
      isAnNumberAnUpperLowerCase:
          isAnNumberAnUpperLowerCase ?? this.isAnNumberAnUpperLowerCase,
      isSpecialChar: isSpecialChar ?? this.isSpecialChar,
      isNoSpaceStartEnd: isNoSpaceStartEnd ?? this.isNoSpaceStartEnd,
      isPasswordFulfilledFlag:
          isPasswordFulfilledFlag ?? this.isPasswordFulfilledFlag,
    );
  }

  factory NewPasswordCheckState.initial() {
    return const NewPasswordCheckState(
      isAtLeastSixLetter: false,
      isAnNumberAnUpperLowerCase: false,
      isSpecialChar: false,
      isNoSpaceStartEnd: false,
      isPasswordFulfilledFlag: false,
    );
  }

  @override
  List<Object?> get props => [
        isAtLeastSixLetter,
        isAnNumberAnUpperLowerCase,
        isSpecialChar,
        isNoSpaceStartEnd,
        isPasswordFulfilledFlag,
      ];
}

class ConfirmNewPasswordInitState extends ConfirmNewPasswordState {}

class ConfirmNewPasswordValidState extends ConfirmNewPasswordState {}

class ConfirmNewPasswordEmptyState extends ConfirmNewPasswordState {}

class ConfirmNewPasswordInvalidState extends ConfirmNewPasswordState {}
