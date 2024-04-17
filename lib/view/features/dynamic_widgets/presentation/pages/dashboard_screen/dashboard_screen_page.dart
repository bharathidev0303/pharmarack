import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_model/common_success_dialog_info_model.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation_legacy/model/legacy_menu.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/drawer_router_paths.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/view/dashboard/cart/di/cart_provider.dart';
import 'package:pharmarack/view/features/common/cubit/bottom_navigation_cubit.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/dashboard_screen_providers.dart';
import 'package:pharmarack/view/features/profile/presentation/constants/my_profile_constants.dart';
import 'package:pharmarack/view/features/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';
import 'dashboard_screen_page_mobile_view.dart';

class DashboardScreenPage extends BasePage<DashboardScreenPageSate> {
  const DashboardScreenPage({super.key});

  @override
  DashboardScreenPageSate createState() => DashboardScreenPageSate();
}

class DashboardScreenPageSate extends BaseStatefulPage {
  @override
  void initState() {
    super.initState();
    initDashboardDi();
    if (getIt.isRegistered<CommonSuccessDialogInfoModel>(
        instanceName: OnboardingConstants.showDialogDiConstant)) {
      final successDialogInfo = getIt<CommonSuccessDialogInfoModel>(
          instanceName: OnboardingConstants.showDialogDiConstant);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showSuccessDialog(
          context,
          title: successDialogInfo.title,
          subtitle: successDialogInfo.subtitle,
        );
      });
      getIt.unregister<CommonSuccessDialogInfoModel>(
          instanceName: OnboardingConstants.showDialogDiConstant);
    }

    draggableCartScreenCubit.getCartDetails();
    // FlyyFlutterPlugin.setFlyyUser(
    //     getIt<RetailerInfoEntity>().userId.toString());
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
          return const DashboardScreenPageMobileView();
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
    // return CustomAppBar(
    //     (action) => handleMenuClick(action, getIt.get<DrawerRouterPaths>()));
    return CustomAppBar(
      type: AppBarType.dashBoard,
      isInterActive: false,
      callbackForHamburger: (action) {
        print("checkSearchBarClick:-  $action");
        handleMenuClick(action, getIt.get<DrawerRouterPaths>());
      },
      onPressNotifications: () {
        // Navigator.pushNamed(context, RoutePaths.notifications);
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
    clearDashboardDi();
  }
}
