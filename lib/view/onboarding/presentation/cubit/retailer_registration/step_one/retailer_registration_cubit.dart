import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/pincode_data.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/get_address_by_pincode.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/get_business_type_use_case.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/get_state_list_use_case.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/retailer_registration_use_case.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/retailer_registration/step_one/retailer_registration_state.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

class RetailerRegistrationStepOneCubit
    extends Cubit<RetailerRegistrationState> {
  final GetBusinessTypeUseCase _getBusinessTypeUseCase;
  final GetStatesUseCase _getStatesUseCase;
  final GetAddressByPinCodeUseCase _getAddressByPincodeUseCase;
  final RetailerRegistrationUserCase _retailerRegistrationUserCase;

  RetailerRegistrationStepOneCubit(
      this._getBusinessTypeUseCase,
      this._getStatesUseCase,
      this._getAddressByPincodeUseCase,
      this._retailerRegistrationUserCase)
      : super(RetailerRegistrationState.initial());

  void getDropDownData() async {
    emit(state.copyWith(isLoading: true));
    final businessTypeResponse =
        await _getBusinessTypeUseCase.execute(params: GetBusinessTypeParams());
    businessTypeResponse.fold(
        (l) => emit(state.copyWith(
            businessTypes: [], hasError: true, isLoading: false)), (r) {
      if (r.isEmpty) {
        emit(state.copyWith(hasError: true, isLoading: false));
      } else {
        emit(state.copyWith(businessTypes: r, isLoading: false));
      }
    });

    final statesResponse =
        await _getStatesUseCase.execute(params: GetStatesParams());

    statesResponse.fold(
        (l) => emit(state.copyWith(hasError: true, isLoading: false)), (r) {
      if (r.isEmpty) {
        emit(state.copyWith(hasError: true, isLoading: false));
      } else {
        emit(state.copyWith(addressStates: r, isLoading: false));
      }
    });
  }

  Future<void> getAddressByPincode(
      String pincode, GlobalKey<FormState> _formKey) async {
    // emit(state.copyWith(isLoading: true));
    final response = await _getAddressByPincodeUseCase.execute(
        params: PincodeDataParams(pincode: pincode));

    response.fold((l) => emit(state.copyWith(hasError: true, isLoading: false)),
        (r) {
      if (r.registrationAreas!.isEmpty &&
          r.registrationCities!.isEmpty &&
          (r.registrationRegion!.isEmpty || r.registrationState!.isEmpty)) {
        pinCodeErrorText =
            "Pincode does not match Please enter a valid Pincode.";
        _formKey.currentState?.validate();
      }

      if (r.registrationState == null ||
          (r.registrationState?.isEmpty ?? true) ||
          (r.registrationState?.first.stateName == null)) {
        var stateNameInstance = (r.registrationState?.length == 1)
            ? r.registrationState?.first.stateName
            : '';

        emit(state.copyWith(
            hasError: true,
            isLoading: false,
            enableStateDropdown: true,
            pincodeData: r,
            area: '',
            city: '',
            region: '',
            stateName: '',
            resetState: false));
      } else {
        // var cities = r.registrationCities;
        // var cityInstance = (cities?.length == 1) ? cities?.first.cityName : '';
        var stateNameInstance = (r.registrationState?.length == 1)
            ? r.registrationState?.first.stateName
            : '';
        emit(state.copyWith(
            pincodeData: r,
            isLoading: false,
            enableStateDropdown: false,
            area: '',
            city: '',
            region: '',
            stateName: '',
            resetState: false));
      }
    });
  }

  Future<void> resetAddressByPincode() async {
    emit(state.copyWith(
        hasError: true,
        isLoading: false,
        enableStateDropdown: true,
        pincodeData: PincodeDataModel(),
        area: '',
        city: '',
        region: '',
        stateName: '',
        resetState: true));
  }

  void onAreaSelected(RegistrationDataModel area) {
    emit(state.copyWith(area: area.areaName ?? '', isLoading: false));
  }

  void onRegionSelected(RegistrationDataModel region) {
    emit(state.copyWith(region: region.regionName ?? '', isLoading: false));
  }

  void updateAreaValue(String newArea) {
    emit(state.copyWith(area: newArea));
  }

  void updateCityValue(String city) {
    emit(state.copyWith(city: city));
  }

  void updateRegionValue(String region) {
    emit(state.copyWith(region: region));
  }

  void saveUserInputFieldsData(Map<String, String> reqData) {
    _retailerRegistrationUserCase.setStepOneRegistrationData(reqData);
  }

  void softValidateFields(Map<String, String> reqMap) {
    int count = 0;
    if ((reqMap[OnboardingConstants.typeOfBusiness] ?? '').isNotEmpty &&
        reqMap[OnboardingConstants.typeOfBusiness] != null) {
      count++;
    }
    if ((reqMap[OnboardingConstants.nameOfShopFirm] ?? '').isNotEmpty &&
        reqMap[OnboardingConstants.nameOfShopFirm] != null) {
      count++;
    }
    if ((reqMap[OnboardingConstants.nameOfOwner] ?? '').isNotEmpty &&
        reqMap[OnboardingConstants.nameOfOwner] != null) {
      count++;
    }
    if ((reqMap[OnboardingConstants.shopAddress] ?? '').isNotEmpty &&
        reqMap[OnboardingConstants.shopAddress] != null) {
      count++;
    }
    if ((reqMap[OnboardingConstants.pincode] ?? '').isNotEmpty &&
        reqMap[OnboardingConstants.pincode] != null &&
        (reqMap[OnboardingConstants.pincode] ?? '').length == 6) {
      count++;
    }
    if ((reqMap[OnboardingConstants.area] ?? '').isNotEmpty &&
        reqMap[OnboardingConstants.area] != null) {
      count++;
    }
    if ((reqMap[OnboardingConstants.city] ?? '').isNotEmpty &&
        reqMap[OnboardingConstants.city] != null) {
      count++;
    }
    if ((reqMap[OnboardingConstants.region] ?? '').isNotEmpty &&
        reqMap[OnboardingConstants.region] != null) {
      count++;
    }
    if ((reqMap[OnboardingConstants.state] ?? '').isNotEmpty &&
        reqMap[OnboardingConstants.state] != null) {
      count++;
    }

    if ((state.stateName ?? '').isNotEmpty &&
        reqMap[OnboardingConstants.state] != null) {
      count++;
    }

    if ((count == 9 &&
        state.pincodeData.registrationRegion != null &&
        (state.pincodeData.registrationRegion ?? []).length >= 2)) {
      debugPrint(
          'PR-> state.pincodeData.registrationRegion != null ${state.pincodeData.registrationRegion != null}');
      debugPrint(
          'PR->state.pincodeData.registrationRegion!.length <= 2  ${(state.pincodeData.registrationRegion ?? []).length >= 2}');

      debugPrint(
          'PR-> reqMap[OnboardingConstants.area] ${reqMap[OnboardingConstants.area]}');
      debugPrint(
          'PR-> reqMap[OnboardingConstants.city] ${reqMap[OnboardingConstants.city]}');
      debugPrint(
          'PR-> reqMap[OnboardingConstants.region] ${reqMap[OnboardingConstants.region]}');

      debugPrint(
          'PR-> reqMap[OnboardingConstants.state] ${reqMap[OnboardingConstants.state]}');

      debugPrint(
          'PR-> reqMap[OnboardingConstants.region] != null  if condition  ${reqMap[OnboardingConstants.region] != null}');

      debugPrint(
          'PR-> true reqMap.length${reqMap.length} and count 9 ka $count');
      emit(state.copyWith(softValidate: true));
    } else if ((count == 8 &&
        state.pincodeData.registrationRegion != null &&
        (state.pincodeData.registrationRegion ?? []).length <= 1)) {
      debugPrint(
          'PR-> state.pincodeData.registrationRegion != null ${state.pincodeData.registrationRegion != null}');

      debugPrint(
          'PR->state.pincodeData.registrationRegion!.length <= 1  ${(state.pincodeData.registrationRegion ?? []).length <= 1}');

      debugPrint(
          'PR-> reqMap[OnboardingConstants.area] ${reqMap[OnboardingConstants.area]}');
      debugPrint(
          'PR-> reqMap[OnboardingConstants.city] ${reqMap[OnboardingConstants.city]}');
      debugPrint(
          'PR-> reqMap[OnboardingConstants.region] ${reqMap[OnboardingConstants.region]}');
      debugPrint(
          'PR-> reqMap[OnboardingConstants.state] ${reqMap[OnboardingConstants.state]}');

      debugPrint(
          'PR-> reqMap[OnboardingConstants.region] != null  if condition  ${reqMap[OnboardingConstants.region] != null}');

      debugPrint(
          'PR-> true reqMap.length${reqMap.length} and count 8 ka $count');
      emit(state.copyWith(softValidate: true));
    } else {
      debugPrint(
          'PR-> state.pincodeData.registrationRegion != null ${state.pincodeData.registrationRegion != null}');
      debugPrint(
          'PR->state.pincodeData.registrationRegion!.length   ${(state.pincodeData.registrationRegion ?? []).length}');
      debugPrint(
          'PR-> reqMap[OnboardingConstants.area] ${reqMap[OnboardingConstants.area]}');
      debugPrint(
          'PR-> reqMap[OnboardingConstants.city] ${reqMap[OnboardingConstants.city]}');
      debugPrint(
          'PR-> reqMap[OnboardingConstants.region] ${reqMap[OnboardingConstants.region]}');

      debugPrint(
          'PR-> reqMap[OnboardingConstants.state] ${reqMap[OnboardingConstants.state]}');
      debugPrint(
          'PR-> reqMap[OnboardingConstants.region] != null  else  ${reqMap[OnboardingConstants.region] != null}');
      debugPrint('PR-> false reqMap.length${reqMap.length}  and count $count');
      emit(state.copyWith(softValidate: false));
    }
  }

  String? dropDownErrorText;
  String? shopErrorText;
  String? ownerErrorText;
  String? shopAddressErrorText;
  String? pinCodeErrorText;
  String? areaErrorText;
  String? cityErrorText;
  String? regionErrorText;
  String? stateErrorText;

  void checkDropDownValue(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      dropDownErrorText = errorMessage;
    } else {
      dropDownErrorText = null;
    }
  }

  void checkShopOrFirmValue(String? value, String errorMessage) {
    if (value == null || value.isEmpty || value.contains(RegExp(r"^\s* " ""))) {
      shopErrorText = errorMessage;
    } else {
      shopErrorText = null;
    }
  }

  void checkOwnerValue(String? value, String errorMessage) {
    if (value == null || value.isEmpty || value.contains(RegExp(r"^\s* " ""))) {
      ownerErrorText = errorMessage;
    } else {
      ownerErrorText = null;
    }
  }

  void checkShopAddressValue(
      String? value, String errorMessage, int length, String lengthErrorMsg) {
    if (value == null ||
        value.trim().isEmpty ||
        value.contains(RegExp(r"^\s* " ""))) {
      shopAddressErrorText = errorMessage;
    } else if (value.isNotEmpty && value.trim().length < length) {
      shopAddressErrorText = lengthErrorMsg;
    } else {
      shopAddressErrorText = null;
    }
  }

  void checkPinCodeValue(
      String? value, String errorMessage, int length, String lengthErrorMsg) {
    if (value == null ||
        value.trim().isEmpty ||
        value.contains(RegExp(r"^\s* " ""))) {
      pinCodeErrorText = errorMessage;
    } else if (value.isNotEmpty && value.startsWith('0')) {
      pinCodeErrorText = 'Please enter valid Pincode.';
    } else if (value.isNotEmpty && value.trim().length < length) {
      pinCodeErrorText = lengthErrorMsg;
    } else {
      pinCodeErrorText = null;
    }
  }

  void checkAreaValue(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      areaErrorText = errorMessage;
    } else {
      areaErrorText = null;
    }
  }

  void checkCityValue(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      cityErrorText = errorMessage;
    } else {
      cityErrorText = null;
    }
  }

  void checkRegionValue(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      regionErrorText = errorMessage;
    } else {
      regionErrorText = null;
    }
  }

  void checkStateValue(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      stateErrorText = errorMessage;
    } else {
      stateErrorText = null;
    }
  }
}
