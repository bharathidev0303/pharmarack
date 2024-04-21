import 'dart:collection';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmarack/view/onboarding/domain/model/registration_model.dart';

class EditProfileState extends Equatable {
  final bool isLoading;
  final HashSet<UserMessage> userMessages;
  final bool isActionButtonEnabled;
  final bool drugLicenseLocalFile;
  final bool moveToMyProfilePage;
  final DrugLicenseImages? drugLicenseImage;
  final String? drugLicenseFileError;
  final String? onSubmitValidateErrorText;

  const EditProfileState({
    required this.isLoading,
    required this.userMessages,
    required this.isActionButtonEnabled,
    required this.drugLicenseLocalFile,
    required this.moveToMyProfilePage,
    required this.drugLicenseImage,
    required this.drugLicenseFileError,
    required this.onSubmitValidateErrorText,
  });

  factory EditProfileState.initial() {
    return EditProfileState(
      isLoading: false,
      userMessages: HashSet<UserMessage>()
        ..add(UserMessage.updateProfileInitial),
      isActionButtonEnabled: false,
      drugLicenseLocalFile: false,
      moveToMyProfilePage: false,
      drugLicenseImage: null,
      drugLicenseFileError: null,
      onSubmitValidateErrorText: null,
    );
  }

  factory EditProfileState.loading() {
    return EditProfileState(
      isLoading: false,
      userMessages: HashSet<UserMessage>()
        ..add(UserMessage.updateProfileLoading),
      isActionButtonEnabled: false,
      drugLicenseLocalFile: false,
      moveToMyProfilePage: false,
      drugLicenseImage: null,
      drugLicenseFileError: null,
      onSubmitValidateErrorText: null,
    );
  }
  factory EditProfileState.success() {
    return EditProfileState(
      isLoading: false,
      userMessages: HashSet<UserMessage>()
        ..add(UserMessage.updateProfileSuccess),
      isActionButtonEnabled: false,
      drugLicenseImage: null,
      drugLicenseLocalFile: false,
      moveToMyProfilePage: false,
      drugLicenseFileError: null,
      onSubmitValidateErrorText: null,
    );
  }
  factory EditProfileState.error() {
    return EditProfileState(
      isLoading: false,
      userMessages: HashSet<UserMessage>()
        ..add(UserMessage.updateProfileFailure),
      isActionButtonEnabled: false,
      drugLicenseLocalFile: false,
      drugLicenseImage: null,
      moveToMyProfilePage: false,
      drugLicenseFileError: null,
      onSubmitValidateErrorText: null,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        userMessages,
        isActionButtonEnabled,
        drugLicenseImage,
        drugLicenseLocalFile,
        moveToMyProfilePage,
        drugLicenseFileError,
        onSubmitValidateErrorText,
      ];

  EditProfileState copyWith({
    bool? isLoading,
    HashSet<UserMessage>? userMessages,
    bool? isActionButtonEnabled,
    bool? drugLicenseLocalFile,
    DrugLicenseImages? drugLicenseImage,
    bool? moveToMyProfilePage,
    String? drugLicenseFileError,
    String? onSubmitValidateErrorText,
  }) {
    return EditProfileState(
      isLoading: isLoading ?? this.isLoading,
      userMessages: userMessages ?? this.userMessages,
      isActionButtonEnabled:
          isActionButtonEnabled ?? this.isActionButtonEnabled,
      drugLicenseLocalFile: drugLicenseLocalFile ?? this.drugLicenseLocalFile,
      moveToMyProfilePage: moveToMyProfilePage ?? this.moveToMyProfilePage,
      drugLicenseImage: drugLicenseImage ?? this.drugLicenseImage,
      drugLicenseFileError: drugLicenseFileError ?? this.drugLicenseFileError,
      onSubmitValidateErrorText:
          onSubmitValidateErrorText ?? this.onSubmitValidateErrorText,
    );
  }
}

enum UserMessage {
  updateProfileSuccess,
  updateProfileFailure,
  updateProfileLoading,
  updateProfileInitial,
}
