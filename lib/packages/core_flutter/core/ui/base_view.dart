import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/login_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_local_data_source/local_data_source.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dashboard/menu_actions.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation_legacy/legacy_navigation_drawer.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation_legacy/model/legacy_menu.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/drawer_router_paths.dart';
import 'package:pharmarack/packages/core_flutter/di/core_flutter_provider.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/core_flutter/utils/url_launcher_utils.dart';
import '../../constants/app_urls.dart';

abstract class BasePage<T extends BasePageState> extends StatefulWidget {
  const BasePage({super.key});

  @override
  T createState();
}

abstract class BasePageState extends State {}

abstract class BaseStatefulPage extends BasePageState {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get rootScaffoldKey => _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.appBarColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: scaffoldBackgroundColor(),
        appBar: buildAppbar(),
        endDrawer: buildEndDrawer([]),
        extendBodyBehindAppBar: extendBodyBehindAppBar(),
        body: _buildScaffoldBody(context),
        drawer: buildDrawer(),
        floatingActionButton: floatingActionButton(),
        drawerEnableOpenDragGesture: drawerEnableOpenDragGesture(),
        bottomNavigationBar: buildBottomNavigationBar(),
        bottomSheet: buildBottomSheet(),
      ),
    );
  }

  Widget? floatingActionButton() {
    return null;
  }

  /// Building a appbar of screen
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  /// Building a appbar of screen
  Color scaffoldBackgroundColor() {
    return Colors.white;
  }

  /// Building a drawer of screen
  Widget? buildDrawer() {
    return null;
  }

  /// Building a drawer of screen
  Widget? buildEndDrawer(List<LegacyMenu> menuList,
      {DrawerRouterPaths? drawerRouterPaths}) {
    return menuList.isEmpty || drawerRouterPaths == null
        ? null
        : LegacyNavDrawer(
            (selectedMenu) => handleMenuClick(selectedMenu, drawerRouterPaths),
            menuList);
  }

  /// Building a bottom-sheet
  Widget? buildBottomSheet() {
    return null;
  }

  /// Building a bottomNaviagtion Bar
  Widget? buildBottomNavigationBar() {
    return null;
  }

  bool extendBodyBehindAppBar() {
    return false;
  }

  Widget _buildScaffoldBody(BuildContext context) {
    return buildView(context);
  }

  @mustCallSuper
  Widget buildView(BuildContext context);

  bool drawerEnableOpenDragGesture() {
    return false;
  }

  /// For now handling routes from following method
  /// once routes architecture is final we can move this to respective
  /// classes
  handleMenuClick(String action, DrawerRouterPaths drawerRouterPaths) {
    if (action == drawerRouterPaths.getLoginScreenPath()) {
      showAlertDialog(action);
    }
    if (action == MenuActions.cartIcon) {
      /// Open cart action
    } else if (action == MenuActions.openDrawer) {
      rootScaffoldKey.currentState?.openEndDrawer();
    } else if (action ==
        drawerRouterPaths.getMyConnectionsFulfillmentPartners()) {
      if (_isRouteAlreadyPushed(context, action)) {
        Navigator.pushNamed(
            context, drawerRouterPaths.getMyConnectionsFulfillmentPartners());
      }
      closeEndDrawer();
    } else if (action == drawerRouterPaths.getOrderNowBounced()) {
      if (_isRouteAlreadyPushed(context, action)) {
        Navigator.pushNamed(
          context,
          drawerRouterPaths.getOrderNowBounced(),
        );
      }
      closeEndDrawer();
    } else if (action == drawerRouterPaths.getOrderHistoryPath()) {
      Navigator.pushNamed(context, drawerRouterPaths.getOrderHistoryPath());
      closeEndDrawer();
    } else if (action == drawerRouterPaths.getMyConnectionsDistributors()) {
      Navigator.pushNamed(
          context, drawerRouterPaths.getMyConnectionsDistributors());
      closeEndDrawer();
    }
    /*else if (action == drawerRouterPaths.getOtherFeaturesCart()) {
      Navigator.pushNamed(context, drawerRouterPaths.getOtherFeaturesCart());
      closeEndDrawer();
    }*/
    else if (action == drawerRouterPaths.getEmailUs()) {
      launchSupportEmail(context, 'care@pharmarack.com');
      closeEndDrawer();
    } else if (action == drawerRouterPaths.getCallUs()) {
      launchMobileNumber('020 6766 0011');
      closeEndDrawer();
    } else if (action == drawerRouterPaths.getPrivacyPolicy()) {
      launchGenericUrl(context, 'https://pharmarack.com/privacypolicy');
      closeEndDrawer();
    } else if (action == drawerRouterPaths.getSearchProductPath()) {
      if (_isRouteAlreadyPushed(context, action)) {
        Navigator.pushNamed(context, drawerRouterPaths.getSearchProductPath());
      }
    } else if (action == AppUrls.termsAndConditionsUrl) {
      rootScaffoldKey.currentState?.closeEndDrawer();
      urlLauncher(AppUrls.termsAndConditionsUrl);
    } else if (action == drawerRouterPaths.getChangePassword()) {
      Navigator.pushNamed(context, drawerRouterPaths.getChangePassword());
      closeEndDrawer();
    } else if (action == drawerRouterPaths.getRewardsPath()) {
      Navigator.pushNamed(context, drawerRouterPaths.getRewardsPath());
      closeEndDrawer();
    } else if (action == drawerRouterPaths.getTermsAndConditions()) {
      Navigator.pushNamed(context, drawerRouterPaths.getTermsAndConditions());
      closeEndDrawer();
    }
  }

  void showAlertDialog(String action) async {
    showBinaryButtonAlertDialog(
      context,
      title: context.localizedString.logOutAlertTitle,
      subTitle: context.localizedString.logOutAlertSubTitle,
      firstButtonTitle: context.localizedString.dialogCommonCancelText,
      secondButtonTitle: context.localizedString.dialogLogOutText,
      onFirstButtonClick: () {
        // Cancel button
        Navigator.of(context, rootNavigator: true).pop();
      },
      onSecondButtonClick: () {
        // logout button
        rootScaffoldKey.currentState?.closeEndDrawer();
        if (coreFlutterDI.isRegistered<LoginEntity>()) {
          coreFlutterDI.unregister<LoginEntity>();
        }
        coreFlutterDI<CommonLocalDataSource>().clearStorage();
        Navigator.of(context, rootNavigator: true)
            .popUntil((route) => route.isFirst);
        Navigator.of(context, rootNavigator: true).pushReplacementNamed(action);
      },
    );
  }

  bool _isRouteAlreadyPushed(BuildContext context, String routeName) {
    return !Navigator.canPop(context) ||
        ModalRoute.of(context)?.settings.name != routeName;
  }

  void closeEndDrawer() {
    if (rootScaffoldKey.currentState?.isEndDrawerOpen ?? false) {
      rootScaffoldKey.currentState?.closeEndDrawer();
    }
  }
}
