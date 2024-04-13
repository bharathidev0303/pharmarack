import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dashboard/legacy_app_bar.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation_legacy/model/legacy_menu.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/drawer_router_paths.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/di/fulfilment_partner_providers.dart';

import 'fulfilment_partner_page_mobile_view.dart';

/// This class [FulfilmentPartnerPage] which is UI screen which display interact with the user
class FulfilmentPartnerPage extends BasePage<FulfilmentPartnerPageState> {
  final String moduleName;

  const FulfilmentPartnerPage(this.moduleName, {super.key});

  @override
  FulfilmentPartnerPageState createState() => FulfilmentPartnerPageState();
}

/// This class [FulfilmentPartnerPageState] which consume by FulfilmentPartnerPage as page state
class FulfilmentPartnerPageState extends BaseStatefulPage {
  @override
  void initState() {
    super.initState();
    initializeFeatureApiServiceAndRepository(
        (widget as FulfilmentPartnerPage).moduleName);
  }

  @override
  Widget buildView(BuildContext context) {
    return const FulfilmentPartnerPageMobileView();
  }

  @override
  void dispose() {
    disposeFeatureApiServiceAndRepository();
    super.dispose();
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return LegacyAppBar(
      title: context.localizedString.fulfilmentPartners,
      onAppBarActionClick: (action) {
        handleMenuClick(action, getIt<DrawerRouterPaths>());
      },
    );
  }

  @override
  Widget? buildEndDrawer(List<LegacyMenu> menuList,
      {DrawerRouterPaths? drawerRouterPaths}) {
    final drawerRouterPath = getIt.get<DrawerRouterPaths>();
    return super.buildEndDrawer(
      drawerRouterPath.getLegacyMenuList(context),
      drawerRouterPaths: drawerRouterPath,
    );
  }
}
