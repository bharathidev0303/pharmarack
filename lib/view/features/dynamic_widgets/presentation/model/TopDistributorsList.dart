import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class TopDistributorsList {
  @JsonKey(name: 'StoreId')
  int? storeId;
  @JsonKey(name: 'RetailerStorePartyId')
  int? retailerStorePartyId;
  @JsonKey(name: 'DistributorId')
  int? distributorId;
  @JsonKey(name: 'StoreName')
  String? distributorName;
  @JsonKey(name: 'StoreCode')
  String? storeCode;
  @JsonKey(name: 'CompanyId')
  String? companyId;
  @JsonKey(name: 'Address1')
  String? address1;
  @JsonKey(name: 'Address2')
  String? address2;
  @JsonKey(name: 'City')
  String? city;
  @JsonKey(name: 'Area')
  String? area;
  @JsonKey(name: 'Pincode')
  String? pinCode;
  @JsonKey(name: 'Statename')
  String? state;

  TopDistributorsList({
    this.storeId,
    this.retailerStorePartyId,
    this.distributorId,
    this.distributorName,
    this.storeCode,
    this.companyId,
    this.address1,
    this.address2,
    this.area,
    this.pinCode,
    this.city,
    this.state,
  });

  factory TopDistributorsList.fromJson(Map<String, dynamic> json) {
    return TopDistributorsList(
      storeId: json['StoreId'] as int?,
      retailerStorePartyId: json['RetailerStorePartyId'] as int?,
      distributorId: json['DistributorId'] as int?,
      distributorName: json['StoreName'] as String?,
      storeCode: json['StoreCode'] as String?,
      companyId: json['CompanyId'] as String?,
      address1: json['Address1'] as String?,
      address2: json['Address2'] as String?,
      city: json['City'] as String?,
      area: json['Area'] as String?,
      pinCode: json['Pincode'] as String?,
      state: json['Statename'] as String?,
    );
  }

  TopDistributorsList copyWith({
    int? storeId,
    int? retailerStorePartyId,
    int? distributorId,
    String? distributorName,
    String? storeCode,
    String? companyId,
    String? address1,
    String? address2,
    String? city,
    String? area,
    String? pinCode,
    String? state,
  }) {
    return TopDistributorsList(
      storeId: storeId ?? this.storeId,
      distributorId: distributorId ?? this.distributorId,
      retailerStorePartyId: retailerStorePartyId ?? this.retailerStorePartyId,
      distributorName: distributorName ?? this.distributorName,
      storeCode: storeCode ?? this.storeCode,
      companyId: companyId ?? this.companyId,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      city: city ?? this.city,
      area: area ?? this.area,
      pinCode: pinCode ?? this.pinCode,
      state: state ?? this.state,
    );
  }
}
