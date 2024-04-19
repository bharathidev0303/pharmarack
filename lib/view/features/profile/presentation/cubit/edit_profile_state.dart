import 'dart:collection';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileState extends Equatable {
  final bool isLoading;
  final HashSet<UserMessage> userMessages;
  final bool isActionButtonEnabled;
  final bool drugLicenseFileUploaded;
  final bool moveToMyProfilePage;
  final XFile? drugLicenseNewFile;
  final String? drugLicenseFileError;
  final String? onSubmitValidateErrorText;

  const EditProfileState({
    required this.isLoading,
    required this.userMessages,
    required this.isActionButtonEnabled,
    required this.drugLicenseFileUploaded,
    required this.moveToMyProfilePage,
    required this.drugLicenseNewFile,
    required this.drugLicenseFileError,
    required this.onSubmitValidateErrorText,
  });

  factory EditProfileState.initial() {
    return EditProfileState(
      isLoading: false,
      userMessages: HashSet<UserMessage>()
        ..add(UserMessage.updateProfileInitial),
      isActionButtonEnabled: false,
      drugLicenseFileUploaded: false,
      moveToMyProfilePage: false,
      drugLicenseNewFile: null,
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
      drugLicenseFileUploaded: false,
      moveToMyProfilePage: false,
      drugLicenseNewFile: null,
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
      drugLicenseFileUploaded: false,
      moveToMyProfilePage: false,
      drugLicenseNewFile: null,
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
      drugLicenseFileUploaded: false,
      moveToMyProfilePage: false,
      drugLicenseNewFile: null,
      drugLicenseFileError: null,
      onSubmitValidateErrorText: null,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        userMessages,
        isActionButtonEnabled,
        drugLicenseFileUploaded,
        moveToMyProfilePage,
        drugLicenseNewFile,
        drugLicenseFileError,
        onSubmitValidateErrorText,
      ];

  EditProfileState copyWith({
    bool? isLoading,
    HashSet<UserMessage>? userMessages,
    bool? isActionButtonEnabled,
    bool? drugLicenseFileUploaded,
    bool? moveToMyProfilePage,
    XFile? drugLicenseNewFile,
    String? drugLicenseFileError,
    String? onSubmitValidateErrorText,
  }) {
    return EditProfileState(
      isLoading: isLoading ?? this.isLoading,
      userMessages: userMessages ?? this.userMessages,
      isActionButtonEnabled:
          isActionButtonEnabled ?? this.isActionButtonEnabled,
      drugLicenseFileUploaded:
          drugLicenseFileUploaded ?? this.drugLicenseFileUploaded,
      moveToMyProfilePage: moveToMyProfilePage ?? this.moveToMyProfilePage,
      drugLicenseNewFile: drugLicenseNewFile ?? this.drugLicenseNewFile,
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
