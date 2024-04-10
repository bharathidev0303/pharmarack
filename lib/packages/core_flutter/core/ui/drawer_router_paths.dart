import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation_legacy/model/legacy_menu.dart';

mixin DrawerRouterPaths {
  String getOrderNowByDistributor();

  String getOrderNowByProduct();

  String getOrderNowBestRate();

  String getOrderNowDealsOfTheDay();

  String getLoginScreenPath();

  String getOrderNowCashbackDeals();

  String getOrderNowCart();

  String getOrderNowBounced();

  String getOrderNowBouncedDetails();

  String getOrderHistoryPath();

  String getOrderNowMyInvoice();

  String getOrderNowStockistPriority();

  String getRewardsCashbackDeals();

  String getRewardsLoyaltyPrograms();

  String getProductSearchByProduct();

  String getProductSearchByGeneric();

  String getProductSearchByCompany();

  String getProductSearchByDistributor();

  String getPaymentsOutstandings();

  String getPaymentsHistory();

  String getPaymentsEcheque();

  String getPaymentsLoan();

  String getPaymentsScheduled();

  String getMyConnectionsDistributors();

  String getMyConnectionsFulfillmentPartners();

  String getOtherFeaturesPurchaseReturn();

  String getOtherFeaturesMyDeliveries();

  String getOtherFeaturesTrackDelivery();

  String getOtherFeaturesCart();

  String getEmailUs();

  String getCallUs();

  String getPrivacyPolicy();

  String getRewardsPath();

  String getTermsAndConditions();

  String getSearchProductPath();

  String getChangePassword();

  String getFeedbackRequestDialogPath();

  List<LegacyMenu> getLegacyMenuList(BuildContext context);
}
