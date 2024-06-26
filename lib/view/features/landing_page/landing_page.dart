import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/main/app_bottom_navigation_bar.dart';
import 'package:pharmarack/main/navigation/app_router.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/pages/order_history_page.dart';
import 'package:pharmarack/view/features/browse_companies/presentation/pages/browse_companies_page.dart';
import 'package:pharmarack/view/dashboard/cart/presentation/pages/draggable_cart/dragable_cart_page.dart';
import 'package:pharmarack/view/features/common/cubit/bottom_navigation_cubit.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/dashboard_screen_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/dashboard_screen/dashboard_screen_page.dart';
import 'package:pharmarack/view/features/profile/presentation/pages/profile_page.dart';

import '../../dashboard/cart/presentation/pages/cart_detail_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  final _defaultIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(), // Dashboard
    GlobalKey<NavigatorState>(), // Browse
    GlobalKey<NavigatorState>(), // Orders
    GlobalKey<NavigatorState>(), // Profile
    GlobalKey<NavigatorState>(), // Cart
  ];

  @override
  void initState() {
    registerBottomNavigationCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, int>(
      bloc: getIt<BottomNavigationCubit>(),
      builder: (BuildContext context, int cubitIndex) {
        final GlobalKey<NavigatorState> navigatorKey =
            GlobalKey<NavigatorState>();
        final rootWidget = getCurrentNavigationWidget(cubitIndex);
        return WillPopScope(
            onWillPop: () async {
              final int tabIndex = _getSelectedTabIndex();
              final isNestedRoutePopped = await navigatorKey.currentState!
                  .maybePop(); // returns true if popped
              if (isNestedRoutePopped) {
                return false; // don't exit the app
              } else if (tabIndex == _defaultIndex) {
                return true; // exit the app when we're already on the 'main' tab
              } else {
                _goToDashboard();
                return false;
              }
            },
            child: Scaffold(
              bottomNavigationBar: SafeArea(
                child: AppBottomNavigationBar(
                  defaultIndex: cubitIndex,
                  onSelectedIndex: (index) {
                    getIt<BottomNavigationCubit>()
                        .updateBottomNavigationIndex(index);
                  },
                ),
              ),
              // ignore: deprecated_member_use
              body: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: _PageRouter(
                      navigatorKey: navigatorKey,
                      rootWidget: rootWidget,
                    ),
                  ),
                  rootWidget is CartDetailPage
                      ? const SizedBox()
                      : const DraggableCartPage(),
                ],
              ),
            ));
      },
    );
  }

  int _getSelectedTabIndex() => getIt<BottomNavigationCubit>().state;

  Widget getCurrentNavigationWidget(int index) {
    List<Widget> navigationWidgets = [
      const DashboardScreenPage(),
      const BrowseCompaniesPage(),
      const OrderHistoryPage(),
      const ProfilePage(),
      const CartDetailPage(),

      // ignore: deprecated_member_use
    ];
    return navigationWidgets[index];
  }

  void _goToDashboard() {
    getIt<BottomNavigationCubit>().updateBottomNavigationIndex(_defaultIndex);
  }

  @override
  void dispose() {
    if (getIt.isRegistered<BottomNavigationCubit>()) {
      getIt.unregister<BottomNavigationCubit>();
    }
    super.dispose();
  }
}

class _PageRouter extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget rootWidget;

  const _PageRouter({
    required this.navigatorKey,
    required this.rootWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            final Widget widget;
            if (settings.name == '/') {
              widget = rootWidget;
            } else {
              widget = AppRouter.getWidgetByRoute(settings.name);
            }

            return widget;
          },
        );
      },
    );
  }
}
