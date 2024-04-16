import 'dart:collection';

import 'package:equatable/equatable.dart';

class ChangePasswordState extends Equatable {
  final bool isLoading;
  final HashSet<UserMessage> userMessages;
  final bool isActionButtonEnabled;
  final String currentPasswordInput;
  final String newPasswordInput;
  final String confirmPasswordInput;
  final bool isAtLeastSixLetter;
  final bool isAnNumberAnUpperLowerCase;
  final bool isSpecialChar;
  final bool isNoSpaceStartEnd;
  final bool isPasswordFulfilledFlag;

  const ChangePasswordState({
    required this.isLoading,
    required this.userMessages,
    required this.isActionButtonEnabled,
    required this.currentPasswordInput,
    required this.newPasswordInput,
    required this.confirmPasswordInput,
    required this.isAtLeastSixLetter,
    required this.isAnNumberAnUpperLowerCase,
    required this.isSpecialChar,
    required this.isNoSpaceStartEnd,
    required this.isPasswordFulfilledFlag,
  });

  factory ChangePasswordState.initial() {
    return ChangePasswordState(
      isLoading: false,
      userMessages: HashSet<UserMessage>(),
      isActionButtonEnabled: false,
      currentPasswordInput: '',
      newPasswordInput: '',
      confirmPasswordInput: '',
      isAtLeastSixLetter: false,
      isAnNumberAnUpperLowerCase: false,
      isSpecialChar: false,
      isNoSpaceStartEnd: false,
      isPasswordFulfilledFlag: false,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        userMessages,
        isActionButtonEnabled,
        currentPasswordInput,
        newPasswordInput,
        confirmPasswordInput,
        isAtLeastSixLetter,
        isAnNumberAnUpperLowerCase,
        isSpecialChar,
        isNoSpaceStartEnd,
        isPasswordFulfilledFlag,
      ];

  ChangePasswordState copyWith({
    bool? isLoading,
    HashSet<UserMessage>? userMessages,
    bool? isActionButtonEnabled,
    String? currentPasswordInput,
    String? newPasswordInput,
    String? confirmPasswordInput,
    bool? isAtLeastSixLetter,
    bool? isAnNumberAnUpperLowerCase,
    bool? isSpecialChar,
    bool? isNoSpaceStartEnd,
    bool? isPasswordFulfilledFlag,
  }) {
    return ChangePasswordState(
      isLoading: isLoading ?? this.isLoading,
      userMessages: userMessages ?? this.userMessages,
      isActionButtonEnabled:
          isActionButtonEnabled ?? this.isActionButtonEnabled,
      currentPasswordInput: currentPasswordInput ?? this.currentPasswordInput,
      newPasswordInput: newPasswordInput ?? this.newPasswordInput,
      confirmPasswordInput: confirmPasswordInput ?? this.confirmPasswordInput,
      isAtLeastSixLetter: isAtLeastSixLetter ?? this.isAtLeastSixLetter,
      isAnNumberAnUpperLowerCase:
          isAnNumberAnUpperLowerCase ?? this.isAnNumberAnUpperLowerCase,
      isSpecialChar: isSpecialChar ?? this.isSpecialChar,
      isNoSpaceStartEnd: isNoSpaceStartEnd ?? this.isNoSpaceStartEnd,
      isPasswordFulfilledFlag:
          isPasswordFulfilledFlag ?? this.isPasswordFulfilledFlag,
    );
  }
}

enum UserMessage {
  currentPasswordIsEmpty,
  newPasswordIsEmpty,
  confirmPasswordIsEmpty,
  confirmPasswordNotMatch,
  changePasswordSuccess,
  oldPasswordNoMatch,
  oldPasswordMatched,
  changePasswordFailed,
  invalidNewPassword,
  previousPassword
}
