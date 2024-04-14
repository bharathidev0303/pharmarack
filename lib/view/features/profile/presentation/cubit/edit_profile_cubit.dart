import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/features/profile/presentation/cubit/edit_profile_state.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/update_retailer_profile_usecase.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/upload_drug_licence_number.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final UpdateRetailerProfileUsecase _updateRetailerProfileUsecase;
  final UploadDrugLicenceUseCase _drugLicenceUseCase;

  EditProfileCubit(
    this._updateRetailerProfileUsecase,
    this._drugLicenceUseCase,
  ) : super(EditProfileState.initial());

  void saveChanges() async {
    final response = await _updateRetailerProfileUsecase.execute(
        params: UpdateRetailerUseCaseParams(
            _updateRetailerProfileUsecase.getRequestString()));
    print('JSON RESP: ${response}');

    response.fold((l) {
      emit(
        state.copyWith(
          isLoading: false,
          userMessages: state.userMessages
            ..add(UserMessage.updateProfileFailure),
        ),
      );
    }, (r) {
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
    _updateRetailerProfileUsecase.updateProfileData(reqData);
    uploadUserDL();
    saveChanges();
  }

  Future<void> uploadUserDL() async {
    List<Future<dynamic>> futures = [];
    const String userId = "0";
    if (state.hasDrugLicenseFile1) {
      UploadDLParams params = UploadDLParams(
          drugLicenceFilePath: state.drugLicenseFile1?.path ?? '',
          type: 'DL1',
          userId: userId);
      futures.add(_drugLicenceUseCase.execute(params: params));
    }

    Future<List<dynamic>> allResults = Future.wait(futures);

    allResults.then((value) {});
  }

  void addDrugLicense() {
    state.drugLicenseNum1.isEmpty || !state.hasDrugLicenseFile1
        ? emit(state.copyWith(
            drugLicenseError: DrugLicenseError.drugLicenseError1))
        : emit(state.copyWith(
            drugLicenseCount: (state.drugLicenseCount + 1),
            drugLicenseError: DrugLicenseError.empty));
  }

  void setName(String? value) {
    emit(state.copyWith(name: value, isLoading: false));
  }

  void setTelephoneNumber(String? value) {
    emit(state.copyWith(telephoneNumber: value, isLoading: false));
  }

  void setDrugLicenseFile1(File? file) {
    emit(state.copyWith(
        drugLicenseFile1: file,
        hasDrugLicenseFile1: file != null,
        drugLicenseError: DrugLicenseError.empty));
  }

  void setDrugLicenseNum1(String? value) {
    emit(state.copyWith(
      drugLicenseNum1: value,
    ));
  }

  void setPanNumber(String? value) {
    emit(state.copyWith(panNumber: value, isLoading: false));
  }

  void setUpiId(String? value) {
    emit(state.copyWith(upiId: value, isLoading: false));
  }

  void setBankName(String? value) {
    emit(state.copyWith(bankName: value, isLoading: false));
  }

  void setAccountType(String? value) {
    emit(state.copyWith(accountType: value, isLoading: false));
  }

  void setBankAccountNumber(String? value) {
    emit(state.copyWith(accountNumber: value, isLoading: false));
  }

  void setBankAccountHolderName(String? value) {
    emit(state.copyWith(accountHolderName: value, isLoading: false));
  }

  void setIfscCode(String? value) {
    emit(state.copyWith(ifsc: value, isLoading: false));
  }

  // void validateMainMobileNumber() async {
  //   String validation = await validateMobileNumber(state.telephoneNumber);
  //   emit(state.copyWith(mobileNumberValidation: validation, isLoading: false));
  // }

  void softValidateFields() {
    if (state.panNumber.isNotEmpty) {
      //emit(state.copyWith(isSoftEnable: true, isLoading: false));
    } else {
      // emit(state.copyWith(isSoftEnable: false, isLoading: false));
    }
  }

  // Future<String> validateMobileNumber(String mobileNumber) async {
  //   emit(state.copyWith(isLoading: true));
  //   const int userID = 0;
  //   final response = await _checkMobileNumberUseCase.execute(
  //       params: VerifyMobileNumberParams(
  //           mobileNumber: mobileNumber, userID: userID));
  //   return response.fold((l) {
  //     return '';
  //   }, (r) {
  //     if (r.message == 'Mobile number not in use') {
  //       return '';
  //     }
  //     return r.message!;
  //   });
  // }
}
