import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/utils/auto_login_utils.dart';
import 'package:pharmarack/view/features/profile/presentation/constants/edit_profile_constants.dart';
import 'package:pharmarack/view/features/profile/presentation/cubit/edit_profile_state.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/update_retailer_profile_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/upload_drug_licence_number.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UpdateRetailerProfileUsecase _updateRetailerProfileUsecase;
  final UploadDrugLicenceUseCase _drugLicenceUseCase;

  EditProfileCubit(
    this._updateRetailerProfileUsecase,
    this._drugLicenceUseCase,
  ) : super(EditProfileState.initial());

  void saveChanges(Map<String, dynamic> reqData) async {
    emit(
      state.copyWith(
        isLoading: true,
        userMessages: state.userMessages..add(UserMessage.updateProfileInitial),
      ),
    );
    final response = await _updateRetailerProfileUsecase.execute(
        params: UpdateRetailerUseCaseParams(reqData), reqData: reqData);

    response.fold((l) {
      emit(
        state.copyWith(
          isLoading: false,
          userMessages: state.userMessages
            ..add(UserMessage.updateProfileFailure),
        ),
      );
    }, (r) {
      getIt<AutoLoginUtils>().getRetailerInfo();
      emit(EditProfileState.success());
      emit(
        state.copyWith(
          moveToMyProfilePage: true,
          isLoading: false,
          userMessages: state.userMessages
            ..add(UserMessage.updateProfileSuccess),
        ),
      );
    });
  }

  void saveUserInputFieldsData(Map<String, String> reqData) {
    uploadUserDL(state.drugLicenseNewFile ?? XFile(""));
    // saveChanges(reqData);
  }

  Future<void> uploadUserDL(XFile file) async {
    List<Future<dynamic>> futures = [];
    const String userId = "0";
    if (file.path.isNotEmpty) {
      UploadDLParams params = UploadDLParams(
          drugLicenceFilePath: file.path, type: 'DL1', userId: userId);
      futures.add(_drugLicenceUseCase.execute(params: params));
    }

    Future<List<dynamic>> allResults = Future.wait(futures);

    allResults.then((value) {});
  }

  String? nameErrorText;
  String? upiErrorText;
  String? panNumberErrorText;
  String? drugLicenseNumberErrorText;
  String? drugLicenseErrorText;

  void checkNameValue(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      nameErrorText = errorMessage;
    } else {
      nameErrorText = null;
    }
  }

  void checkDrugLicenseNewFile(XFile? value, String errorMessage) {
    if (value != null) {
      if (value.path.isEmpty) {
        emit(state.copyWith(
            drugLicenseFileError: "Please Upload Drug License or Bill Copy"));
        emit(state.copyWith(drugLicenseNewFile: null));
        emit(state.copyWith(drugLicenseFileUploaded: false));
      } else {
        emit(state.copyWith(drugLicenseFileError: ""));
        emit(state.copyWith(drugLicenseNewFile: value));
        emit(state.copyWith(drugLicenseFileUploaded: true));
      }
    } else {
      emit(state.copyWith(
          drugLicenseFileError: "Please Upload Drug License or Bill Copy"));
      emit(state.copyWith(drugLicenseNewFile: XFile("")));
      emit(state.copyWith(drugLicenseFileUploaded: false));
    }
  }

  void checkPanNumberValue(String? value, String errorMessage) {
    RegExp regExp = RegExp(r"^[A-Z]{5}[0-9]{4}[A-Z]{1}$");
    if (value == null ||
        value.isEmpty ||
        value.contains(RegExp(r"^\s* " "")) ||
        value.length < 10 ||
        !regExp.hasMatch(value)) {
      panNumberErrorText = errorMessage;
    } else {
      panNumberErrorText = null;
    }
  }

  void checkUPIValue(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      upiErrorText = errorMessage;
    } else {
      upiErrorText = null;
    }
  }

  void checkdrugLicenseNumberValue(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      drugLicenseNumberErrorText = errorMessage;
    } else {
      drugLicenseNumberErrorText = null;
    }
  }

  int validateReqFields(BuildContext context, Map<String, dynamic> reqMap) {
    int count = 0;
    if (reqMap[EditProfileConstants.retailerNameField] == "" ||
        reqMap[EditProfileConstants.retailerNameField] == null) {
      nameErrorText = context.localizedString.nameOfTheOwner;
      count++;
    }
    if (reqMap[EditProfileConstants.licenseNumberField] == "" ||
        reqMap[EditProfileConstants.licenseNumberField] == null) {
      drugLicenseNumberErrorText =
          context.localizedString.drugLicenseNumberError;
      count++;
    }
    if (reqMap[EditProfileConstants.panNumberField] == "" ||
        reqMap[EditProfileConstants.panNumberField] == null) {
      panNumberErrorText = context.localizedString.panError;
      count++;
    }
    if (reqMap[EditProfileConstants.drugLicenseImageField] == null ||
        reqMap[EditProfileConstants.drugLicenseImageField] == "") {
      drugLicenseErrorText = context.localizedString.drugLicenseFileError;
      emit(state.copyWith(drugLicenseFileError: drugLicenseErrorText));
      count++;
    }
    if (reqMap[EditProfileConstants.drugLicenseImageField] == null &&
        state.drugLicenseNewFile == null &&
        state.drugLicenseFileUploaded == true) {
      drugLicenseErrorText = context.localizedString.drugLicenseFileError;
      emit(state.copyWith(drugLicenseFileError: drugLicenseErrorText));
      count++;
    }

    return count;
  }
}
