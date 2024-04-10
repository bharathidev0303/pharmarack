// import 'package:core_flutter/common_widgets/side_navigation_legacy/model/legacy_menu.dart';
// import 'package:core_flutter/constants/app_urls.dart';
// import 'package:core_flutter/gen/assets.gen.dart';
// import 'package:core_flutter/localization/localization_extensions.dart';
import 'package:flutter/material.dart';
import 'package:pharmarack/models/side_navigation/model/menu.dart';

import '../../main/navigation/route_paths.dart';

GlobalKey<NavigatorState> retailerAppLevelKey =
    GlobalKey(debugLabel: 'app-key');

class RetailerAppConstants {
  /// Dummy menu list for now
  static List menuList = [
    {
      "name": "Order Now",
      "icon": Icons.payment,
      // "subMenu": [
      //   {"name": "By Distributor", "route": RoutePaths.dashBoardScreen},
      //   {"name": "By Product", "route": RoutePaths.searchProduct},
      //   {"name": "Best Rate", "route": RoutePaths.byRate},
      //   {"name": "Cashback Deals", "route": RoutePaths.cashbackDeals},
      //   {"name": "Bounced", "route": RoutePaths.getBouncedOrdersScreen},
      // ]
    },
    {
      "name": "Recursion Menu Example",
      "icon": Icons.celebration,
      "subMenu": [
        {
          "name": "Promotions",
          "subMenu": [
            {"name": "Catalog Price Rule"},
            {"name": "Cart Price Rules"}
          ]
        },
        {
          "name": "Communications",
          "subMenu": [
            {"name": "Newsletter Subscribers"}
          ]
        },
        {
          "name": "User Content",
          "subMenu": [
            {"name": "All Reviews"},
            {"name": "Pending Reviews"}
          ]
        }
      ]
    },
    {
      "name": "Product Search",
      "icon": Icons.search,
      "subMenu": [
        {"name": "Promotions"},
        {"name": "Communications"},
        {"name": "SEO & Search"},
        {
          "name": "Recursion Type 2",
          "subMenu": [
            {"name": "All Reviews"},
            {"name": "Pending Reviews"}
          ]
        }
      ]
    },
    {
      "name": "Payments",
      "icon": Icons.money,
      "subMenu": [
        {"name": "Outstanding"},
        {"name": "History"},
        {"name": "E-Cheque"},
        {"name": "Loan"},
        {"name": "Scheduled"},
      ]
    },
    {
      "name": "My Connections",
      "icon": Icons.connect_without_contact,
      "subMenu": [
        {
          "name": "Distributors",
          // "route": RoutePaths.distributorConnection,
        },
        // {"name": "Fulfilment Partners", "route": RoutePaths.fulfilmentPartner},
      ]
    },
    {
      "name": "Other Features",
      "icon": Icons.more,
      "subMenu": [
        {"name": "Purchase Return"},
        {"name": "My Deliveries"},
        {"name": "Track Deliveries"},
      ]
    }
  ];

  static List<Menu> getSideNavigationMenu() {
    List<Menu> data = [];
    for (var element in menuList) {
      data.add(Menu.fromJson(element));
    }

    return data;
  }

  static const byDistributor = 'By';
  static const apiPortNumber = ':5002';
  static const customerCareNumber = '020 6766 0011';
  static const supportEmail = 'care@pharmarack.com';
  static const privacyPolicy = 'https://pharmarack.com/privacypolicy';
}

enum CartSource { mbrt, movp, movd, mdod, mcd }
