import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation_legacy/model/legacy_menu.dart';
import 'package:pharmarack/packages/core_flutter/constants/app_urls.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

class MyProfileConstants {
  static String loginId = '';
  static String firstName = '';
  static String lastName = '';
  static String retailerId = '';
  static String retailerName = '';
  static String address1 = '';
  static String address2 = '';
  static int regionId = 0;
  static int stateId = 0;
  static String contactPerson = '';
  static String businessType = '';
  static String businessTypeName = '';
  static String shopFirmFullName = '';
  static String userName = '';
  static String pinCode = '';
  static String city = '';
  static String state = '';
  static String emailId = '';
  static String mobileNo = '';
  static String telephone = '';
  static String drugLicenseNumber = '';
  static String drugLicenseNumber2 = '';
  static String drugLicenseNumber3 = '';
  static String gstin = '';
  static String panNumber = '';
  static String upiId = '';
  static String bankName = '';
  static String accountType = '';
  static String bankAccountNumber = '';
  static String bankAccountHolderName = '';
  static String ifsc = '';
  static String shopAddress = '';
  static List<String> imageUrl = [];
  static bool isUpiVerified = false;
  static String partyName = '';
  static String retailerNameEncoded = '';
  static String partyNameEncoded = '';
  static String address1Encoded = '';
  static String address2Encoded = '';
  static String drugLicenseNumberFilePath = '';
  static String drugLicenseNumber2FilePath = '';
  static String drugLicenseNumber3FilePath = '';
  static String drugLicenseNumberEncoded = '';
  static String drugLicenseNumber2Encoded = '';
  static String drugLicenseNumber3Encoded = '';
  static String cityEncoded = '';
  static int displayImagesLength = 0;

  static List legacyMenuList(BuildContext context) {
    return [
      {
        "name": context.localizedString.orderNowMenu,
        // "subMenu": [
        //   // {
        //   //   "name": context.localizedString.byDistributor,
        //   //   "route": RoutePaths.dashBoardScreen,
        //   //   "icon": AppAssets.png.byDistributorMenu
        //   //       .provider(),
        //   // },
        //   // {
        //   //   "name": context.localizedString.byProduct,
        //   //   "route": RoutePaths.searchProduct,
        //   //   "icon":
        //   //       AppAssets.png.byProductMenu.provider(),
        //   // },
        //   // {
        //   //   "name": context.localizedString.bestRate,
        //   //   "route": RoutePaths.byRate,
        //   //   "icon":
        //   //       AppAssets.png.byBestRateMenu.provider(),
        //   // },
        //   // {
        //   //   "name": context.localizedString.dealsOfTheDay,
        //   //   "route": RoutePaths.cashbackDeals,
        //   //   "icon": AppAssets.png.dealsOfTheDayMenu
        //   //       .provider(),
        //   // },
        //   // {
        //   //   "name": context.localizedString.cashbackDeals,
        //   //   "route": RoutePaths.cashbackDeals,
        //   //   "icon":
        //   //       AppAssets.png.hotDealsMenu.provider(),
        //   // },
        //   // {
        //   //   "name": context.localizedString.bouncedNav,
        //   //   "route": RoutePaths.getBouncedOrdersScreen,
        //   //   "icon": AppAssets.png.bouncedOrdersMenu
        //   //       .provider(),
        //   // },
        //   // {
        //   //   "name": context.localizedString.orderHistory,
        //   //   "route": RoutePaths.orderHistory,
        //   //   "icon": AppAssets.png.orderHistoryMenu
        //   //       .provider(),
        //   // },
        // ]
      },
      {
        "name": context.localizedString.rewards,
        "subMenu": [
          {
            "name": context.localizedString.cashbackDeals,
            "icon": AppAssets.png.byDistributorMenu.provider(),
          },
          {
            "name": context.localizedString.loyaltyPrograms,
            "icon": AppAssets.png.loyaltyProgramMenu.provider(),
          }
        ],
      },
      {
        "name": context.localizedString.productSearch,
        "subMenu": [
          {
            "name": context.localizedString.byProduct,
            "icon": AppAssets.png.byProductSeachMenu.provider(),
            "route": RoutePaths.searchProduct,
          },
          {
            "name": context.localizedString.byGeneric,
            "icon": AppAssets.png.byGenericSearchMeun.provider(),
          },
          {
            "name": context.localizedString.byCompany,
            "icon": AppAssets.png.byCompanySearchMenu.provider(),
          },
          {
            "name": context.localizedString.byDistributor,
            "icon": AppAssets.png.byDistributorSearchMenu.provider(),
          },
        ]
      },
      {
        "name": context.localizedString.payments,
        "subMenu": [
          {
            "name": context.localizedString.outstanding,
            "icon": AppAssets.png.outstandingsMenu.provider(),
          },
          {
            "name": context.localizedString.history,
            "icon": AppAssets.png.historyOutStandingsMenu.provider(),
          },
        ]
      },
      {
        "name": context.localizedString.myDistributors,
        // "subMenu": [
        //   // {
        //   //   "name": context.localizedString.distributors,
        //   //   "route": RoutePaths.distributorConnection,
        //   //   "icon": AppAssets.png.distributorsMenu
        //   //       .provider(),
        //   // },
        //   // {
        //   //   "name": context.localizedString.fulfilmentPartners,
        //   //   "route": RoutePaths.fulfilmentPartner,
        //   //   "icon": AppAssets.png.fulfillmentPatnersMenu
        //   //       .provider(),
        //   // },
        // ]
      },
      {
        "name": context.localizedString.otherFeatures,
        "subMenu": [
          {
            "name": context.localizedString.purchaseReturn,
            "icon": AppAssets.png.purchaseReturnMenu.provider(),
          },
          {
            "name": "Change Password",
            "icon": AppAssets.png.icChangePassword.provider(),
            "route": RoutePaths.changePasswordDialogScreen
          }
        ]
      },
      // {
      //   "name": "Email Us",
      //   "route": RoutePaths.eMailUs,
      // },
      // {
      //   "name": "Contact Us",
      //   "icon": AppAssets.png.icBrowse.provider(),
      //   "route": RoutePaths.callUs,
      // },
      {
        "name": "Terms & Conditions",
        "icon": AppAssets.png.icTermsAndConditions.provider(),
        "route": AppUrls.termsAndConditionsUrl,
      },
      {
        "name": "Privacy Policy",
        "icon": AppAssets.png.icPrivacyPolicy.provider(),
        "route": RoutePaths.privacyPolicy,
      },
      {
        "name": "Log out",
        "icon": AppAssets.png.icLogout.provider(),
        "route": RoutePaths.loginScreen,
      }
    ];
  }

  /// Dummy menu list for now add actual icons
  static List profileMenuList(BuildContext context) {
    return [
      {
        "name": context.localizedString.myOrders,
        "icon": AppAssets.png.icMyOrders.provider(),
        "route": RoutePaths.orderHistory,
        // "subMenu": [
        //   // {
        //   //   "name": context.localizedString.byDistributor,
        //   //   "route": RoutePaths.dashBoardScreen,
        //   //   "icon": AppAssets.png.byDistributorMenu
        //   //       .provider(),
        //   // },
        //   // {
        //   //   "name": context.localizedString.byProduct,
        //   //   "route": RoutePaths.searchProduct,
        //   //   "icon":
        //   //       AppAssets.png.byProductMenu.provider(),
        //   // },
        //   // {
        //   //   "name": context.localizedString.bestRate,
        //   //   "route": RoutePaths.byRate,
        //   //   "icon":
        //   //       AppAssets.png.byBestRateMenu.provider(),
        //   // },
        //   // {
        //   //   "name": context.localizedString.dealsOfTheDay,
        //   //   "route": RoutePaths.cashbackDeals,
        //   //   "icon": AppAssets.png.dealsOfTheDayMenu
        //   //       .provider(),
        //   // },
        //   // {
        //   //   "name": context.localizedString.cashbackDeals,
        //   //   "route": RoutePaths.cashbackDeals,
        //   //   "icon":
        //   //       AppAssets.png.hotDealsMenu.provider(),
        //   // },
        //   // {
        //   //   "name": context.localizedString.bouncedNav,
        //   //   "route": RoutePaths.getBouncedOrdersScreen,
        //   //   "icon": AppAssets.png.bouncedOrdersMenu
        //   //       .provider(),
        //   // },
        //   // {
        //   //   "name": context.localizedString.orderHistory,
        //   //   "route": RoutePaths.cashbackDeals,
        //   //   "icon": AppAssets.png.orderHistoryMenu
        //   //       .provider(),
        //   // },
        // ]
      },
      {
        "name": 'My Distributors',
        "route": RoutePaths.distributorConnection,
        "icon": AppAssets.png.distributorsMenu.provider(),
      },
      {
        "name": "Change Password",
        "icon": AppAssets.png.icChangePassword.provider(),
        "route": RoutePaths.changePasswordDialogScreen
      },
      {
        "name": 'My Rewards',
        "icon": AppAssets.png.icBrowse.provider(),
        "route": RoutePaths.rewards,
      },
      {
        "name": context.localizedString.feedback,
        "icon": AppAssets.png.icFeedback.provider(),
        "route": RoutePaths.feedbackRequestDialogScreen
      },
      {
        "name": "Email Us",
        "icon": AppAssets.png.icEmailUs.provider(),
        "route": RoutePaths.eMailUs,
      },
      {
        "name": context.localizedString.contactUs,
        "icon": AppAssets.png.icContactUs.provider(),
        "route": RoutePaths.callUs,
      },
      {
        "name": context.localizedString.termsAndConditions,
        "icon": AppAssets.png.icTermsAndConditions.provider(),
        "route": AppUrls.termsAndConditionsUrl,
      },
      {
        "name": context.localizedString.privacyPolicy,
        "icon": AppAssets.png.icPrivacyPolicy.provider(),
        "route": RoutePaths.privacyPolicy,
      },
      {
        "name": context.localizedString.logout,
        "icon": AppAssets.png.icLogout.provider(),
        "route": RoutePaths.loginScreen,
      },
    ];
  }

  static List<LegacyMenu> getProfileMenu(BuildContext context) {
    List<LegacyMenu> data = [];
    for (var element in profileMenuList(context)) {
      data.add(LegacyMenu.fromJson(element));
    }
    return data;
  }

  static List<LegacyMenu> getLegacySideNavigationMenu(BuildContext context) {
    List<LegacyMenu> data = [];
    for (var element in legacyMenuList(context)) {
      data.add(LegacyMenu.fromJson(element));
    }
    return data;
  }

  static const byDistributor = 'By';
  static const keyLoginId = Key('loginId');
  static const keyBusinessType = Key('businessType');
  static const keyShopFullName = Key('shopFullName');
  static const keyShopAddress = Key('shopAddress');
  static const keyPinCode = Key('pinCode');
  static const keyCity = Key('city');
  static const keyState = Key('state');
  static const keyMobileNumber = Key('mobileNumber');
  static const keyTelephoneNumber = Key('telephoneNumber');
  static const keyDrugLicenseNumber = Key('drugLicenseNumber');
  static const keyDrugLicenseNumber2 = Key('drugLicenseNumber2');
  static const keyDrugLicenseNumber3 = Key('drugLicenseNumber3');
  static const keyGstin = Key('gstin');
  static const keyPanNumber = Key('panNumber');
  static const keyUpiId = Key('upiId');
  static const keyBankName = Key('bankName');
  static const keyAccountType = Key('accountType');
  static const keyBankAccountNumber = Key('bankAccountNumber');
  static const keyAccountHolderName = Key('accountHolderName');
  static const keyIfscCode = Key('ifscCode');
  static const keyName = Key('name');
  static const keyPhoneNumber = Key('mobileNumber');
  static const keyEmailId = Key('emailId');
}
