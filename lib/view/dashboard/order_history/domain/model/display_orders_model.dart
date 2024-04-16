

import 'package:pharmarack/packages/core/util/date_util.dart';
import 'package:pharmarack/view/dashboard/order_history/data/model/display_order.dart';

class DisplayOrder {
  double orderId;
  String partyName;
  String storeName;
  String orderNo;
  String orderDate;
  double orderAmount;
  String createdByName;
  String remarks;
  String isProcessed;
  String isUploaded;
  String isPlaced;
  String processedDate;
  String? mobileNumber;
  String? encryptedOrderId;
  int successfulItems = 0;
  int orderedQuantity = 0;
  double rating = 0;
  String invoiceLink = "";
  Map<int, List<String>> products = {};
  String orderStatus;
  int? isMapStore;
  String? storeId;

  DisplayOrder(
    this.orderId,
    this.partyName,
    this.storeName,
    this.orderNo,
    this.orderDate,
    this.orderAmount,
    this.createdByName,
    this.remarks,
    this.isProcessed,
    this.isPlaced,
    this.isUploaded,
    this.processedDate,
    this.mobileNumber,
    this.encryptedOrderId, {
    this.successfulItems = 0,
    this.orderedQuantity = 0,
    this.rating = 0.0,
    this.invoiceLink = "",
    this.products = const {},
    this.orderStatus = "",
    this.isMapStore,
    this.storeId = "",
  });

  static Map<int, List<String>> groupProducts(List<String> value) {
    final Map<int, List<String>> map = {};
    int i = 1;
    while (value.isNotEmpty) {
      final v = value.take(3).toList();
      value.removeRange(0, v.length);

      map.update(i, (value) => value, ifAbsent: () => v);
      ++i;
    }
    return map;
  }

  factory DisplayOrder.fromDisplayOrderEntity(
      DisplayOrderEntity displayOrderEntity) {
    return DisplayOrder(
      displayOrderEntity.orderId ?? 0.0,
      displayOrderEntity.partyName ?? "",
      displayOrderEntity.storeName ?? "",
      displayOrderEntity.orderNo ?? "",
      DateFormatUtils.formatDate(displayOrderEntity.orderDate),
      double.parse(displayOrderEntity.orderAmount ?? "0.0"),
      displayOrderEntity.createdByName ?? "",
      displayOrderEntity.remarks ?? "",
      displayOrderEntity.isProcessed ?? "",
      displayOrderEntity.isPlaced ?? "",
      displayOrderEntity.isUploaded ?? "",
      displayOrderEntity.processedDate ?? "",
      displayOrderEntity.mobileNumber ?? "",
      displayOrderEntity.encryptedOrderId ?? "",
      successfulItems: displayOrderEntity.deliveredQuantity ?? 0,
      orderedQuantity: displayOrderEntity.orderedQuantity ?? 0,
      rating: double.parse(displayOrderEntity.rating.toString()),
      invoiceLink: displayOrderEntity.invoiceurl ?? "",
      products: groupProducts(displayOrderEntity.productList ?? []),
      orderStatus: displayOrderEntity.orderStatus ?? "",
      isMapStore: displayOrderEntity.isMapStore,
      storeId: displayOrderEntity.storeId?.toString() ?? "",
    );
  }

  DisplayOrder copyWith({
    double? orderId,
    String? partyName,
    String? storeName,
    String? orderNo,
    String? orderDate,
    double? orderAmount,
    String? createdByName,
    String? remarks,
    String? isProcessed,
    String? isUploaded,
    String? isPlaced,
    String? processedDate,
    String? mobileNumber,
    String? encryptedOrderId,
    int? successfulItems,
    int? orderedQuantity,
    double? rating,
    String? invoiceLink,
    Map<int, List<String>>? products,
    String? orderStatus,
    int? isMapStore,
    String? storeId,
  }) {
    return DisplayOrder(
      orderId ?? this.orderId,
      partyName ?? this.partyName,
      storeName ?? this.storeName,
      orderNo ?? this.orderNo,
      orderDate ?? this.orderDate,
      orderAmount ?? this.orderAmount,
      createdByName ?? this.createdByName,
      remarks ?? this.remarks,
      isProcessed ?? this.isProcessed,
      processedDate ?? this.processedDate,
      isUploaded ?? this.isUploaded,
      isPlaced ?? this.isPlaced,
      mobileNumber ?? this.mobileNumber,
      encryptedOrderId ?? this.encryptedOrderId,
      successfulItems: successfulItems ?? this.successfulItems,
      orderedQuantity: orderedQuantity ?? this.orderedQuantity,
      rating: rating ?? this.rating,
      invoiceLink: invoiceLink ?? this.invoiceLink,
      products: products ?? this.products,
      orderStatus: orderStatus ?? this.orderStatus,
      isMapStore: isMapStore ?? this.isMapStore,
      storeId: storeId ?? this.storeId,
    );
  }
}
