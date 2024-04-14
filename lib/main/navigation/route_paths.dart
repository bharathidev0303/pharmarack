import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation_legacy/model/legacy_menu.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/drawer_router_paths.dart';
import 'package:pharmarack/packages/core_flutter/navigation/core_route_path.dart';
import 'package:pharmarack/view/features/profile/presentation/constants/my_profile_constants.dart';

class RoutePaths implements DrawerRouterPaths, CoreRoutePaths {
  static const String splash = '/splash';
  static const String onBoarding = '/onBoarding';
  static const String feedbackRequestDialogScreen =
      "/feedbackRequestDialogScreen";
  static const String distributorSearchDetail = "/distributorSearchDetail";
  static const String dashBoardScreen = "/dashboardScreen";
  static const String profileScreen = "/profileScreen";
  static const String searchProduct = "/searchProduct";
  static const String getBouncedOrdersScreen = "/getBouncedOrdersScreen";
  static const String loginScreen = "/login";
  static const String byDistributor = "/byDistributor";
  static const String resetPasswordScreen = "/changePasswordScreen";
  static const String homeScreen = "/";
  static const String landingPage = "/landingPage";
  static const String byRate = "/byRate";
  static const String cashbackDeals = "/cashbackDeals";
  static const String cartDraft = "/cart";
  static const String bounced = "/bounced";
  static const String fulfilmentPartner = "/fulfillmentPartner";
  static const String mapping = "/mapping";
  static const String forgotPasswordScreen = "/forgotPasswordScreen";
  static const String forgotPasswordOtpScreen = "/forgotPasswordOtpScreen";
  static const String deleteAccountOtpScreen = "/deleteAccountOtpScreen";
  static const String distributorConnection = "/distributorConnection";
  static const String settings = "/settings";
  static const String viewBouncedOrderDetails = "/viewBouncedOrderDetails";
  static const String onBoardingOtp = '/onBoardingOtp';
  static const String cart = "/cart";
  static const String orderHistory = "/orderHistory";
  static const String retailerRegistration = "/newRetailerRegistration";
  static const String eMailUs = "/eMailUs";
  static const String callUs = "/callUs";
  static const String privacyPolicy = "/privacyPolicy";
  static const String changePasswordDialogScreen =
      "/changePasswordDialogScreen";
  static const String notifications = "/notifications";
  static const String orderHistoryDetail = "/orderHistoryDetail";
  static const String retailerRegistrationStepOne =
      "/retailerRegistrationStepOne";
  static const String retailerRegistrationStepTwo =
      "/retailerRegistrationStepTwo";
  static const String retailerRegistrationStepThree =
      "/retailerRegistrationStepThree";
  static const String rewards = "/rewards";
  static const String termsAndConditions = "/termsAndConditions";
  static const String placeOrderSuccessFulPage = "/placeOrderSuccessFulPage";
  static const String operationsPage = "/operationsPage";
  static const String companyPage = "/companyPage";
  static const String browseCompaniesPage = "/browseCompaniesPage";
  static const String bannerPage = "/bannerPage";

  @override
  String getMyConnectionsDistributors() {
    return distributorConnection;
  }

  @override
  String getMyConnectionsFulfillmentPartners() {
    return fulfilmentPartner;
  }

  @override
  String getOrderNowBestRate() {
    return byRate;
  }

  @override
  String getOrderNowBounced() {
    return getBouncedOrdersScreen;
  }

  @override
  String getOrderNowBouncedDetails() {
    return viewBouncedOrderDetails;
  }

  @override
  String getOrderNowByDistributor() {
    return dashBoardScreen;
  }

  @override
  String getOrderNowByProduct() {
    return searchProduct;
  }

  @override
  String getOrderNowCart() {
    return cartDraft;
  }

  @override
  String getOrderNowCashbackDeals() {
    return cashbackDeals;
  }

  @override
  String getOrderNowDealsOfTheDay() {
    return "";
  }

  @override
  String getOrderNowMyInvoice() {
    return "";
  }

  @override
  String getOrderHistoryPath() {
    return orderHistory;
  }

  @override
  String getOrderNowStockistPriority() {
    return "";
  }

  @override
  String getOtherFeaturesMyDeliveries() {
    return "";
  }

  @override
  String getOtherFeaturesPurchaseReturn() {
    return "";
  }

  @override
  String getOtherFeaturesTrackDelivery() {
    return "";
  }

  @override
  String getOtherFeaturesCart() {
    return cart;
  }

  @override
  String getPaymentsEcheque() {
    return "";
  }

  @override
  String getPaymentsHistory() {
    return "";
  }

  @override
  String getPaymentsLoan() {
    return "";
  }

  @override
  String getPaymentsOutstandings() {
    return "";
  }

  @override
  String getPaymentsScheduled() {
    return "";
  }

  @override
  String getProductSearchByCompany() {
    return "";
  }

  @override
  String getProductSearchByDistributor() {
    return "";
  }

  @override
  String getProductSearchByGeneric() {
    return "";
  }

  @override
  String getProductSearchByProduct() {
    return "";
  }

  @override
  String getRewardsCashbackDeals() {
    return "";
  }

  @override
  String getRewardsLoyaltyPrograms() {
    return "";
  }

  @override
  String getEmailUs() {
    return eMailUs;
  }

  @override
  String getCallUs() {
    return callUs;
  }

  @override
  String getPrivacyPolicy() {
    return privacyPolicy;
  }

  @override
  String getChangePassword() => changePasswordDialogScreen;

  @override
  List<LegacyMenu> getLegacyMenuList(BuildContext context) {
    return MyProfileConstants.getLegacySideNavigationMenu(context);
  }

  @override
  String getSearchProductPath() {
    return searchProduct;
  }

  @override
  String getLoginScreenPath() {
    return loginScreen;
  }

  @override
  String getFeedbackRequestDialogPath() {
    return feedbackRequestDialogScreen;
  }

  @override
  String getRewardsPath() {
    return rewards;
  }

  @override
  String getTermsAndConditions() {
    return termsAndConditions;
  }
}
