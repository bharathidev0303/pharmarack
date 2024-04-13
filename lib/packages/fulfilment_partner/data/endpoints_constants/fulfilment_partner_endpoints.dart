/// This class [FulfilmentPartnerEndpoints] is used to contain all Api
/// endpoint related to [fulfilment_partner] feature.
class FulfilmentPartnerEndpoints {
  static const String fulfillmentRequest =
      "/admin/api/GetFulfillmentPartnersforApproval";
  static const String approvalRejectMappingRequest =
      "/admin/api/ApproveRejectMappingRequest";
  static const String mappedSettingsRequest =
      "/admin/api/FulfillmentPartnerSettings";

  static const String saveFulfillmentPartnerSettings =
      "/admin/api/SaveFulfillmentPartnerSettings";
}
