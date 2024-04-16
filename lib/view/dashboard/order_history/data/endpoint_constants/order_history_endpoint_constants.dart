class OrderHistoryEndPointConstants {
  static const String legacyDisplayOrders = "/admin/api/DisplayOrders";
  static const String legacyDisplayOrderDetail =
      ":5002/admin/api/GetOrderDetailsForRetailerManager";

  static const String legacyRetailerReorder =
      ":5002/admin/api/SaveRetailerCartReOrder";

  static const String legacyDisplayOrderDetailUAT =
      "/admin/api/GetOrderDetailsForRetailerManager";

  static const String legacyRetailerReorderUAT =
      "/admin/api/SaveRetailerCartReOrder";

  /// New api end points
  static const String displayOrders = "/order/api/v1/DisplayOrders";
  static const String displayOrderDetail =
      "/order/api/v1/GetOrderDetailsForRetailerManager";
  static const String retailerReorder = '/order/api/v1/SaveRetailerCartReOrder';
  static const String allFilterApi = '/order/api/v1/GetAllOrderStatus';
  static const String orderDistributor = '/order/api/v1/getDistributorList';
}
