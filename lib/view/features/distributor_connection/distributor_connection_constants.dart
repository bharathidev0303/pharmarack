abstract class DistributorConnectionConstants {
  // API paths
  static const String pathNonmappedStoreStatus =
      '/user/api/v1/NonmappedStoresStatus';

  static const String pathStoreMappingRequest =
      '/user/api/v1/SaveRetailerMultipleStoreMappingRequest';

  static const String saveRetailerStoreRequest =
      '/user/api/v1/SaveRetailerStoreRequest';

  static const String saveReferralRequest = '/user/api/v1/saveReferral';

  // API params
  static const String paramRetailerId = 'rid';
  static const String paramUserId = 'uid';

  // API errors
  static const String errorMappingLimitExceeded =
      'mapping request limit exceeded';

  // status
  static const String statusPending = 'Pending';
}
