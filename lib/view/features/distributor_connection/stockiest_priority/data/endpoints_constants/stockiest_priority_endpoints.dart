/// This class [StockiestPriorityEndpoints] is used to contain all Api
/// endpoint related to [stockiest_priority] feature.
class StockiestPriorityEndpoints {
  static const String stockiestDistributors =
      "/order/api/v1/GetSetDistributorPriorities";

  static const String pathNonMappedStoreStatus =
      '/user/api/v1/NonmappedStoresStatus';

  static const String saveDistributorPriorities =
      "/order/api/v1/SaveSetDistributorPriorities";

  static const String pathStoreMappingRequest =
      '/user/api/v1/SaveRetailerMultipleStoreMappingRequest';

  static const String orderDistributorList = '/order/api/v1/getDistributorList';
}
