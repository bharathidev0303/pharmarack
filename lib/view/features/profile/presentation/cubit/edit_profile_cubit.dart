import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/utils/auto_login_utils.dart';
import 'package:pharmarack/view/features/profile/presentation/constants/edit_profile_constants.dart';
import 'package:pharmarack/view/features/profile/presentation/cubit/edit_profile_state.dart';
import 'package:pharmarack/view/onboarding/data/entities/retailer_Image_upload_entity.dart';
import 'package:pharmarack/view/onboarding/domain/model/registration_model.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/update_retailer_profile_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/upload_drug_licence_number.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UpdateRetailerProfileUsecase _updateRetailerProfileUsecase;
  final UploadDrugLicenceUseCase _drugLicenceUseCase;

  EditProfileCubit(
    this._updateRetailerProfileUsecase,
    this._drugLicenceUseCase,
  ) : super(EditProfileState.initial());

  void saveChanges(
      Map<String, dynamic> reqData, DrugLicenseImages drugLisenseImage) async {
    emit(EditProfileState.loading());
    final response = await _updateRetailerProfileUsecase.execute(
        params: UpdateRetailerUseCaseParams(reqData),
        reqData: reqData,
        drugLisenseImage: drugLisenseImage);

    response.fold((l) {
      emit(EditProfileState.error()
          .copyWith(drugLicenseImage: drugLisenseImage));
    }, (r) {
      getIt<AutoLoginUtils>().getRetailerInfo();
      emit(EditProfileState.success());
    });
  }

  void initialStateEmit() {
    emit(EditProfileState.initial());
  }

  void saveUserInputFieldsData(Map<String, String> reqData) async {
    DrugLicenseImages drugLicenseImages =
        state.drugLicenseImage ?? DrugLicenseImages();
    if (state.drugLicenseImage!.imageUrl!.isNotEmpty &&
        state.drugLicenseLocalFile == true) {
      UploadDLParams params = UploadDLParams(
          drugLicenceFilePath: state.drugLicenseImage!.imageUrl!,
          type: 'DL1',
          userId: reqData[EditProfileConstants.loginIdField] ?? "0");
      var response = await _drugLicenceUseCase.execute(params: params);
      response.fold((l) => {}, (r) {
        if (r.data != null) {
          drugLicenseImages = DrugLicenseImages(
              imageUrl: r.data!.imageUrl,
              imageDbPath: r.data!.imageDbPath,
              type: r.data!.type);
          saveChanges(reqData, drugLicenseImages);
        }
      });
    } else {
      saveChanges(reqData, drugLicenseImages);
    }
  }

  String? nameErrorText;
  String? upiErrorText;
  String? panNumberErrorText;
  String? drugLicenseNumberErrorText;
  String? drugLicenseErrorText;
  String? onSubmitValidateErrorText;

  void checkNameValue(String? value, String errorMessage) {
    onSubmitValidateErrorText = null;
    emit(state.copyWith(onSubmitValidateErrorText: ""));
    emit(state.copyWith(onSubmitValidateErrorText: null));
    if (value == null || value.isEmpty) {
      nameErrorText = errorMessage;
    } else {
      nameErrorText = null;
    }
  }

  void checkDrugLicenseNewFile(String errorMessage) {
    onSubmitValidateErrorText = null;
    emit(state.copyWith(onSubmitValidateErrorText: ""));
    if (state.drugLicenseLocalFile != null) {
      if (state.drugLicenseImage!.imageUrl!.isEmpty) {
        emit(state.copyWith(
            drugLicenseFileError: "Please Upload Drug License or Bill Copy"));
        emit(state.copyWith(drugLicenseLocalFile: true));
      } else {
        emit(state.copyWith(drugLicenseFileError: ""));
        emit(state.copyWith(drugLicenseLocalFile: true));
      }
    } else {
      emit(state.copyWith(
          drugLicenseFileError: "Please Upload Drug License or Bill Copy"));
      emit(state.copyWith(drugLicenseLocalFile: false));
    }
  }

  void checkPanNumberValue(String? value, String errorMessage) {
    onSubmitValidateErrorText = null;
    emit(state.copyWith(onSubmitValidateErrorText: ""));
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

  void checkdrugLicenseNumberValue(String? value, String errorMessage) {
    onSubmitValidateErrorText = null;
    emit(state.copyWith(onSubmitValidateErrorText: ""));
    if (value == null || value.isEmpty) {
      drugLicenseNumberErrorText = errorMessage;
    } else {
      drugLicenseNumberErrorText = null;
    }
  }

  Future emitDrugLisenseImage(
      {required String imageUrl,
      required String? imageDbPath,
      required String? type,
      required bool? localFile}) async {
    DrugLicenseImages drugLicenseImages = DrugLicenseImages(
        imageUrl: imageUrl, imageDbPath: imageDbPath, type: type);
    emit(state.copyWith(drugLicenseLocalFile: localFile));
    emit(state.copyWith(
        drugLicenseImage: drugLicenseImages, drugLicenseLocalFile: localFile));
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
    if (state.drugLicenseImage!.imageUrl == null ||
        state.drugLicenseImage!.imageUrl == "") {
      drugLicenseErrorText = context.localizedString.drugLicenseFileError;
      count++;
    }

    if (count > 0) {
      onSubmitValidateErrorText = "Please fill the required fields above.";
      emit(
          state.copyWith(onSubmitValidateErrorText: onSubmitValidateErrorText));
    }
    return count;
  }
}
