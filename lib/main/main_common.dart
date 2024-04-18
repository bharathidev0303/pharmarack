import 'dart:io';

// import 'package:core/log_util/log_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pharmarack/packages/core/log_util/log_util.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/app_theme_data.dart';
import 'package:pharmarack/packages/core_flutter/localization/app_localizations.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/main/flavor.dart';
import 'package:pharmarack/packages/utils/auto_login_utils.dart';
import 'package:pharmarack/packages/utils/retailer_app_constants.dart';
// import 'package:pharmarack/utils/auto_login_utils.dart';
import 'package:responsive_framework/responsive_framework.dart';
// import 'package:retailer/utils/auto_login_utils.dart';
// import 'package:retailer/utils/retailer_app_constants.dart';

// import '../di/app_provider.dart';
import 'navigation/app_router.dart';
import 'navigation/route_paths.dart';

void mainCommon(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppProviders().initFlySDK(flavor);
  HttpOverrides.global = MyHttpOverrides();
  LogUtil.initializeLogger(shouldEnableLogs: !kReleaseMode);
  await AppProviders().init(flavor);
  final autoLoginUtils = getIt<AutoLoginUtils>();

  final isResetPasswordAvailable =
      await autoLoginUtils.isResetPasswordAvailable();
  final isUserSessionAvailable = await autoLoginUtils.isUserLoggedIn();
  var isRetailerInfoResponseAvailable = false;
  if (isUserSessionAvailable != false) {
    isRetailerInfoResponseAvailable =
        await autoLoginUtils.checkTokenExpiration();
  }

  runApp(RetailerApp(
    flavor: flavor,
    isLoggedIn: isUserSessionAvailable && isRetailerInfoResponseAvailable,
    /*
    isResetPasswordAvailable is used to navigate to reset password screen
    if the app is quit in the process of forgot password feature
    */
    isResetPasswordAvailable: isResetPasswordAvailable,
  ));
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class RetailerApp extends StatelessWidget {
  final Flavor flavor;
  final bool isLoggedIn;
  final bool isResetPasswordAvailable;

  const RetailerApp(
      {super.key,
      required this.flavor,
      required this.isLoggedIn,
      required this.isResetPasswordAvailable});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: retailerAppLevelKey,
      builder: (context, child) {
        return ResponsiveWrapper.builder(child ?? Container(),
            breakpoints: const [
              ResponsiveBreakpoint.resize(360, name: MOBILE),
              ResponsiveBreakpoint.resize(900, name: TABLET, scaleFactor: 1.25),
              ResponsiveBreakpoint.resize(1440,
                  name: DESKTOP, scaleFactor: 1.5),
              ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ]);
      },
      //home: const AppBottomNavigationBar(),
      debugShowCheckedModeBanner: false,
      title: flavor.appTitle,
      onGenerateRoute: (_) {
        return AppRouter.generateRoute(_, isLoggedIn, isResetPasswordAvailable);
      },
      initialRoute: RoutePaths.homeScreen,
      theme: AppThemeData.lightTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en')],
    );
  }
}
