import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/check_mobile_number.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/retailer_registration_use_case.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/retailer_registration/step_two/retailer_registration_step_two_state.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

class RetailerRegistrationStepTwoCubit
    extends Cubit<RetailerRegistrationStepTwoState> {
  final RetailerRegistrationUserCase _retailerRegistrationUserCase;
  final CheckMobileNumberUseCase _checkMobileNumberUseCase;

  RetailerRegistrationStepTwoCubit(
      this._retailerRegistrationUserCase, this._checkMobileNumberUseCase)
      : super(RetailerRegistrationStepTwoState.initial());

  void addPharmacist() {
    if (state.pharmacistCount == 1) {
      state.pharmacistName1.isEmpty || state.pharmacistNum1.isEmpty
          ? emit(state.copyWith(
              addPharmacistError: AddPharmacistError.addRetailerError1))
          : emit(state.copyWith(
              pharmacistCount: (state.pharmacistCount + 1),
              addPharmacistError: AddPharmacistError.empty));
    } else if (state.pharmacistCount == 2) {
      state.pharmacistName2.isEmpty || state.pharmacistNum2.isEmpty
          ? emit(state.copyWith(
              addPharmacistError: AddPharmacistError.addRetailerError2))
          : emit(state.copyWith(
              pharmacistCount: (state.pharmacistCount + 1),
              addPharmacistError: AddPharmacistError.empty));
    }
  }

  void setMobileNumber(String? value) {
    emit(state.copyWith(mobileNumber: value));
  }

  void setUpEmailId(String? value) {
    emit(state.copyWith(email: value));
  }

  void setPharmacistName1(String? value) {
    emit(state.copyWith(pharmacistName1: value));
  }

  void setPharmacistName2(String? value) {
    emit(state.copyWith(pharmacistName2: value));
  }

  void setPharmacistName3(String? value) {
    emit(state.copyWith(pharmacistName3: value));
  }

  void setPharmacistNum1(String? value) {
    emit(state.copyWith(pharmacistNum1: value));
  }

  void setPharmacistNum2(String? value) {
    emit(state.copyWith(pharmacistNum2: value));
  }

  void setPharmacistNum3(String? value) {
    emit(state.copyWith(pharmacistNum3: value));
  }

  void setPassword(String? value) {
    emit(state.copyWith(password: value));
  }

  void setPasswordFulfilledFlag(bool flag) {
    emit(state.copyWith(isPasswordFulfilledFlag: flag));
  }

  void saveUserInputFieldsData() {
    Map<String, String> reqMap = HashMap();
    reqMap[OnboardingConstants.registrationMobileNumber] = state.mobileNumber;
    reqMap[OnboardingConstants.registrationEmail] = state.email;
    reqMap[OnboardingConstants.pharmacistName] = state.pharmacistName1;
    reqMap[OnboardingConstants.pharmacistNumber] = state.pharmacistNum1;
    reqMap[OnboardingConstants.pharmacistName2] = state.pharmacistName2;
    reqMap[OnboardingConstants.pharmacistNumber2] = state.pharmacistNum2;
    reqMap[OnboardingConstants.pharmacistName3] = state.pharmacistName3;
    reqMap[OnboardingConstants.pharmacistNumber3] = state.pharmacistNum3;
    reqMap[OnboardingConstants.password] = state.password;

    _retailerRegistrationUserCase.setStepTwoRegistrationData(reqMap);
  }

  void validateMainMobileNumber() async {
    String validation = await validateMobileNumber(state.mobileNumber);
    emit(state.copyWith(mobileNumberValidation: validation, isLoading: false));
  }

  void validatePharmacistNumberOne() async {
    String validation = await validateMobileNumber(state.pharmacistNum1);
    emit(
        state.copyWith(pharmacistNum1Validation: validation, isLoading: false));
  }

  Future<String> validateMobileNumber(String mobileNumber) async {
    emit(state.copyWith(isLoading: true));
    const int userID = 0;
    final response = await _checkMobileNumberUseCase.execute(
        params: VerifyMobileNumberParams(
            mobileNumber: mobileNumber, userID: userID));
    return response.fold((l) {
      return '';
    }, (r) {
      if (r.message == 'Mobile number not in use') {
        return '';
      }
      return r.message!;
    });
  }

  void passwordChecks(String? value) {
    if ((value ?? '').isNotEmpty && (value ?? '').trim().length >= 8) {
      emit(state.copyWith(isAtLeastSixLetter: true));
    } else {
      emit(state.copyWith(isAtLeastSixLetter: false));
      emit(state.copyWith(softValidate: false));
    }
    if ((value ?? '').contains(RegExp(r'[A-Za-z]')) &&
        (value ?? '').contains(RegExp(r'[a-z]')) &&
        (value ?? '').contains(RegExp(r'[0-9]'))) {
      emit(state.copyWith(isAnNumberAnUpperLowerCase: true));
    } else {
      emit(state.copyWith(isAnNumberAnUpperLowerCase: false));
      emit(state.copyWith(softValidate: false));
    }
    if ((value ?? '').startsWith(' ') || (value ?? '').endsWith(' ')) {
      emit(state.copyWith(isNoSpaceStartEnd: false));
      emit(state.copyWith(softValidate: false));
    } else {
      emit(state.copyWith(isNoSpaceStartEnd: true));
    }
    if ((value ?? '').contains(RegExp(r'[-_,.@]'))) {
      emit(state.copyWith(isSpecialChar: true));
    } else {
      emit(state.copyWith(isSpecialChar: false));
      emit(state.copyWith(softValidate: false));
    }
    if (value == null || value.isEmpty || value == '') {
      emit(state.copyWith(isAtLeastSixLetter: false));
      emit(state.copyWith(isAnNumberAnUpperLowerCase: false));
      emit(state.copyWith(isNoSpaceStartEnd: false));
      emit(state.copyWith(isSpecialChar: false));
      emit(state.copyWith(softValidate: false));
    }
    if (state.isAnNumberAnUpperLowerCase &&
        state.isAtLeastSixLetter &&
        state.isNoSpaceStartEnd &&
        state.isSpecialChar) {
      setPasswordFulfilledFlag(true);
    }
  }

  void softValidateFields(Map<String, String> reqMap) {
    if (reqMap.containsKey(OnboardingConstants.registrationMobileNumber) &&
        reqMap.containsKey(OnboardingConstants.password) &&
        (reqMap[OnboardingConstants.registrationMobileNumber]?.isNotEmpty ??
            false) &&
        (reqMap[OnboardingConstants.password]?.isNotEmpty ?? false) &&
        state.isPasswordFulfilledFlag) {
      emit(state.copyWith(softValidate: true));
    } else {
      emit(state.copyWith(softValidate: false));
    }
  }
}
