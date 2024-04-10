import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/pincode_data.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/get_address_by_pincode.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/get_business_type_use_case.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/get_state_list_use_case.dart';
import 'package:pharmarack/view/onboarding/domain/usecase/retailer_registration/retailer_registration_use_case.dart';
import 'package:pharmarack/view/onboarding/presentation/cubit/retailer_registration/step_one/retailer_registration_state.dart';


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

  Future<void> getAddressByPincode(String pincode) async {
    emit(state.copyWith(isLoading: true));
    final response = await _getAddressByPincodeUseCase.execute(
        params: PincodeDataParams(pincode: pincode));

    response.fold((l) => emit(state.copyWith(hasError: true, isLoading: false)),
        (r) {
      if (r.registrationState == null ||
          (r.registrationState?.isEmpty ?? true)) {
        var stateNameInstance = (r.registrationState?.length == 1)
            ? r.registrationState?.first.stateName
            : '';
        debugPrint('PR-> $stateNameInstance');
        emit(state.copyWith(
            hasError: true,
            isLoading: false,
            enableStateDropdown: true,
            pincodeData: r,
            area: '',
            city: '',
            region: '',
            stateName: ''));
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
            stateName: ''));
      }
    });
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
    if (reqMap.length <= 6) {
      debugPrint('PR-> reqMap.length${reqMap.length}');
      emit(state.copyWith(softValidate: false));
    } else {
      emit(state.copyWith(softValidate: true));
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
    if (value == null || value.isEmpty) {
      shopErrorText = errorMessage;
    } else {
      shopErrorText = null;
    }
  }

  void checkOwnerValue(String? value, String errorMessage) {
    if (value == null || value.isEmpty) {
      ownerErrorText = errorMessage;
    } else {
      ownerErrorText = null;
    }
  }

  void checkShopAddressValue(
      String? value, String errorMessage, int length, String lengthErrorMsg) {
    if (value == null || value.trim().isEmpty) {
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
