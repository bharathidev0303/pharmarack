import 'package:json_annotation/json_annotation.dart';

class DistributorsItemList {
  List<DistributorsListModel> distributors;

  DistributorsItemList({
    required this.distributors,
  });

  factory DistributorsItemList.fromJson(List<dynamic> json) {
    return DistributorsItemList(
      distributors: json
          .map((distributors) => DistributorsListModel.fromJson(distributors))
          .toList(),
    );
  }

  DistributorsItemList copyWith({
    List<DistributorsListModel>? distributors,
  }) {
    return DistributorsItemList(
      distributors: distributors ?? this.distributors,
    );
  }
}

@JsonSerializable()
class DistributorsListModel {
  @JsonKey(name: 'StoreId')
  int? storeId;
  @JsonKey(name: 'DistributorId')
  int? distributorId;
  @JsonKey(name: 'StoreName')
  String? distributorName;
  @JsonKey(name: 'StoreCode')
  String? storeCode;
  @JsonKey(name: 'CompanyId')
  String? companyId;
  @JsonKey(name: 'Address1')
  String? distributorAddress1;
  @JsonKey(name: 'Address2')
  String? distributorAddress2;
  @JsonKey(name: 'City')
  String? distributorCity;
  @JsonKey(name: 'State')
  String? distributorState;

  DistributorsListModel({
    this.storeId,
    this.distributorId,
    this.distributorName,
    this.storeCode,
    this.companyId,
    this.distributorAddress1,
    this.distributorAddress2,
    this.distributorCity,
    this.distributorState,
  });

  factory DistributorsListModel.fromJson(Map<String, dynamic> json) {
    return DistributorsListModel(
      storeId: json['StoreId'] as int?,
      distributorId: json['DistributorId'] as int?,
      distributorName: json['StoreName'] as String?,
      storeCode: json['StoreCode'] as String?,
      companyId: json['CompanyId'] as String?,
      distributorAddress1: json['Address1'] as String?,
      distributorAddress2: json['Address2'] as String?,
      distributorCity: json['City'] as String?,
      distributorState: json['State'] as String?,
    );
  }

  DistributorsListModel copyWith({
    int? storeId,
    int? distributorId,
    String? distributorName,
    String? storeCode,
    String? companyId,
    String? distributorAddress1,
    String? distributorAddress2,
    String? distributorCity,
    String? distributorState,
  }) {
    return DistributorsListModel(
      storeId: storeId ?? this.storeId,
      distributorId: distributorId ?? this.distributorId,
      distributorName: distributorName ?? this.distributorName,
      storeCode: storeCode ?? this.storeCode,
      companyId: companyId ?? this.companyId,
      distributorAddress1: distributorAddress1 ?? this.distributorAddress1,
      distributorAddress2: distributorAddress2 ?? this.distributorAddress2,
      distributorCity: distributorCity ?? this.distributorCity,
      distributorState: distributorState ?? this.distributorState,
    );
  }
}
