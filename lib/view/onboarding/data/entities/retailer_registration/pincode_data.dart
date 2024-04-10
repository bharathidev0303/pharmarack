import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PincodeData {
  @JsonKey(name: 'RegistrationCities')
  List<RegistrationData>? registrationCities;
  @JsonKey(name: 'RegistrationAreas')
  List<RegistrationData>? registrationAreas;
  @JsonKey(name: 'RegistrationState')
  List<RegistrationData>? registrationState;
  @JsonKey(name: 'RegistrationRegion')
  List<RegistrationData>? registrationRegion;

  PincodeData(
      {this.registrationCities,
      this.registrationAreas,
      this.registrationState,
      this.registrationRegion});

  PincodeData.fromJson(Map<String, dynamic> json) {
    if (json['RegistrationCities'] != null) {
      registrationCities = <RegistrationData>[];
      json['RegistrationCities'].forEach((v) {
        registrationCities!.add(RegistrationData.fromJson(v));
      });
    }
    if (json['RegistrationAreas'] != null) {
      registrationAreas = <RegistrationData>[];
      json['RegistrationAreas'].forEach((v) {
        registrationAreas!.add(RegistrationData.fromJson(v));
      });
    }
    if (json['RegistrationState'] != null) {
      registrationState = <RegistrationData>[];
      json['RegistrationState'].forEach((v) {
        registrationState!.add(RegistrationData.fromJson(v));
      });
    }
    if (json['RegistrationRegion'] != null) {
      registrationRegion = <RegistrationData>[];
      json['RegistrationRegion'].forEach((v) {
        registrationRegion!.add(RegistrationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (registrationCities != null) {
      data['RegistrationCities'] =
          registrationCities!.map((v) => v.toJson()).toList();
    }
    if (registrationAreas != null) {
      data['RegistrationAreas'] =
          registrationAreas!.map((v) => v.toJson()).toList();
    }
    if (registrationState != null) {
      data['RegistrationState'] =
          registrationState!.map((v) => v.toJson()).toList();
    }
    if (registrationRegion != null) {
      data['RegistrationRegion'] =
          registrationRegion!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PincodeData &&
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

@JsonSerializable()
class RegistrationData {
  @JsonKey(name: 'AreaPincodeMapId')
  int? areaPincodeMapId;
  @JsonKey(name: 'PinCode')
  String? pinCode;
  @JsonKey(name: 'StateName')
  String? stateName;
  @JsonKey(name: 'RegionName')
  String? regionName;
  @JsonKey(name: 'RegionId')
  String? regionId;
  @JsonKey(name: 'cityName')
  String? cityName;
  @JsonKey(name: 'DistrictName')
  String? districtName;
  @JsonKey(name: 'AreaName')
  String? areaName;
  @JsonKey(name: 'StateId')
  int? stateId;

  RegistrationData(
      {this.areaPincodeMapId,
      this.pinCode,
      this.stateName,
      this.regionName,
      this.regionId,
      this.cityName,
      this.districtName,
      this.areaName,
      this.stateId});

  RegistrationData.fromJson(Map<String, dynamic> json) {
    areaPincodeMapId = json['AreaPincodeMapId'];
    pinCode = json['PinCode'];
    stateName = json['StateName'];
    regionName = json['RegionName'];
    regionId = json['RegionId'].toString();
    cityName = json['cityName'];
    districtName = json['DistrictName'];
    areaName = json['AreaName'];
    stateId = json['StateId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AreaPincodeMapId'] = areaPincodeMapId;
    data['PinCode'] = pinCode;
    data['StateName'] = stateName;
    data['RegionName'] = regionName;
    data['RegionId'] = regionId;
    data['cityName'] = cityName;
    data['DistrictName'] = districtName;
    data['AreaName'] = areaName;
    data['StateId'] = stateId;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistrationData &&
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
