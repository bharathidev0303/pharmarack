import 'package:flutter/material.dart';
import 'package:flyy_flutter_plugin/flyy_flutter_plugin.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/feedback/presentation/pages/feedback_request_dialog.dart';
import 'package:pharmarack/main/main_common.dart';
// import 'package:pharmarack/main/connectivity/no_internet_page.dart';
// import 'package:pharmarack/main/connectivity/no_internet_page.dart';
// import 'package:pharmarack/main/main_common.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/view/dashboard/cart/presentation/pages/cart_detail_page.dart';
import 'package:pharmarack/view/dashboard/cart/presentation/pages/place_order_successful_page.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/pages/order_history_details/order_details_page.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/pages/order_history_page.dart';
import 'package:pharmarack/view/dashboard_tile/rapl.dart';
import 'package:pharmarack/view/features/distributor_connection/presentation/widget/distributor_connection_page.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/cms_page_navigator_model.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/pageConfigModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/dashboard_screen/dashboard_screen_page.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/top_widget_view_more_page/top_widgets_view_more_page.dart';
import 'package:pharmarack/view/features/landing_page/landing_page.dart';
import 'package:pharmarack/view/features/offers_and_rewards/presentation/rewards_page.dart';
import 'package:pharmarack/view/features/profile/presentation/pages/edit_profile_screen.dart';
import 'package:pharmarack/view/features/profile/presentation/pages/profile_page.dart';
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
  static Route<dynamic> generateRoute(RouteSettings settings, bool isLoggedIn,
      bool isResetPasswordAvailable, int cubitIndex, bool network) {
    if (cubitIndex == 2) {
      return MaterialPageRoute(builder: (context) => const NoInternetPage());
    } else if ((cubitIndex == 2 || cubitIndex == 0) && !network) {
      return MaterialPageRoute(builder: (context) => const NoInternetPage());
    } else {
      switch (settings.name) {
        case RoutePaths.loginScreen:
          return MaterialPageRoute(
              builder: (context) => const LoginScreen(),
              settings: const RouteSettings(name: RoutePaths.loginScreen));
        case RoutePaths.landingPage:
          return MaterialPageRoute(builder: (context) => const LandingPage());
        case RoutePaths.homeScreen:
          if (cubitIndex != 2) {
            if (isLoggedIn) {
              return MaterialPageRoute(
                  builder: (context) => const LandingPage(),
                  settings:
                      const RouteSettings(name: RoutePaths.dashBoardScreen));
            } else if (isResetPasswordAvailable) {
              return MaterialPageRoute(
                  builder: (context) => const ResetPasswordScreen(),
                  settings: const RouteSettings(
                      name: RoutePaths.resetPasswordScreen));
            } else {
              return MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                  settings: const RouteSettings(name: RoutePaths.loginScreen));
            }
          } else {
            return MaterialPageRoute(
                builder: (context) => const NoInternetPage());
          }
        case RoutePaths.dashBoardScreen:
          return MaterialPageRoute(
            builder: (context) => const LandingPage(),
            settings: const RouteSettings(name: RoutePaths.dashBoardScreen),
          );
        case RoutePaths.noInternet:
          return MaterialPageRoute(
            builder: (context) => const NoInternetPage(),
          );
        case RoutePaths.profileScreen:
          return MaterialPageRoute(
            builder: (context) => const ProfilePage(),
          );
        case RoutePaths.distributorConnection:
          return MaterialPageRoute(
            builder: (context) => const DistributorConnectionPage(),
            settings: settings,
          );
        // case RoutePaths.fulfilmentPartner:
        //   return MaterialPageRoute(
        //     builder: (context) => const FulfilmentPartnerPage("retailer"),
        //     settings: const RouteSettings(name: RoutePaths.fulfilmentPartner),
        //   );
        case RoutePaths.forgotPasswordOtpScreen:
          return MaterialPageRoute(
              builder: (context) => const ForgotPasswordOtpScreen(),
              settings: const RouteSettings(
                  name: RoutePaths.forgotPasswordOtpScreen));
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
        case RoutePaths.rewards:
          return MaterialPageRoute(
            builder: (context) => const RewardsPage(),
          );
        // case RoutePaths.termsAndConditions:
        //   return MaterialPageRoute(
        //     builder: (context) => const TermsAndConditionPage(),
        //   );
        case RoutePaths.placeOrderSuccessFulPage:
          return MaterialPageRoute(
              builder: (context) => const PlaceOrderSuccessfulPage(),
              settings: const RouteSettings(
                  name: RoutePaths.placeOrderSuccessFulPage));
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
        case RoutePaths.feedbackRequestDialogScreen:
          return MaterialPageRoute(
            builder: (context) => const FeedbackRequestDialogScreen(),
          );
        case RoutePaths.cart:
          return MaterialPageRoute(
            builder: (context) => const CartDetailPage(),
          );
        case RoutePaths.editProfilePage:
          return MaterialPageRoute(
            builder: (context) => const EditProfileScreen(),
            settings: const RouteSettings(name: RoutePaths.editProfilePage),
          );
        // //Page not found
        default:
          return MaterialPageRoute(
            builder: (context) => Container(),
          );
      }
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
      case RoutePaths.distributorConnection:
        return const DistributorConnectionPage();
      //   case RoutePaths.changePasswordDialogScreen:
      //     return const ChangePasswordDialogScreen();
      //   case RoutePaths.distributorConnection:
      //     return const DistributorConnectionPage();
      case RoutePaths.changePasswordDialogScreen:
        return const ChangePasswordDialogScreen();
      case RoutePaths.orderHistory:
        return const OrderHistoryPage();
      //   case RoutePaths.fulfilmentPartner:
      //     return const FulfilmentPartnerPage("retailer");
      case RoutePaths.feedbackRequestDialogScreen:
        return const FeedbackRequestDialogScreen();
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
    PageConfigModel pageConfigModel = PageConfigModel();
    if (getIt.isRegistered<PageConfigModel>()) {
      pageConfigModel = getIt<PageConfigModel>();
    }
    getIt.unregister<SearchContextModel>();
    if (cmsPageNavigatorModel.linkType == 'internal') {
      switch (cmsPageNavigatorModel.linkTo) {
        case '/distributorPage':
          getIt.unregister<SearchContextModel>();
          getIt.registerLazySingleton<SearchContextModel>(() =>
              SearchContextModel(
                  contextType: "Distributors",
                  storeId: cmsPageNavigatorModel.storeId ?? 0,
                  storeName: cmsPageNavigatorModel.storeName ?? ""));
          if (pageConfigModel.page == "null_search_page") {
            Navigator.push(
                cmsPageNavigatorModel.context,
                MaterialPageRoute(
                    builder: (context) => const SearchProductPage()));
          } else {
            Navigator.push(
              cmsPageNavigatorModel.context,
              MaterialPageRoute(
                  builder: (context) => const SearchProductPage()),
            );
          }
        case '/companyPage':
          getIt.unregister<SearchContextModel>();
          getIt.registerLazySingleton<SearchContextModel>(() =>
              SearchContextModel(
                  contextType: "Company",
                  companyId: cmsPageNavigatorModel.companyId ?? 0,
                  companyName: cmsPageNavigatorModel.companyName ?? ""));
          Navigator.push(
            cmsPageNavigatorModel.context,
            MaterialPageRoute(builder: (context) => const SearchProductPage()),
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
            MaterialPageRoute(builder: (context) => const SearchProductPage()),
          );
        case '/BannerProductSearch':
          if (pageConfigModel.page == "distributor_page") {
            getIt.registerLazySingleton<SearchContextModel>(() =>
                SearchContextModel(
                    contextType: "Distributors",
                    searchText: cmsPageNavigatorModel.linkToExtra,
                    storeId: pageConfigModel.storeId ?? 0,
                    storeName: pageConfigModel.storeName ?? ""));
            Navigator.push(
              cmsPageNavigatorModel.context,
              MaterialPageRoute(
                  builder: (context) => const SearchProductPage()),
            );
          } else if (pageConfigModel.page == "company_page") {
            getIt.registerLazySingleton<SearchContextModel>(() =>
                SearchContextModel(
                    contextType: "Company",
                    searchText: cmsPageNavigatorModel.linkToExtra,
                    companyId: pageConfigModel.companyId ?? 0,
                    companyName: pageConfigModel.companyName ?? ""));
            Navigator.push(
              cmsPageNavigatorModel.context,
              MaterialPageRoute(
                  builder: (context) => const SearchProductPage()),
            );
          } else {
            getIt.registerLazySingleton<SearchContextModel>(
                () => SearchContextModel(
                      contextType: "BannerProduct",
                      searchText: cmsPageNavigatorModel.linkToExtra,
                    ));
            Navigator.push(
              cmsPageNavigatorModel.context,
              MaterialPageRoute(
                  builder: (context) => const SearchProductPage()),
            );
          }
        case '/MappedDistributorsPage':
          Navigator.push(
            cmsPageNavigatorModel.context,
            MaterialPageRoute(
                builder: (context) => const DistributorConnectionPage(),
                settings: const RouteSettings(arguments: 0)),
          );
        case '/NonMappedDistributorsPage':
          Navigator.push(
            cmsPageNavigatorModel.context,
            MaterialPageRoute(
                builder: (context) => const DistributorConnectionPage(),
                settings: const RouteSettings(arguments: 1)),
          );
        case '/OrderHistoryPage':
          Navigator.push(
            cmsPageNavigatorModel.context,
            MaterialPageRoute(builder: (context) => const OrderHistoryPage()),
          );
        case '/CartDetailPage':
          Navigator.push(
            cmsPageNavigatorModel.context,
            MaterialPageRoute(builder: (context) => const CartDetailPage()),
          );
        case '/HomePage':
          Navigator.push(
            cmsPageNavigatorModel.context,
            MaterialPageRoute(
                builder: (context) => const DashboardScreenPage()),
          );
        case '/TopWidgetsViewMoreListPage':
          Navigator.push(
            cmsPageNavigatorModel.context,
            MaterialPageRoute(
                builder: (context) => const TopWidgetsViewMoreListPage()),
          );
        case '/OfferPage':
          FlyyFlutterPlugin.setThemeColor("#1439BB", "#1439BB");
          FlyyFlutterPlugin.setFlyyUser(
              getIt<RetailerInfoEntity>().userId.toString());
          FlyyFlutterPlugin.openFlyyOffersPage();
        case '/RewardsPage':
          Navigator.push(
            cmsPageNavigatorModel.context,
            MaterialPageRoute(builder: (context) => const RewardsPage()),
          );
        case '/RaplPage':
          Navigator.push(
            cmsPageNavigatorModel.context,
            MaterialPageRoute(builder: (context) => Rapl()),
          );
        default:
          debugPrint("linkToNotFount ${cmsPageNavigatorModel.linkTo}");
      }
    }
  }
}
