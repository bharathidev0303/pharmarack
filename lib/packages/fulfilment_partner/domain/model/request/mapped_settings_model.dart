import 'package:pharmarack/packages/fulfilment_partner/data/model/mapped_settings_entity.dart';

class MappedSettingsModel {
  List<MappedSettingPartners>? mappedPartnerList;

  MappedSettingsModel({
    this.mappedPartnerList,
  });

  MappedSettingsModel copyWith({
    List<MappedSettingPartners>? mappedFulfillmentPartnerList,
  }) {
    return MappedSettingsModel(
      mappedPartnerList: mappedFulfillmentPartnerList ?? mappedPartnerList,
    );
  }
}

class MappedSettingPartners {
  dynamic fPlist;

  int? retailerId;

  int? fulfillmentPartnerId;

  String? fulfillmentPartnerName;

  String? city;

  String? mobileNumber;

  String? address2;

  bool? isShowViewOrder;

  bool? isShowPlaceOrder;

  bool? isShowLogistics;

  bool? isShowPurchesReturn;

  bool? isShowOutstanding;

  dynamic regionName;

  dynamic regions;

  dynamic enabledSettings;

  dynamic dataforController;

  dynamic fPSelectList;

  bool isSelected;

  MappedSettingPartners({
    this.fPlist,
    this.retailerId,
    this.fulfillmentPartnerId,
    this.fulfillmentPartnerName,
    this.city,
    this.mobileNumber,
    this.address2,
    this.isShowViewOrder,
    this.isShowPlaceOrder,
    this.isShowLogistics,
    this.isShowPurchesReturn,
    this.isShowOutstanding,
    this.regionName,
    this.regions,
    this.enabledSettings,
    this.dataforController,
    this.fPSelectList,
    this.isSelected = false,
  });

  factory MappedSettingPartners.fromMappedPartnerList(
      MappedFulfillmentPartnerList mappedFulfillmentPartnerList) {
    return MappedSettingPartners(
      fPlist: mappedFulfillmentPartnerList.fPlist,
      retailerId: mappedFulfillmentPartnerList.retailerId,
      fulfillmentPartnerId: mappedFulfillmentPartnerList.fulfillmentPartnerId,
      fulfillmentPartnerName:
          mappedFulfillmentPartnerList.fulfillmentPartnerName,
      city: mappedFulfillmentPartnerList.city,
      mobileNumber: mappedFulfillmentPartnerList.mobileNumber,
      address2: mappedFulfillmentPartnerList.address2,
      isShowViewOrder: mappedFulfillmentPartnerList.isShowViewOrder,
      isShowPlaceOrder: mappedFulfillmentPartnerList.isShowPlaceOrder,
      isShowLogistics: mappedFulfillmentPartnerList.isShowLogistics,
      isShowPurchesReturn: mappedFulfillmentPartnerList.isShowPurchesReturn,
      isShowOutstanding: mappedFulfillmentPartnerList.isShowOutstanding,
      regionName: mappedFulfillmentPartnerList.regionName,
      regions: mappedFulfillmentPartnerList.regions,
      enabledSettings: mappedFulfillmentPartnerList.enabledSettings,
      dataforController: mappedFulfillmentPartnerList.dataforController,
      fPSelectList: mappedFulfillmentPartnerList.fPSelectList,
      isSelected: false,
    );
  }

  MappedSettingPartners copyWith({
    dynamic fPlist,
    int? retailerId,
    int? fulfillmentPartnerId,
    String? fulfillmentPartnerName,
    String? city,
    String? mobileNumber,
    String? address2,
    bool? isShowViewOrder,
    bool? isShowPlaceOrder,
    bool? isShowLogistics,
    bool? isShowPurchesReturn,
    bool? isShowOutstanding,
    dynamic regionName,
    dynamic regions,
    dynamic enabledSettings,
    dynamic dataforController,
    dynamic fPSelectList,
    bool? isSelected,
  }) {
    return MappedSettingPartners(
      fPlist: fPlist ?? this.fPlist,
      retailerId: retailerId ?? this.retailerId,
      fulfillmentPartnerId: fulfillmentPartnerId ?? this.fulfillmentPartnerId,
      fulfillmentPartnerName:
          fulfillmentPartnerName ?? this.fulfillmentPartnerName,
      city: city ?? this.city,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      address2: address2 ?? this.address2,
      isShowViewOrder: isShowViewOrder ?? this.isShowViewOrder,
      isShowPlaceOrder: isShowPlaceOrder ?? this.isShowPlaceOrder,
      isShowLogistics: isShowLogistics ?? this.isShowLogistics,
      isShowPurchesReturn: isShowPurchesReturn ?? this.isShowPurchesReturn,
      isShowOutstanding: isShowOutstanding ?? this.isShowOutstanding,
      regionName: regionName ?? this.regionName,
      regions: regions ?? this.regions,
      enabledSettings: enabledSettings ?? this.enabledSettings,
      dataforController: dataforController ?? this.dataforController,
      fPSelectList: fPSelectList ?? this.fPSelectList,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
