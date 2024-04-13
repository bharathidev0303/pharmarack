import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dashboard/legacy_app_bar.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation_legacy/model/legacy_menu.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/drawer_router_paths.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/di/fulfilment_partner_providers.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/settings_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/pages/settings_page/settings_page_mobile_view.dart';

/// This class [SettingsPage] which is UI screen which display interact with the user
class SettingsPage extends BasePage<SettingsPageState> {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

/// This class [SettingsPageState] which consume by SettingsPage as page state
class SettingsPageState extends BaseStatefulPage {
  @override
  void initState() {
    super.initState();
    initializeSettingsDependencies();
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocProvider<SettingsCubit>(
      create: (context) => getIt<SettingsCubit>(),
      child: const SettingsPageMobileView(),
    );
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

  @override
  void dispose() {
    disposeSettingsDependencies();
    super.dispose();
  }
}
