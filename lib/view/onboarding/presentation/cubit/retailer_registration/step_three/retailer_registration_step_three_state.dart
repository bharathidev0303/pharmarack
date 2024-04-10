import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

///Base state
class RetailerRegistrationStepThreeState extends Equatable {
  final bool isLoading;
  final bool isSoftEnable;
  final String gstNumber;
  final String panNumber;
  final String referralCode;
  final String drugLicenseNum1;
  final String drugLicenseNum2;
  final String drugLicenseNum3;
  final File? drugLicenseFile1;
  final File? drugLicenseFile2;
  final File? drugLicenseFile3;
  final bool? gstNumberValidation;
  final bool registrationStatus;
  final bool moveToHomePage;
  final int drugLicenseCount;
  final bool hasDrugLicenseFile1;
  final bool hasDrugLicenseFile2;
  final bool hasDrugLicenseFile3;
  final String privacyPolicyCheckbox;
  final String whatsappConsentCheckbox;
  final DrugLicenseError drugLicenseError;
  const RetailerRegistrationStepThreeState({
    required this.gstNumber,
    required this.panNumber,
    required this.referralCode,
    required this.drugLicenseNum1,
    required this.drugLicenseNum2,
    required this.drugLicenseNum3,
    required this.drugLicenseCount,
    this.isLoading = false,
    this.isSoftEnable = false,
    this.gstNumberValidation = true,
    this.registrationStatus = false,
    this.moveToHomePage = false,
    this.drugLicenseFile1,
    this.drugLicenseFile2,
    this.drugLicenseFile3,
    this.hasDrugLicenseFile1 = false,
    this.hasDrugLicenseFile2 = false,
    this.hasDrugLicenseFile3 = false,
    this.drugLicenseError = DrugLicenseError.empty,
    this.privacyPolicyCheckbox = '0',
    this.whatsappConsentCheckbox = '0',
  });

  RetailerRegistrationStepThreeState copyWith({
    bool? isLoading,
    bool? isSoftEnable,
    String? gstNumber,
    String? panNumber,
    String? referralCode,
    String? drugLicenseNum1,
    String? drugLicenseNum2,
    String? drugLicenseNum3,
    int? drugLicenseCount,
    bool? gstNumberValidation,
    bool? registrationStatus,
    bool? moveToHomePage,
    File? drugLicenseFile1,
    File? drugLicenseFile2,
    File? drugLicenseFile3,
    bool? hasDrugLicenseFile1,
    bool? hasDrugLicenseFile2,
    bool? hasDrugLicenseFile3,
    DrugLicenseError? drugLicenseError,
    String? privacyPolicyCheckbox,
    String? whatsappConsentCheckbox,
  }) {
    return RetailerRegistrationStepThreeState(
      gstNumber: gstNumber ?? this.gstNumber,
      panNumber: panNumber ?? this.panNumber,
      referralCode: referralCode ?? this.referralCode,
      isLoading: isLoading ?? this.isLoading,
      drugLicenseNum1: drugLicenseNum1 ?? this.drugLicenseNum1,
      drugLicenseNum2: drugLicenseNum2 ?? this.drugLicenseNum2,
      drugLicenseNum3: drugLicenseNum3 ?? this.drugLicenseNum3,
      drugLicenseCount: drugLicenseCount ?? this.drugLicenseCount,
      isSoftEnable: isSoftEnable ?? this.isSoftEnable,
      gstNumberValidation: gstNumberValidation ?? this.gstNumberValidation,
      registrationStatus: registrationStatus ?? this.registrationStatus,
      moveToHomePage: moveToHomePage ?? this.moveToHomePage,
      drugLicenseFile1: drugLicenseFile1 ?? this.drugLicenseFile1,
      drugLicenseFile2: drugLicenseFile2 ?? this.drugLicenseFile2,
      drugLicenseFile3: drugLicenseFile3 ?? this.drugLicenseFile3,
      hasDrugLicenseFile1: hasDrugLicenseFile1 ?? this.hasDrugLicenseFile1,
      hasDrugLicenseFile2: hasDrugLicenseFile2 ?? this.hasDrugLicenseFile2,
      hasDrugLicenseFile3: hasDrugLicenseFile3 ?? this.hasDrugLicenseFile3,
      drugLicenseError: drugLicenseError ?? this.drugLicenseError,
      privacyPolicyCheckbox:
          privacyPolicyCheckbox ?? this.privacyPolicyCheckbox,
      whatsappConsentCheckbox:
          whatsappConsentCheckbox ?? this.whatsappConsentCheckbox,
    );
  }

  factory RetailerRegistrationStepThreeState.initial() {
    return const RetailerRegistrationStepThreeState(
      gstNumber: '',
      panNumber: '',
      referralCode: '',
      drugLicenseNum1: '',
      drugLicenseNum2: '',
      drugLicenseNum3: '',
      drugLicenseCount: 1,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isSoftEnable,
        gstNumber,
        panNumber,
        referralCode,
        gstNumberValidation,
        registrationStatus,
        moveToHomePage,
        drugLicenseNum1,
        drugLicenseNum2,
        drugLicenseNum3,
        drugLicenseCount,
        drugLicenseFile1,
        drugLicenseFile2,
        drugLicenseFile3,
        hasDrugLicenseFile1,
        hasDrugLicenseFile2,
        hasDrugLicenseFile3,
        drugLicenseError,
        privacyPolicyCheckbox,
        whatsappConsentCheckbox
      ];
}
