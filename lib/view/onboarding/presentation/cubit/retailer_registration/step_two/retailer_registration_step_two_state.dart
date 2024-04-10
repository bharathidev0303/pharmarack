import 'package:equatable/equatable.dart';

import 'package:pharmarack/view/onboarding/utils/constants.dart';

class RetailerRegistrationStepTwoState extends Equatable {
  final int pharmacistCount;
  final String mobileNumber;
  final String email;
  final String pharmacistName1;
  final String pharmacistNum1;
  final String pharmacistName2;
  final String pharmacistNum2;
  final String pharmacistName3;
  final String pharmacistNum3;
  final String password;
  final bool softValidate;
  final String mobileNumberValidation;
  final String pharmacistNum1Validation;
  final bool pharmacistNum2Validation;
  final bool pharmacistNum3Validation;
  final bool isLoading;
  final AddPharmacistError addPharmacistError;
  final bool isAtLeastSixLetter;
  final bool isAnNumberAnUpperLowerCase;
  final bool isSpecialChar;
  final bool isNoSpaceStartEnd;
  final bool isPasswordFulfilledFlag;

  const RetailerRegistrationStepTwoState({
    required this.pharmacistCount,
    required this.mobileNumber,
    required this.email,
    required this.pharmacistName1,
    required this.pharmacistName2,
    required this.pharmacistName3,
    required this.pharmacistNum1,
    required this.pharmacistNum2,
    required this.pharmacistNum3,
    required this.password,
    this.softValidate = false,
    this.mobileNumberValidation = '',
    this.pharmacistNum1Validation = '',
    this.pharmacistNum2Validation = true,
    this.pharmacistNum3Validation = true,
    this.isLoading = false,
    this.addPharmacistError = AddPharmacistError.empty,
    required this.isAtLeastSixLetter,
    required this.isAnNumberAnUpperLowerCase,
    required this.isSpecialChar,
    required this.isNoSpaceStartEnd,
    required this.isPasswordFulfilledFlag,
  });

  RetailerRegistrationStepTwoState copyWith({
    int? pharmacistCount,
    String? mobileNumber,
    String? email,
    String? pharmacistName1,
    String? pharmacistName2,
    String? pharmacistName3,
    String? pharmacistNum1,
    String? pharmacistNum2,
    String? pharmacistNum3,
    String? password,
    bool? softValidate,
    String? pharmacistNum1Validation,
    bool? pharmacistNum2Validation,
    bool? pharmacistNum3Validation,
    bool? isLoading,
    String? mobileNumberValidation,
    AddPharmacistError? addPharmacistError,
    bool? isAtLeastSixLetter,
    bool? isAnNumberAnUpperLowerCase,
    bool? isSpecialChar,
    bool? isNoSpaceStartEnd,
    bool? isPasswordFulfilledFlag,
  }) {
    return RetailerRegistrationStepTwoState(
      pharmacistCount: pharmacistCount ?? this.pharmacistCount,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      email: email ?? this.email,
      pharmacistName1: pharmacistName1 ?? this.pharmacistName1,
      pharmacistName2: pharmacistName2 ?? this.pharmacistName2,
      pharmacistName3: pharmacistName3 ?? this.pharmacistName3,
      pharmacistNum1: pharmacistNum1 ?? this.pharmacistNum1,
      pharmacistNum2: pharmacistNum2 ?? this.pharmacistNum2,
      pharmacistNum3: pharmacistNum3 ?? this.pharmacistNum3,
      password: password ?? this.password,
      softValidate: softValidate ?? this.softValidate,
      pharmacistNum1Validation:
          pharmacistNum1Validation ?? this.pharmacistNum1Validation,
      pharmacistNum2Validation:
          pharmacistNum2Validation ?? this.pharmacistNum2Validation,
      pharmacistNum3Validation:
          pharmacistNum3Validation ?? this.pharmacistNum3Validation,
      isLoading: isLoading ?? this.isLoading,
      mobileNumberValidation:
          mobileNumberValidation ?? this.mobileNumberValidation,
      addPharmacistError: addPharmacistError ?? this.addPharmacistError,
      isAtLeastSixLetter: isAtLeastSixLetter ?? this.isAtLeastSixLetter,
      isAnNumberAnUpperLowerCase:
          isAnNumberAnUpperLowerCase ?? this.isAnNumberAnUpperLowerCase,
      isSpecialChar: isSpecialChar ?? this.isSpecialChar,
      isNoSpaceStartEnd: isNoSpaceStartEnd ?? this.isNoSpaceStartEnd,
      isPasswordFulfilledFlag:
          isPasswordFulfilledFlag ?? this.isPasswordFulfilledFlag,
    );
  }

  factory RetailerRegistrationStepTwoState.initial() {
    return const RetailerRegistrationStepTwoState(
      pharmacistCount: 1,
      mobileNumber: '',
      email: '',
      pharmacistName1: '',
      pharmacistName2: '',
      pharmacistName3: '',
      pharmacistNum1: '',
      pharmacistNum2: '',
      pharmacistNum3: '',
      password: '',
      isAtLeastSixLetter: false,
      isAnNumberAnUpperLowerCase: false,
      isSpecialChar: false,
      isNoSpaceStartEnd: false,
      isPasswordFulfilledFlag: false,
    );
  }

  @override
  List<Object?> get props => [
        pharmacistCount,
        mobileNumber,
        email,
        pharmacistName1,
        pharmacistName2,
        pharmacistName3,
        pharmacistNum1,
        pharmacistNum2,
        pharmacistNum3,
        password,
        softValidate,
        pharmacistNum1Validation,
        pharmacistNum2Validation,
        pharmacistNum3Validation,
        isLoading,
        mobileNumberValidation,
        addPharmacistError,
        isAtLeastSixLetter,
        isAnNumberAnUpperLowerCase,
        isSpecialChar,
        isNoSpaceStartEnd,
        isPasswordFulfilledFlag,
      ];
}
