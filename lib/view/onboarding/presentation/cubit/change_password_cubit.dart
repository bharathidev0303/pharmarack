import 'dart:collection';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core/log_util/log_util.dart';
import 'package:pharmarack/view/onboarding/domain/repository/invalid_new_password_exception.dart';
import 'package:pharmarack/view/onboarding/domain/repository/old_password_no_match_exception.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/change_password_state.dart';


import '../../domain/usecase/change_password_usecase.dart';
import '../../domain/usecase/match_saved_password_use_case.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  static const _minPasswordLength = 6;
  final ChangePasswordUseCase _changePasswordUseCase;
  final MatchSavedPasswordUseCase _matchSavedPasswordUseCase;

  ChangePasswordCubit(
    this._changePasswordUseCase,
    this._matchSavedPasswordUseCase,
  ) : super(ChangePasswordState.initial());

  Future<void> onChangeCurrentPassword(String currentPassword) async {
    final userMessages = state.userMessages;
    userMessages
      ..remove(UserMessage.oldPasswordMatched)
      ..remove(UserMessage.oldPasswordNoMatch)
      ..remove(UserMessage.currentPasswordIsEmpty);

    if (currentPassword.isEmpty) {
      userMessages.add(UserMessage.currentPasswordIsEmpty);
    } else {
      final oldPwdMatched = await _matchSavedPasswordUseCase.matchesWIth(
        currentPassword,
      );
      if (oldPwdMatched) {
        userMessages.add(UserMessage.oldPasswordMatched);
      } else {
        userMessages.add(UserMessage.oldPasswordNoMatch);
      }
    }

    emit(state.copyWith(
      userMessages: userMessages,
      currentPasswordInput: currentPassword,
      isActionButtonEnabled: await _isActionButtonEnabled(
        currentPassword: currentPassword,
        newPasswordInput: state.newPasswordInput,
        confirmPasswordInput: state.confirmPasswordInput,
      ),
    ));
  }

  Future<void> onChangeNewPassword(String newPassword) async {
    final userMessages = state.userMessages;
    userMessages
      ..remove(UserMessage.newPasswordIsEmpty)
      ..remove(UserMessage.invalidNewPassword);

    if (newPassword.isEmpty) {
      userMessages.add(UserMessage.newPasswordIsEmpty);
    } else if (newPassword.length < _minPasswordLength) {
      userMessages.add(UserMessage.invalidNewPassword);
    } else if (newPassword != state.confirmPasswordInput) {
      userMessages.add(UserMessage.confirmPasswordNotMatch);
    } else if (newPassword == state.confirmPasswordInput) {
      userMessages.remove(UserMessage.confirmPasswordNotMatch);
    }

    emit(state.copyWith(
      userMessages: userMessages,
      newPasswordInput: newPassword,
      isActionButtonEnabled: await _isActionButtonEnabled(
        currentPassword: state.currentPasswordInput,
        newPasswordInput: newPassword,
        confirmPasswordInput: state.confirmPasswordInput,
      ),
    ));
  }

  void passwordChecks(String? value) {
    if ((value ?? '').isNotEmpty && (value ?? '').trim().length >= 6) {
      emit(state.copyWith(isAtLeastSixLetter: true));
    } else {
      emit(state.copyWith(isAtLeastSixLetter: false));
      emit(state.copyWith(isPasswordFulfilledFlag: false));
    }
    if ((value ?? '').contains(RegExp(r'[A-Za-z]')) &&
        (value ?? '').contains(RegExp(r'[a-z]')) &&
        (value ?? '').contains(RegExp(r'[0-9]'))) {
      emit(state.copyWith(isAnNumberAnUpperLowerCase: true));
    } else {
      emit(state.copyWith(isAnNumberAnUpperLowerCase: false));
      emit(state.copyWith(isPasswordFulfilledFlag: false));
    }
    if ((value ?? '').startsWith(' ') || (value ?? '').endsWith(' ')) {
      emit(state.copyWith(isNoSpaceStartEnd: false));
      emit(state.copyWith(isPasswordFulfilledFlag: false));
    } else {
      emit(state.copyWith(isNoSpaceStartEnd: true));
    }
    if ((value ?? '').contains(RegExp(r'[-_,.@]'))) {
      emit(state.copyWith(isSpecialChar: true));
    } else {
      emit(state.copyWith(isSpecialChar: false));
      emit(state.copyWith(isPasswordFulfilledFlag: false));
    }
    if (value == null || value.isEmpty || value == '') {
      emit(state.copyWith(isAtLeastSixLetter: false));
      emit(state.copyWith(isAnNumberAnUpperLowerCase: false));
      emit(state.copyWith(isNoSpaceStartEnd: false));
      emit(state.copyWith(isSpecialChar: false));
      emit(state.copyWith(isPasswordFulfilledFlag: false));
    }
    if (state.isAnNumberAnUpperLowerCase &&
        state.isAtLeastSixLetter &&
        state.isNoSpaceStartEnd &&
        state.isSpecialChar) {
      emit(state.copyWith(isPasswordFulfilledFlag: true));
      onChangeNewPassword(value!);
      // onChangeConfirmPassword(state.confirmPasswordInput);
      // if (value != state.confirmPasswordInput) {
      //   final userMessages = state.userMessages;
      //   userMessages.add(UserMessage.confirmPasswordNotMatch);
      // }
    }
  }

  Future<void> onChangeConfirmPassword(String confirmPassword) async {
    final userMessages = state.userMessages;
    userMessages
      ..remove(UserMessage.confirmPasswordIsEmpty)
      ..remove(UserMessage.confirmPasswordNotMatch);

    if (confirmPassword.isEmpty) {
      userMessages.add(UserMessage.confirmPasswordIsEmpty);
    } else if (confirmPassword != state.newPasswordInput) {
      userMessages.add(UserMessage.confirmPasswordNotMatch);
    }

    emit(state.copyWith(
      userMessages: userMessages,
      confirmPasswordInput: confirmPassword,
      isActionButtonEnabled: await _isActionButtonEnabled(
        currentPassword: state.currentPasswordInput,
        newPasswordInput: state.newPasswordInput,
        confirmPasswordInput: confirmPassword,
      ),
    ));
  }

  void saveChanges() {
    emit(state.copyWith(isLoading: true, userMessages: HashSet()));
    _changePasswordUseCase
        .execute(
          state.currentPasswordInput,
          state.newPasswordInput,
        )
        .then((value) => _onSuccessSaveChanges())
        .catchError((e, stack) => _onErrorSaveChanges(e, stack));
  }

  Future<bool> _isActionButtonEnabled({
    required String currentPassword,
    required String newPasswordInput,
    required String confirmPasswordInput,
  }) async {
    final currentPasswordMatches = await _matchSavedPasswordUseCase.matchesWIth(
      currentPassword,
    );
    return currentPassword.isNotEmpty &&
        newPasswordInput.isNotEmpty &&
        confirmPasswordInput.isNotEmpty &&
        newPasswordInput == confirmPasswordInput &&
        currentPasswordMatches;
  }

  _onSuccessSaveChanges() {
    emit(
      state.copyWith(
        isLoading: false,
        userMessages: state.userMessages
          ..add(UserMessage.changePasswordSuccess),
      ),
    );
  }

  _onErrorSaveChanges(dynamic error, StackTrace stack) {
    LogUtil.error(
      'Error while changing password',
      error: error,
      stackTrace: stack,
    );
    if (error is OldPasswordNoMatchException) {
      emit(
        state.copyWith(
          isLoading: false,
          userMessages: state.userMessages..add(UserMessage.oldPasswordNoMatch),
        ),
      );
    } else if (error is InvalidNewPasswordException) {
      emit(
        state.copyWith(
          isLoading: false,
          userMessages: state.userMessages..add(UserMessage.invalidNewPassword),
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          userMessages: state.userMessages
            ..add(UserMessage.changePasswordFailed),
        ),
      );
    }
  }
}
