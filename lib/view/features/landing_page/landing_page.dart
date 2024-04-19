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

// class LandingPageState extends State<LandingPage> {
//   final _defaultIndex = 0;

//   final List<GlobalKey<NavigatorState>> _navigatorKeys = [
//     GlobalKey<NavigatorState>(), // Dashboard
//     GlobalKey<NavigatorState>(), // Browse
//     GlobalKey<NavigatorState>(), // Orders
//     GlobalKey<NavigatorState>(), // Profile
//     GlobalKey<NavigatorState>(), // Cart
//   ];

//   @override
//   void initState() {
//     registerBottomNavigationCubit();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<BottomNavigationCubit, int>(
//       bloc: getIt<BottomNavigationCubit>(),
//       builder: (BuildContext context, int cubitIndex) {
//         final rootWidget = getCurrentNavigationWidget(cubitIndex);
//         return AnnotatedRegion(
//           value: const SystemUiOverlayStyle(
//             statusBarColor: AppColors.appBarColor,
//             statusBarIconBrightness: Brightness.dark,
//           ),
//           child: Scaffold(
//             bottomNavigationBar: SafeArea(
//               child: AppBottomNavigationBar(
//                 defaultIndex: cubitIndex,
//                 onSelectedIndex: (index) {
//                   getIt<BottomNavigationCubit>()
//                       .updateBottomNavigationIndex(index);
//                 },
//               ),
//             ),
//             // ignore: deprecated_member_use
//             body: WillPopScope(
//                 onWillPop: () async {
//                   final int tabIndex = _getSelectedTabIndex();
//                   final isNestedRoutePopped = await _navigatorKeys[tabIndex]
//                       .currentState!
//                       .maybePop(); // returns true if popped
//                   if (isNestedRoutePopped) {
//                     return false; // don't exit the app
//                   } else if (tabIndex == _defaultIndex) {
//                     return true; // exit the app when we're already on the 'main' tab
//                   } else {
//                     _goToDashboard();
//                     return false;
//                   }
//                 },
//                 child: _PageRouter(
//                   navigatorKey: _navigatorKeys[cubitIndex],
//                   rootWidget: rootWidget,
//                 )),
//           ),
//         );
//       },
//     );
//   }

//   int _getSelectedTabIndex() => getIt<BottomNavigationCubit>().state;

//   Widget getCurrentNavigationWidget(int index) {
//     List<Widget> navigationWidgets = [
//       const DashboardScreenPage(),
//       const BrowseCompaniesPage(),
//       // const BrowseCompaniesPage(),
//       OrderHistoryPage(onPressBackButton: () {
//         _goToDashboard();
//       }),
//       ProfilePage(onPressBackButton: () {
//         _goToDashboard();
//       }),
//       CartDetailPage(onPressBackButton: () {
//         _goToDashboard();
//       }),
//     ];
//     return navigationWidgets[index];
//   }

//   void _goToDashboard() {
//     getIt<BottomNavigationCubit>().updateBottomNavigationIndex(_defaultIndex);
//   }

//   @override
//   void dispose() {
//     if (getIt.isRegistered<BottomNavigationCubit>()) {
//       getIt.unregister<BottomNavigationCubit>();
//     }
//     super.dispose();
//   }
// }

// class _PageRouter extends StatelessWidget {
//   final GlobalKey<NavigatorState> navigatorKey;
//   final Widget rootWidget;

//   const _PageRouter({
//     required this.navigatorKey,
//     required this.rootWidget,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: navigatorKey,
//       onGenerateRoute: (RouteSettings settings) {
//         return MaterialPageRoute(
//           settings: settings,
//           builder: (BuildContext context) {
//             final Widget widget;
//             if (settings.name == '/') {
//               widget = rootWidget;
//             } else {
//               widget = AppRouter.getWidgetByRoute(settings.name);
//             }

//             return (widget is CartDetailPage)
//                 ? widget
//                 : Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Expanded(child: widget),
//                       const DraggableCartPage(),
//                     ],
//                   );
//           },
//         );
//       },
//     );
//   }
// }

class LandingPageState extends State<LandingPage> {
  List<Widget> navigationWidgets = [
    const DashboardScreenPage(),
    const BrowseCompaniesPage(),
    const OrderHistoryPage(),
    const ProfilePage(),
    const CartDetailPage(),
  ];

  @override
  void initState() {
    registerBottomNavigationCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationCubit>(
          create: (context) => getIt<BottomNavigationCubit>(),
        )
      ],
      child: BlocBuilder(
        bloc: getIt<BottomNavigationCubit>(),
        builder: (BuildContext context, int state) {
          return WillPopScope(
              child: AnnotatedRegion(
                value: const SystemUiOverlayStyle(
                  statusBarColor: AppColors.appBarColor,
                  statusBarIconBrightness: Brightness.dark,
                ),
                child: Scaffold(
                  body: (_buildBody(state) is CartDetailPage)
                      ? _buildBody(state)
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(child: _buildBody(state)),
                            const DraggableCartPage(),
                          ],
                        ),
                  bottomNavigationBar: AppBottomNavigationBar(
                    defaultIndex: state,
                    onSelectedIndex: (index) {
                      getIt<BottomNavigationCubit>()
                          .updateBottomNavigationIndex(index);
                    },
                  ),
                ),
              ),
              onWillPop: () async {
                if (state == 0) {
                  return true;
                } else {
                  context
                      .read<BottomNavigationCubit>()
                      .updateBottomNavigationIndex(0);
                  return false;
                }
              });
        },
      ),
    );
  }

  Widget _buildBody(int index) {
    return navigationWidgets.elementAt(index);
  }

  @override
  void dispose() {
    if (getIt.isRegistered<BottomNavigationCubit>()) {
      getIt.unregister<BottomNavigationCubit>();
    }
    super.dispose();
  }
}
