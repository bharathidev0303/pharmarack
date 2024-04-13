import 'package:json_annotation/json_annotation.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';

part 'place_order_api_request.g.dart';

@JsonSerializable()
class PlaceOrderApiRequest extends Params {
  @JsonKey(name: "storeId")
  int storeId;
  @JsonKey(name: "OrderDeliveryModeText")
  String orderDeliveryModeText;
  @JsonKey(name: "OrderRemarksText")
  String orderRemarksText;
  @JsonKey(name: "DeliveryPerson")
  String deliveryPerson;
  @JsonKey(name: "DeliveryPersonCode")
  String deliveryPersonCode;
  @JsonKey(name: "OrderSource")
  String orderSource;
  @JsonKey(name: "SKipAndContinue")
  int sKipAndContinue;
  @JsonKey(name: "OrderPlacedBy")
  int orderPlacedBy;
  @JsonKey(name: "Latitude")
  String latitude;
  @JsonKey(name: "Longitude")
  String longitude;
  @JsonKey(name: "BrowserName")
  String browserName;
  @JsonKey(name: "Version")
  String version;
  @JsonKey(name: "OS")
  String os;
  @JsonKey(name: "MacAddress")
  String macAddress;
  @JsonKey(name: "IpAddress")
  String ipAddress;
  @JsonKey(name: "StoreWiseAmount")
  double storeWiseAmount;
  @JsonKey(name: "GSTAmount")
  double gstAmount;
  @JsonKey(name: "items")
  List<Item> items;

  PlaceOrderApiRequest({
    required this.storeId,
    required this.orderDeliveryModeText,
    required this.orderRemarksText,
    required this.deliveryPerson,
    required this.deliveryPersonCode,
    required this.orderSource,
    required this.sKipAndContinue,
    required this.orderPlacedBy,
    required this.latitude,
    required this.longitude,
    required this.browserName,
    required this.version,
    required this.os,
    required this.macAddress,
    required this.ipAddress,
    required this.storeWiseAmount,
    required this.gstAmount,
    required this.items,
  });

  factory PlaceOrderApiRequest.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderApiRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOrderApiRequestToJson(this);
}

@JsonSerializable()
class Item {
  @JsonKey(name: "PTR")
  double ptr;
  @JsonKey(name: "ProductName")
  String productName;
  @JsonKey(name: "ProductCode")
  String productCode;
  @JsonKey(name: "Quantity")
  int quantity;
  @JsonKey(name: "Free")
  int free;
  @JsonKey(name: "Scheme")
  String scheme;
  @JsonKey(name: "SchemeType")
  String schemeType;
  @JsonKey(name: "HiddenPTR")
  double hiddenPtr;
  @JsonKey(name: "NetRate")
  double netRate;

  Item({
    required this.ptr,
    required this.productName,
    required this.productCode,
    required this.quantity,
    required this.free,
    required this.scheme,
    required this.schemeType,
    required this.hiddenPtr,
    required this.netRate,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
