import 'dart:collection';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

class EditProfileState extends Equatable {
  final bool isLoading;
  final HashSet<UserMessage> userMessages;
  final bool isActionButtonEnabled;
  final String panNumber;
  final String upiId;
  final String drugLicenseNum1;
  final String drugLicenseNum2;
  final String drugLicenseNum3;
  final File? drugLicenseFile1;
  final File? drugLicenseFile2;
  final File? drugLicenseFile3;
  final bool updateStatus;
  final bool moveToHomePage;
  final bool moveToMyProfilePage;
  final int drugLicenseCount;
  final bool hasDrugLicenseFile1;
  final bool hasDrugLicenseFile2;
  final bool hasDrugLicenseFile3;
  final DrugLicenseError drugLicenseError;
  final String businessTypes;
  final String addressStates;
  final String bankName;
  final String accountType;
  final String accountNumber;
  final String accountHolderName;
  final String ifsc;
  final String telephoneNumber;
  final String? telephoneNumberValidation;
  final String name;
  final String mobileNumberValidation;

  const EditProfileState({
    required this.isLoading,
    required this.userMessages,
    required this.isActionButtonEnabled,
    required this.panNumber,
    required this.upiId,
    required this.drugLicenseNum1,
    required this.drugLicenseNum2,
    required this.drugLicenseNum3,
    required this.drugLicenseFile1,
    required this.drugLicenseFile2,
    required this.drugLicenseFile3,
    required this.updateStatus,
    required this.moveToHomePage,
    required this.moveToMyProfilePage,
    required this.drugLicenseCount,
    required this.hasDrugLicenseFile1,
    required this.hasDrugLicenseFile2,
    required this.hasDrugLicenseFile3,
    required this.drugLicenseError,
    required this.businessTypes,
    required this.addressStates,
    required this.bankName,
    required this.accountType,
    required this.accountNumber,
    required this.accountHolderName,
    required this.ifsc,
    required this.telephoneNumber,
    required this.telephoneNumberValidation,
    required this.name,
    required this.mobileNumberValidation,
  });

  factory EditProfileState.initial() {
    return EditProfileState(
      isLoading: false,
      userMessages: HashSet<UserMessage>(),
      isActionButtonEnabled: false,
      panNumber: '',
      upiId: '',
      drugLicenseNum1: '',
      drugLicenseNum2: '',
      drugLicenseNum3: '',
      drugLicenseFile1: null,
      drugLicenseFile2: null,
      drugLicenseFile3: null,
      updateStatus: false,
      moveToHomePage: false,
      moveToMyProfilePage: false,
      drugLicenseCount: 0,
      hasDrugLicenseFile1: false,
      hasDrugLicenseFile2: false,
      hasDrugLicenseFile3: false,
      drugLicenseError: DrugLicenseError.empty,
      businessTypes: '',
      addressStates: '',
      bankName: '',
      accountType: '',
      accountNumber: '',
      accountHolderName: '',
      ifsc: '',
      telephoneNumber: '',
      telephoneNumberValidation: null,
      name: '',
      mobileNumberValidation: '',
    );
  }
  factory EditProfileState.success() {
    return EditProfileState(
      isLoading: false,
      userMessages: HashSet<UserMessage>(),
      isActionButtonEnabled: false,
      panNumber: '',
      upiId: '',
      drugLicenseNum1: '',
      drugLicenseNum2: '',
      drugLicenseNum3: '',
      drugLicenseFile1: null,
      drugLicenseFile2: null,
      drugLicenseFile3: null,
      updateStatus: false,
      moveToHomePage: false,
      moveToMyProfilePage: false,
      drugLicenseCount: 0,
      hasDrugLicenseFile1: false,
      hasDrugLicenseFile2: false,
      hasDrugLicenseFile3: false,
      drugLicenseError: DrugLicenseError.empty,
      businessTypes: '',
      addressStates: '',
      bankName: '',
      accountType: '',
      accountNumber: '',
      accountHolderName: '',
      ifsc: '',
      telephoneNumber: '',
      telephoneNumberValidation: null,
      name: '',
      mobileNumberValidation: '',
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        userMessages,
        isActionButtonEnabled,
        panNumber,
        upiId,
        drugLicenseNum1,
        drugLicenseNum2,
        drugLicenseNum3,
        drugLicenseFile1,
        drugLicenseFile2,
        drugLicenseFile3,
        updateStatus,
        moveToHomePage,
        moveToMyProfilePage,
        drugLicenseCount,
        hasDrugLicenseFile1,
        hasDrugLicenseFile2,
        hasDrugLicenseFile3,
        drugLicenseError,
        businessTypes,
        addressStates,
        bankName,
        accountType,
        accountNumber,
        accountHolderName,
        ifsc,
        telephoneNumber,
        telephoneNumberValidation,
      ];

  EditProfileState copyWith({
    bool? isLoading,
    HashSet<UserMessage>? userMessages,
    bool? isActionButtonEnabled,
    String? panNumber,
    String? upiId,
    String? drugLicenseNum1,
    String? drugLicenseNum2,
    String? drugLicenseNum3,
    File? drugLicenseFile1,
    File? drugLicenseFile2,
    File? drugLicenseFile3,
    bool? updateStatus,
    bool? moveToHomePage,
    bool? moveToMyProfilePage,
    int? drugLicenseCount,
    bool? hasDrugLicenseFile1,
    bool? hasDrugLicenseFile2,
    bool? hasDrugLicenseFile3,
    DrugLicenseError? drugLicenseError,
    String? businessTypes,
    String? addressStates,
    String? bankName,
    String? accountType,
    String? accountNumber,
    String? accountHolderName,
    String? ifsc,
    String? telephoneNumber,
    String? telephoneNumberValidation,
    String? name,
    String? mobileNumberValidation,
  }) {
    return EditProfileState(
      isLoading: isLoading ?? this.isLoading,
      userMessages: userMessages ?? this.userMessages,
      isActionButtonEnabled:
          isActionButtonEnabled ?? this.isActionButtonEnabled,
      panNumber: panNumber ?? this.panNumber,
      upiId: upiId ?? this.upiId,
      drugLicenseNum1: drugLicenseNum1 ?? this.drugLicenseNum1,
      drugLicenseNum2: drugLicenseNum2 ?? this.drugLicenseNum2,
      drugLicenseNum3: drugLicenseNum3 ?? this.drugLicenseNum3,
      drugLicenseFile1: drugLicenseFile1 ?? this.drugLicenseFile1,
      drugLicenseFile2: drugLicenseFile2 ?? this.drugLicenseFile2,
      drugLicenseFile3: drugLicenseFile3 ?? this.drugLicenseFile3,
      updateStatus: updateStatus ?? this.updateStatus,
      moveToHomePage: moveToHomePage ?? this.moveToHomePage,
      moveToMyProfilePage: moveToMyProfilePage ?? this.moveToMyProfilePage,
      drugLicenseCount: drugLicenseCount ?? this.drugLicenseCount,
      hasDrugLicenseFile1: hasDrugLicenseFile1 ?? this.hasDrugLicenseFile1,
      hasDrugLicenseFile2: hasDrugLicenseFile2 ?? this.hasDrugLicenseFile2,
      hasDrugLicenseFile3: hasDrugLicenseFile3 ?? this.hasDrugLicenseFile3,
      drugLicenseError: drugLicenseError ?? this.drugLicenseError,
      businessTypes: businessTypes ?? this.businessTypes,
      addressStates: addressStates ?? this.addressStates,
      bankName: bankName ?? this.bankName,
      accountType: accountType ?? this.accountType,
      accountNumber: accountNumber ?? this.accountNumber,
      accountHolderName: accountHolderName ?? this.accountHolderName,
      ifsc: ifsc ?? this.ifsc,
      telephoneNumber: telephoneNumber ?? this.telephoneNumber,
      telephoneNumberValidation:
          telephoneNumberValidation ?? this.telephoneNumberValidation,
      name: name ?? this.name,
      mobileNumberValidation:
          mobileNumberValidation ?? this.mobileNumberValidation,
    );
  }
}

enum UserMessage { updateProfileSuccess, updateProfileFailure }
