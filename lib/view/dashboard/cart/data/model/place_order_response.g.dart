// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrderResponse _$PlaceOrderResponseFromJson(Map<String, dynamic> json) =>
    PlaceOrderResponse(
      statusCode: json['StatusCode'] as int,
      message: json['Message'] as String,
      iList: json['IList'] as String,
      displayStoreOrder: (json['DisplayStoreOrder'] as List<dynamic>)
          .map((e) => DisplayStoreOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlaceOrderResponseToJson(PlaceOrderResponse instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'Message': instance.message,
      'IList': instance.iList,
      'DisplayStoreOrder': instance.displayStoreOrder,
    };

DisplayStoreOrder _$DisplayStoreOrderFromJson(Map<String, dynamic> json) =>
    DisplayStoreOrder(
      storeId: json['StoreId'] as int,
      orderId: json['OrderId'] as String,
      orderNo: json['OrderNo'] as String,
      lineItemCount: json['lineitemcount'] as int,
      orderDeliveryModeText: json['OrderDeliveryModeText'] as String,
      priority: json['Priority'],
      storeWiseAmount: (json['StoreWiseAmount'] as num).toDouble(),
      mpToken: json['MPToken'] as String,
    );

Map<String, dynamic> _$DisplayStoreOrderToJson(DisplayStoreOrder instance) =>
    <String, dynamic>{
      'StoreId': instance.storeId,
      'OrderId': instance.orderId,
      'OrderNo': instance.orderNo,
      'lineitemcount': instance.lineItemCount,
      'OrderDeliveryModeText': instance.orderDeliveryModeText,
      'Priority': instance.priority,
      'StoreWiseAmount': instance.storeWiseAmount,
      'MPToken': instance.mpToken,
    };
