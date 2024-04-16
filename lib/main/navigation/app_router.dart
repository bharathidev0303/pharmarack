// import 'package:feedback/presentation/pages/feedback_request_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:fulfilment_partner/presentation/pages/fulfilment_partner_page/fulfilment_partner_page.dart';
// import 'package:fulfilment_partner/presentation/pages/mapping_page/mapping_page.dart';
// import 'package:fulfilment_partner/presentation/pages/settings_page/settings_page.dart';
// import 'package:onboarding/presentation/pages/forgot_password/forgot_password_screen.dart';
// import 'package:onboarding/presentation/pages/forgot_password/otp_screen/forgot_password_otp_screen.dart';
// import 'package:onboarding/presentation/pages/forgot_password/reset_password/reset_password_screen.dart';
// import 'package:onboarding/presentation/pages/login_screen.dart';
// import 'package:onboarding/presentation/pages/otp_auth/delete_account_otp_screen.dart';
// import 'package:onboarding/presentation/pages/otp_auth/otp_screen.dart';
// import 'package:onboarding/presentation/pages/retailer_registration/landing_page/retailer_registration_landing_screen.dart';
// import 'package:onboarding/presentation/pages/retailer_registration/step_one_page/registration_step_one_screen.dart';
// import 'package:onboarding/presentation/pages/retailer_registration/step_three_page/registration_step_three_screen.dart';
// import 'package:onboarding/presentation/pages/retailer_registration/step_two_page/registration_step_two_screen.dart';
// import 'package:onboarding/presentation/pages/ops_screen/operations_page.dart';
// import 'package:retailer/features/bounced_orders/presentation/pages/get_bounced_orders_page.dart';
// import 'package:retailer/features/browse_companies/presentation/pages/browse_companies_page.dart';
// import 'package:retailer/features/distributor_connection/presentation/widget/distributor_connection_page.dart';
// import 'package:retailer/features/dynamic_widgets/BannerPage.dart';
// import 'package:retailer/features/landing_page/landing_page.dart';
// import 'package:retailer/features/offers_and_rewards/presentation/rewards_page.dart';
// import 'package:retailer/features/order_history/presentation/pages/order_history_details/order_details_page.dart';
// import 'package:retailer/features/order_history/presentation/pages/order_history_page.dart';
// import 'package:retailer/features/profile/presentation/pages/profile_page.dart';
// import 'package:retailer/features/search_product/presentation/pages/search_product_page.dart';
// import 'package:retailer/main/navigation/route_paths.dart';

// import '../../features/bounced_orders/presentation/pages/view_bounced_order_details_page.dart';
// import '../../features/cart/presentation/pages/place_order_successful_page.dart';
// import '../../features/dynamic_widgets/presentation/pages/company_page/company_screen_page.dart';
// import '../../features/notifications/presentation/widget/notifications_screen.dart';
// import '../../features/terms_and_conditions/presentation/pages/privacy_policy_page.dart';
// import '../../features/terms_and_conditions/presentation/pages/terms_and_condition_page.dart';

import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/view/dashboard/cart/presentation/pages/place_order_successful_page.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/pages/order_history_details/order_details_page.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/pages/order_history_page.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/cms_page_navigator_model.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/pageConfigModel.dart';
import 'package:pharmarack/view/features/landing_page/landing_page.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_context_model.dart';
import 'package:pharmarack/view/features/search_product/presentation/pages/search_product_page.dart';
import 'package:pharmarack/view/features/search_product/presentation/pages/widgets/search_product_company_page.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/change_password_dialog_screen.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/forgot_password/forgot_password_screen.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/forgot_password/otp_screen/forgot_password_otp_screen.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/forgot_password/reset_password/reset_password_screen.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/login_screen.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/ops_screen/operations_page.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/otp_auth/delete_account_otp_screen.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/otp_auth/otp_screen.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/retailer_registration/landing_page/retailer_registration_landing_screen.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/retailer_registration/step_one_page/registration_step_one_screen.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/retailer_registration/step_three_page/registration_step_three_screen.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/retailer_registration/step_two_page/registration_step_two_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(
      RouteSettings settings, bool isLoggedIn, bool isResetPasswordAvailable) {
    switch (settings.name) {
      case RoutePaths.loginScreen:
        return MaterialPageRoute(
            builder: (context) => const LoginScreen(),
            settings: const RouteSettings(name: RoutePaths.loginScreen));
      case RoutePaths.landingPage:
        return MaterialPageRoute(builder: (context) => const LandingPage());
      case RoutePaths.homeScreen:
        if (isLoggedIn) {
          return MaterialPageRoute(
              builder: (context) => const LandingPage(),
              settings: const RouteSettings(name: RoutePaths.dashBoardScreen));
        } else if (isResetPasswordAvailable) {
          return MaterialPageRoute(
              builder: (context) => const ResetPasswordScreen(),
              settings:
                  const RouteSettings(name: RoutePaths.resetPasswordScreen));
        } else {
          return MaterialPageRoute(
              builder: (context) => const LoginScreen(),
              settings: const RouteSettings(name: RoutePaths.loginScreen));
        }
      case RoutePaths.dashBoardScreen:
        return MaterialPageRoute(
          builder: (context) => const LandingPage(),
          settings: const RouteSettings(name: RoutePaths.dashBoardScreen),
        );
      // case RoutePaths.profileScreen:
      //   return MaterialPageRoute(
      //     builder: (context) => const ProfilePage(),
      //   );
      // case RoutePaths.fulfilmentPartner:
      //   return MaterialPageRoute(
      //     builder: (context) => const FulfilmentPartnerPage("retailer"),
      //     settings: const RouteSettings(name: RoutePaths.fulfilmentPartner),
      //   );
      case RoutePaths.forgotPasswordOtpScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordOtpScreen(),
            settings:
                const RouteSettings(name: RoutePaths.forgotPasswordOtpScreen));
      case RoutePaths.deleteAccountOtpScreen:
        return MaterialPageRoute(
            builder: (context) => const DeleteAccountOtpScreen(),
            settings:
                const RouteSettings(name: RoutePaths.deleteAccountOtpScreen));
      case RoutePaths.onBoardingOtp:
        return MaterialPageRoute(builder: (context) => const OtpScreen());
      case RoutePaths.resetPasswordScreen:
        return MaterialPageRoute(
            builder: (context) => const ResetPasswordScreen(),
            settings:
                const RouteSettings(name: RoutePaths.resetPasswordScreen));
      case RoutePaths.orderHistory:
        return MaterialPageRoute(
            builder: (context) => const OrderHistoryPage());
      case RoutePaths.forgotPasswordScreen:
        return MaterialPageRoute(
            builder: (context) => const ForgotPasswordScreen(),
            settings:
                const RouteSettings(name: RoutePaths.forgotPasswordScreen));
      // case RoutePaths.mapping:
      //   return MaterialPageRoute(
      //     builder: (context) => const MappingPage(),
      //     settings: const RouteSettings(name: RoutePaths.mapping),
      //   );
      // case RoutePaths.distributorConnection:
      //   return MaterialPageRoute(
      //     builder: (context) => const DistributorConnectionPage(),
      //     settings: settings,
      //   );
      // case RoutePaths.settings:
      //   return MaterialPageRoute(
      //     builder: (context) => const SettingsPage(),
      //   );

      // case RoutePaths.viewBouncedOrderDetails:
      //   return MaterialPageRoute(
      //       builder: (context) => const ViewBouncedOrderDetailsPage("orderId"));

      case RoutePaths.changePasswordDialogScreen:
        return MaterialPageRoute(
            builder: (context) => const ChangePasswordDialogScreen(),
            settings: const RouteSettings(
                name: RoutePaths.changePasswordDialogScreen));
      // case RoutePaths.notifications:
      //   return MaterialPageRoute(
      //     builder: (context) => const NotificationsScreen(),
      //   );

      case RoutePaths.orderHistoryDetail:
        return MaterialPageRoute(
          builder: (context) => const OrderDetailsPage(),
        );
      case RoutePaths.retailerRegistration:
        return MaterialPageRoute(
          builder: (context) => const RetailerRegistrationLandingScreen(),
        );
      case RoutePaths.retailerRegistrationStepOne:
        return MaterialPageRoute(
          builder: (context) => const RetailerRegistrationStepOneScreen(),
        );
      case RoutePaths.retailerRegistrationStepTwo:
        return MaterialPageRoute(
          builder: (context) => const RetailerRegistrationStepTwoScreen(),
        );
      case RoutePaths.retailerRegistrationStepThree:
        return MaterialPageRoute(
          builder: (context) => const RetailerRegistrationStepThreeScreen(),
        );
      // case RoutePaths.rewards:
      //   return MaterialPageRoute(
      //     builder: (context) => const RewardsPage(),
      //   );
      // case RoutePaths.termsAndConditions:
      //   return MaterialPageRoute(
      //     builder: (context) => const TermsAndConditionPage(),
      //   );
      case RoutePaths.placeOrderSuccessFulPage:
        return MaterialPageRoute(
            builder: (context) => const PlaceOrderSuccessfulPage(),
            settings:
                const RouteSettings(name: RoutePaths.placeOrderSuccessFulPage));
      // case RoutePaths.privacyPolicy:
      //   return MaterialPageRoute(
      //     builder: (context) => const PrivacyPolicyPage(),
      //   );
      case RoutePaths.operationsPage:
        return MaterialPageRoute(
          builder: (context) => const OperationsPage(),
        );
      case RoutePaths.searchProduct:
        return MaterialPageRoute(
          builder: (context) => const SearchProductPage(),
          settings: const RouteSettings(arguments: 0),
        );
      // case RoutePaths.browseCompaniesPage:
      //   return MaterialPageRoute(
      //     builder: (context) => const BrowseCompaniesPage(),
      //   );
      // case RoutePaths.bannerPage:
      //   return MaterialPageRoute(
      //     builder: (context) => const BannerPage(),
      //   );
      // //Page not found
      default:
        return MaterialPageRoute(
          builder: (context) => Container(),
        );
    }
  }

  static Widget getWidgetByRoute(String? routeName) {
    switch (routeName) {
      //   case RoutePaths.notifications:
      //     return const NotificationsScreen();
      case RoutePaths.searchProduct:
        return const SearchProductPage();
      //   case RoutePaths.forgotPasswordScreen:
      //     return const ForgotPasswordScreen();
      //   case RoutePaths.getBouncedOrdersScreen:
      //     return const GetBouncedOrdersPage();
      //   case RoutePaths.viewBouncedOrderDetails:
      //     return const ViewBouncedOrderDetailsPage("orderId");
      //   case RoutePaths.distributorConnection:
      //     return const DistributorConnectionPage();
      case RoutePaths.changePasswordDialogScreen:
        return const ChangePasswordDialogScreen();
      case RoutePaths.orderHistory:
        return const OrderHistoryPage();
      //   case RoutePaths.fulfilmentPartner:
      //     return const FulfilmentPartnerPage("retailer");
      //   case RoutePaths.feedbackRequestDialogScreen:
      //     return const FeedbackRequestDialogScreen();
      case RoutePaths.cashbackDeals:
        return const OrderHistoryPage();
      case RoutePaths.orderHistoryDetail:
        return const OrderDetailsPage();
      //   case RoutePaths.mapping:
      //     return const MappingPage();
      //   case RoutePaths.settings:
      //     return const SettingsPage();
      //   case RoutePaths.rewards:
      //     return const RewardsPage();
      //   case RoutePaths.termsAndConditions:
      //     return const TermsAndConditionPage();
      case RoutePaths.placeOrderSuccessFulPage:
        return const PlaceOrderSuccessfulPage();
      //   case RoutePaths.operationsPage:
      //     return const OperationsPage();
      //   case RoutePaths.companyPage:
      //     return const CompanyScreenPage();
      //   case RoutePaths.bannerPage:
      //     return const BannerPage();
      default:
        throw Exception('Invalid route: $routeName');
    }
  }

  static cmsWidgetPageNavigator(
      {required CmsPageNavigatorModel cmsPageNavigatorModel}) {
    if (cmsPageNavigatorModel.linkType == 'internal') {
      switch (cmsPageNavigatorModel.linkTo) {
        case '/distributorPage':
          getIt.unregister<SearchContextModel>();
          getIt.registerLazySingleton<SearchContextModel>(() =>
              SearchContextModel(
                  contextType: "Distributors",
                  storeId: cmsPageNavigatorModel.storeId ?? 0,
                  storeName: cmsPageNavigatorModel.storeName ?? ""));
          Navigator.push(
            cmsPageNavigatorModel.context,
            MaterialPageRoute(
                builder: (context) => const SearchProductPage(),
                settings: const RouteSettings(arguments: 0)),
          );
        case '/companyPage':
          getIt.unregister<SearchContextModel>();
          getIt.registerLazySingleton<SearchContextModel>(() =>
              SearchContextModel(
                  contextType: "Company",
                  companyId: cmsPageNavigatorModel.companyId ?? 0,
                  companyName: cmsPageNavigatorModel.companyName ?? ""));
          Navigator.push(
            cmsPageNavigatorModel.context,
            MaterialPageRoute(
                builder: (context) => const SearchProductPage(),
                settings: const RouteSettings(arguments: 0)),
          );
        case '/TheropySearch':
          PageConfigModel pageConfigModel = PageConfigModel();
          if (getIt.isRegistered<PageConfigModel>()) {
            pageConfigModel = getIt<PageConfigModel>();
          }
          getIt.unregister<SearchContextModel>();
          getIt.registerLazySingleton<SearchContextModel>(() =>
              SearchContextModel(
                  contextType: "Theropy",
                  searchText: cmsPageNavigatorModel.linkToExtra,
                  companyId: pageConfigModel.companyId ?? 0,
                  companyName: pageConfigModel.companyName ?? "",
                  storeId: pageConfigModel.storeId ?? 0,
                  storeName: pageConfigModel.storeName ?? ""));
          Navigator.push(
            cmsPageNavigatorModel.context,
            MaterialPageRoute(
                builder: (context) => const SearchProductPage(),
                settings: const RouteSettings(arguments: 0)),
          );
        default:
          debugPrint("linkToNotFount ${cmsPageNavigatorModel.linkTo}");
      }
    }
  }
}
