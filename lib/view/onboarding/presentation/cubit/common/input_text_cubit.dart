import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/common/input_text_state.dart';

class LoginScreenTextCubit extends Cubit<LoginScreenTextState> {
  LoginScreenTextCubit() : super(LoginScreenTextInitState());

  void validateTextFields(
      {required String username, required String password}) {
    if (username.isNotEmpty && password.isNotEmpty && password.length >= 6) {
      emit(LoginScreenTextValidState());
    } else {
      emit(LoginScreenTextInvalidState());
    }
  }
}

class PasswordCubit extends Cubit<PasswordTextState> {
  PasswordCubit() : super(PasswordInitState());

  bool validatePassword(String password) {
    if (password.isEmpty || password.length < 6) {
      emit(PasswordNotValidState());
      return true;
    } else {
      emit(PasswordValidState());
      return false;
    }
  }
}

class OtpFieldCubit extends Cubit<OtpTextState> {
  OtpFieldCubit() : super(OtpInitState());

  bool validateOtp(String otp) {
    if (otp.isEmpty || otp.length < 6) {
      emit(OtpInvalidState());
      return true;
    } else {
      emit(OtpValidState());
      return false;
    }
  }
}

class MobileNumberFieldCubit extends Cubit<MobileNumberTextState> {
  MobileNumberFieldCubit() : super(MobileNumberTextInitState());
  RegExp mobileNumberRegExp = RegExp("^[5-9]{1}[0-9]{9}\$");

  bool validateMobileNumber(String mobileNumber) {
    final isMobileNumberValid = mobileNumberRegExp.hasMatch(mobileNumber);
    if (isMobileNumberValid) {
      emit(MobileNumberTextValidState());
    } else {
      emit(MobileNumberTextInvalidState());
    }
    return isMobileNumberValid;
  }
}

class ResendButtonCubit extends Cubit<ResendButtonState> {
  ResendButtonCubit() : super(ResendButtonInitState());
  Timer? _timer;

  void startTimer() {
    emit(ResendButtonDisabledState());
    _timer = Timer(const Duration(seconds: 15), () {
      emit(ResendButtonEnabledState());
    });
  }

  void stopTimer() {
    emit(ResendButtonEnabledState());
    _timer?.cancel();
  }
}

class NewPasswordFieldCubit extends Cubit<NewPasswordCheckState> {
  NewPasswordFieldCubit() : super(NewPasswordCheckState.initial());

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
    }
  }

  bool newPasswordPatternComplete() => state.isPasswordFulfilledFlag;
}

class ConfirmNewPasswordCubit extends Cubit<ConfirmNewPasswordState> {
  ConfirmNewPasswordCubit() : super(ConfirmNewPasswordInitState());

  bool validateConfirmPassword(String newPassword, String confirmPassword) {
    bool isValid = newPassword == confirmPassword;
    bool isNotEmpty = newPassword.isNotEmpty && confirmPassword.isNotEmpty;
    if (isValid && isNotEmpty) {
      emit(ConfirmNewPasswordValidState());
    } else if (!isNotEmpty) {
      emit(ConfirmNewPasswordEmptyState());
    } else {
      emit(ConfirmNewPasswordInvalidState());
    }
    return isValid;
  }
}
