import 'dart:io';

// import 'package:core/log_util/log_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pharmarack/packages/core/log_util/log_util.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/app_theme_data.dart';
import 'package:pharmarack/packages/core_flutter/localization/app_localizations.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/main/flavor.dart';
import 'package:pharmarack/packages/utils/auto_login_utils.dart';
import 'package:pharmarack/packages/utils/retailer_app_constants.dart';
import 'package:pharmarack/view/features/common/cubit/bottom_navigation_cubit.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';
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

class RetailerApp extends StatefulWidget {
  final Flavor flavor;
  final bool isLoggedIn;
  final bool isResetPasswordAvailable;
  const RetailerApp(
      {super.key,
      required this.flavor,
      required this.isLoggedIn,
      required this.isResetPasswordAvailable});

  @override
  State<RetailerApp> createState() => _RetailerAppState();
}

class _RetailerAppState extends State<RetailerApp> {
  Map<String, dynamic> pushNotiflcationData = {};

  @override
  void initState() {
    initPlatformState();
    super.initState();
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;

    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    OneSignal.Debug.setAlertLevel(OSLogLevel.none);

    OneSignal.initialize(OnboardingConstants.oneSignalDashboardKey);

    OneSignal.Notifications.clearAll();

    OneSignal.Notifications.addClickListener((event) {
      setState(() {
        pushNotiflcationData = event.notification.additionalData!;
      });
    });

    OneSignal.InAppMessages.paused(true);
  }

  @override
  Widget build(BuildContext context) {
    if (pushNotiflcationData.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notificationPageRedirection(pushNotiflcationData);
      });
    }
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.appBarColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
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
      title: widget.flavor.appTitle,
      onGenerateRoute: (_) {
        return AppRouter.generateRoute(
            _, widget.isLoggedIn, widget.isResetPasswordAvailable);
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

  notificationPageRedirection(Map<String, dynamic> pushNotiflcationData) async {
    if (pushNotiflcationData["Navigation"] == "OrderHistory") {
      retailerAppLevelKey.currentState?.pushNamed(RoutePaths.orderHistory);
    } else if (pushNotiflcationData["Navigation"] == "Cart") {
      getIt<BottomNavigationCubit>().updateBottomNavigationIndex(4);
    }
  }
}
