import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/business_type.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/pincode_data.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/state.dart';

///Base state
class RetailerRegistrationState extends Equatable {
  final List<BusinessTypeModel> businessTypes; // Dropdown
  final List<AddressStateModel> addressStates; // Dropdown
  final PincodeDataModel pincodeData;
  final RegistrationDataModel registrationArea;
  final String typeOfBusiness;
  final String nameOfShop;
  final String nameOfOwner;
  final String shopAddress;
  final String pincode;
  final String area;
  final String city;
  final String region;
  final String stateId;
  final String stateName;
  final bool resetState;
  final String regionId;
  final bool isLoading;
  final bool hasError;
  final bool enableStateDropdown;
  final bool softValidate;
  final int visibilityTest;
  const RetailerRegistrationState({
    required this.addressStates,
    required this.businessTypes,
    required this.pincodeData,
    required this.registrationArea,
    required this.typeOfBusiness,
    required this.nameOfShop,
    required this.nameOfOwner,
    required this.shopAddress,
    required this.pincode,
    required this.area,
    required this.city,
    required this.region,
    required this.stateId,
    required this.stateName,
    required this.regionId,
    required this.resetState,
    this.isLoading = false,
    this.hasError = false,
    this.enableStateDropdown = true,
    this.softValidate = false,
    this.visibilityTest = 1,
  });

  RetailerRegistrationState copyWith({
    List<BusinessTypeModel>? businessTypes,
    List<AddressStateModel>? addressStates,
    PincodeDataModel? pincodeData,
    RegistrationDataModel? registrationArea,
    String? typeOfBusiness,
    String? nameOfShop,
    String? nameOfOwner,
    String? shopAddress,
    String? pincode,
    String? area,
    String? city,
    String? region,
    String? stateId,
    String? stateName,
    bool? resetState,
    String? regionId,
    bool? isLoading,
    bool? hasError,
    bool? enableStateDropdown,
    bool? softValidate,
    int? visibilityTest,
  }) {
    return RetailerRegistrationState(
      addressStates: addressStates ?? this.addressStates,
      businessTypes: businessTypes ?? this.businessTypes,
      pincodeData: pincodeData ?? this.pincodeData,
      registrationArea: registrationArea ?? this.registrationArea,
      typeOfBusiness: typeOfBusiness ?? this.typeOfBusiness,
      nameOfShop: nameOfShop ?? this.nameOfShop,
      nameOfOwner: nameOfOwner ?? this.nameOfOwner,
      shopAddress: shopAddress ?? this.shopAddress,
      pincode: pincode ?? this.pincode,
      area: area ?? this.area,
      city: city ?? this.city,
      region: region ?? this.region,
      stateId: stateId ?? this.stateId,
      stateName: stateId ?? this.stateName,
      resetState: resetState ?? this.resetState,
      regionId: regionId ?? this.regionId,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      enableStateDropdown: enableStateDropdown ?? this.enableStateDropdown,
      softValidate: softValidate ?? this.softValidate,
      visibilityTest: visibilityTest ?? this.visibilityTest,
    );
  }

  factory RetailerRegistrationState.initial() {
    return RetailerRegistrationState(
      addressStates: const [],
      businessTypes: const [],
      pincodeData: PincodeDataModel(),
      registrationArea: RegistrationDataModel(),
      typeOfBusiness: '',
      nameOfShop: '',
      nameOfOwner: '',
      shopAddress: '',
      pincode: '',
      area: '',
      city: '',
      region: '',
      stateId: '',
      stateName: '',
      regionId: '',
      resetState: true,
    );
  }

  @override
  List<Object?> get props => [
        addressStates,
        businessTypes,
        pincodeData,
        registrationArea,
        typeOfBusiness,
        nameOfShop,
        nameOfOwner,
        shopAddress,
        pincode,
        area,
        city,
        region,
        stateId,
        stateName,
        regionId,
        isLoading,
        hasError,
        enableStateDropdown,
        softValidate,
        visibilityTest
      ];
}
