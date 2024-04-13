import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation_legacy/model/legacy_menu.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/drawer_router_paths.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/view/features/common/cubit/bottom_navigation_cubit.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/company_page/company_screen_page_mobile_view.dart';
import 'package:pharmarack/view/features/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:pharmarack/view/profile/presentation/constants/my_profile_constants.dart';

class CompanyScreenPage extends StatefulWidget {
  const CompanyScreenPage({super.key});

  @override
  CompanyScreenPageSate createState() => CompanyScreenPageSate();
}

class CompanyScreenPageSate extends BaseStatefulPage {
  @override
  void initState() {
    super.initState();

    debugPrint("Distributorscontext2 : -");
  }

  @override
  Widget buildView(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationCubit>(
          create: (context) => getIt<BottomNavigationCubit>(),
        )
      ],
      child: BlocBuilder(
        bloc: getIt<BottomNavigationCubit>(),
        builder: (BuildContext context, int state) {
          return const CompanyScreenPageMobileView();
        },
      ),
    );
  }

  @override
  Color scaffoldBackgroundColor() {
    return context.colors.screenBackground!;
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return CustomAppBar(
      type: AppBarType.dashBoard,
      isInterActive: false,
      callbackForHamburger: (action) {
        handleMenuClick(action, getIt.get<DrawerRouterPaths>());
      },
      onPressNotifications: () {
        Navigator.pushNamed(context, RoutePaths.notifications);
      },
    );
  }

  @override
  Widget? buildEndDrawer(List<LegacyMenu> menuList,
      {DrawerRouterPaths? drawerRouterPaths}) {
    return super.buildEndDrawer(
      MyProfileConstants.getLegacySideNavigationMenu(context),
      drawerRouterPaths: getIt.get<DrawerRouterPaths>(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
