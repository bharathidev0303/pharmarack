import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dashboard/legacy_app_bar.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation_legacy/model/legacy_menu.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/drawer_router_paths.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/di/fulfilment_partner_providers.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/mapped_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/request_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/pages/mapping_page/mapping_page_mobile_view.dart';

/// This class [MappingPage] which is UI screen which display interact with the user
class MappingPage extends BasePage<MappingPageState> {
  const MappingPage({super.key});

  @override
  MappingPageState createState() => MappingPageState();
}

/// This class [MappingPageState] which consume by FulfilmentPartnerPage as page state
class MappingPageState extends BaseStatefulPage {
  @override
  void initState() {
    super.initState();
    initializeMappingDependencies();
  }

  @override
  Widget buildView(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RequestCubit>(
          create: (context) => getIt<RequestCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<MappedCubit>(),
        ),
      ],
      child: const MappingPageMobileView(),
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
    disposeMappingDependencies();
    super.dispose();
  }
}
