// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_api_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderApiRequest _$PlaceOrderApiRequestFromJson(
        Map<String, dynamic> json) =>
    PlaceOrderApiRequest(
      storeId: json['storeId'] as int,
      orderDeliveryModeText: json['OrderDeliveryModeText'] as String,
      orderRemarksText: json['OrderRemarksText'] as String,
      deliveryPerson: json['DeliveryPerson'] as String,
      deliveryPersonCode: json['DeliveryPersonCode'] as String,
      orderSource: json['OrderSource'] as String,
      sKipAndContinue: json['SKipAndContinue'] as int,
      orderPlacedBy: json['OrderPlacedBy'] as int,
      latitude: json['Latitude'] as String,
      longitude: json['Longitude'] as String,
      browserName: json['BrowserName'] as String,
      version: json['Version'] as String,
      os: json['OS'] as String,
      macAddress: json['MacAddress'] as String,
      ipAddress: json['IpAddress'] as String,
      storeWiseAmount: (json['StoreWiseAmount'] as num).toDouble(),
      gstAmount: (json['GSTAmount'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlaceOrderApiRequestToJson(
        PlaceOrderApiRequest instance) =>
    <String, dynamic>{
      'storeId': instance.storeId,
      'OrderDeliveryModeText': instance.orderDeliveryModeText,
      'OrderRemarksText': instance.orderRemarksText,
      'DeliveryPerson': instance.deliveryPerson,
      'DeliveryPersonCode': instance.deliveryPersonCode,
      'OrderSource': instance.orderSource,
      'SKipAndContinue': instance.sKipAndContinue,
      'OrderPlacedBy': instance.orderPlacedBy,
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
      'BrowserName': instance.browserName,
      'Version': instance.version,
      'OS': instance.os,
      'MacAddress': instance.macAddress,
      'IpAddress': instance.ipAddress,
      'StoreWiseAmount': instance.storeWiseAmount,
      'GSTAmount': instance.gstAmount,
      'items': instance.items,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      ptr: (json['PTR'] as num).toDouble(),
      productName: json['ProductName'] as String,
      productCode: json['ProductCode'] as String,
      quantity: json['Quantity'] as int,
      free: json['Free'] as int,
      scheme: json['Scheme'] as String,
      schemeType: json['SchemeType'] as String,
      hiddenPtr: (json['HiddenPTR'] as num).toDouble(),
      netRate: (json['NetRate'] as num).toDouble(),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'PTR': instance.ptr,
      'ProductName': instance.productName,
      'ProductCode': instance.productCode,
      'Quantity': instance.quantity,
      'Free': instance.free,
      'Scheme': instance.scheme,
      'SchemeType': instance.schemeType,
      'HiddenPTR': instance.hiddenPtr,
      'NetRate': instance.netRate,
    };
