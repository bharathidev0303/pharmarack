import 'package:json_annotation/json_annotation.dart';

part 'place_order_response.g.dart';

@JsonSerializable()
class PlaceOrderResponse {
  @JsonKey(name: "StatusCode")
  int statusCode;
  @JsonKey(name: "Message")
  String message;
  @JsonKey(name: "IList")
  String iList;
  @JsonKey(name: "DisplayStoreOrder")
  List<DisplayStoreOrder> displayStoreOrder;

  PlaceOrderResponse({
    required this.statusCode,
    required this.message,
    required this.iList,
    required this.displayStoreOrder,
  });

  factory PlaceOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOrderResponseToJson(this);
}

@JsonSerializable()
class DisplayStoreOrder {
  @JsonKey(name: "StoreId")
  int storeId;
  @JsonKey(name: "OrderId")
  String orderId;
  @JsonKey(name: "OrderNo")
  String orderNo;
  @JsonKey(name: "lineitemcount")
  int lineItemCount;
  @JsonKey(name: "OrderDeliveryModeText")
  String orderDeliveryModeText;
  @JsonKey(name: "Priority")
  dynamic priority;
  @JsonKey(name: "StoreWiseAmount")
  double storeWiseAmount;
  @JsonKey(name: "MPToken")
  String mpToken;

  DisplayStoreOrder({
    required this.storeId,
    required this.orderId,
    required this.orderNo,
    required this.lineItemCount,
    required this.orderDeliveryModeText,
    required this.priority,
    required this.storeWiseAmount,
    required this.mpToken,
  });

  factory DisplayStoreOrder.fromJson(Map<String, dynamic> json) =>
      _$DisplayStoreOrderFromJson(json);

  Map<String, dynamic> toJson() => _$DisplayStoreOrderToJson(this);
}
