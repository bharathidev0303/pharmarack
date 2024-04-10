
import 'package:pharmarack/view/onboarding/data/entities/retailer_registration/pincode_data.dart';

class PincodeDataModel {
  List<RegistrationDataModel>? registrationCities;
  List<RegistrationDataModel>? registrationAreas;
  List<RegistrationDataModel>? registrationState;
  List<RegistrationDataModel>? registrationRegion;

  PincodeDataModel(
      {this.registrationCities,
      this.registrationAreas,
      this.registrationState,
      this.registrationRegion});

  PincodeDataModel.from(PincodeData pincodeData) {
    if (pincodeData.registrationCities != null) {
      registrationCities = <RegistrationDataModel>[];
      pincodeData.registrationCities?.forEach((v) {
        registrationCities!.add(RegistrationDataModel.from(v));
      });
    }
    if (pincodeData.registrationAreas != null) {
      registrationAreas = <RegistrationDataModel>[];
      pincodeData.registrationAreas?.forEach((v) {
        registrationAreas!.add(RegistrationDataModel.from(v));
      });
    }
    if (pincodeData.registrationState != null) {
      registrationState = <RegistrationDataModel>[];
      pincodeData.registrationState?.forEach((v) {
        registrationState!.add(RegistrationDataModel.from(v));
      });
    }
    if (pincodeData.registrationRegion != null) {
      registrationRegion = <RegistrationDataModel>[];
      pincodeData.registrationRegion?.forEach((v) {
        registrationRegion!.add(RegistrationDataModel.from(v));
      });
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PincodeDataModel &&
          runtimeType == other.runtimeType &&
          registrationCities == other.registrationCities &&
          registrationAreas == other.registrationAreas &&
          registrationState == other.registrationState &&
          registrationRegion == other.registrationRegion;

  @override
  int get hashCode =>
      registrationCities.hashCode ^
      registrationAreas.hashCode ^
      registrationState.hashCode ^
      registrationRegion.hashCode;
}

class RegistrationDataModel {
  int? areaPincodeMapId;
  String? pinCode;
  String? stateName;
  String? regionName;
  String? regionId;
  String? cityName;
  String? districtName;
  String? areaName;
  int? stateId;

  RegistrationDataModel(
      {this.areaPincodeMapId,
      this.pinCode,
      this.stateName,
      this.regionName,
      this.regionId,
      this.cityName,
      this.districtName,
      this.areaName,
      this.stateId});

  RegistrationDataModel.from(RegistrationData registrationData) {
    areaPincodeMapId = registrationData.areaPincodeMapId;
    pinCode = registrationData.pinCode;
    stateName = registrationData.stateName;
    regionName = registrationData.regionName;
    regionId = registrationData.regionId;
    cityName = registrationData.cityName;
    districtName = registrationData.districtName;
    areaName = registrationData.areaName;
    stateId = registrationData.stateId;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistrationDataModel &&
          runtimeType == other.runtimeType &&
          areaPincodeMapId == other.areaPincodeMapId &&
          pinCode == other.pinCode &&
          stateName == other.stateName &&
          regionName == other.regionName &&
          regionId == other.regionId &&
          cityName == other.cityName &&
          districtName == other.districtName &&
          areaName == other.areaName &&
          stateId == other.stateId;

  @override
  int get hashCode =>
      areaPincodeMapId.hashCode ^
      pinCode.hashCode ^
      stateName.hashCode ^
      regionName.hashCode ^
      regionId.hashCode ^
      cityName.hashCode ^
      districtName.hashCode ^
      areaName.hashCode ^
      stateId.hashCode;
}
