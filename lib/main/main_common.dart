import 'dart:async';
import 'dart:io';

// import 'package:core/log_util/log_util.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:pharmarack/main/connectivity/conectivity_cubit.dart';
import 'package:pharmarack/main/connectivity/conectivity_providers.dart';
import 'package:pharmarack/main/connectivity/connectivity_checker.dart';
import 'package:pharmarack/packages/core/log_util/log_util.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/app_theme_data.dart';
import 'package:pharmarack/packages/core_flutter/localization/app_localizations.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/main/flavor.dart';
import 'package:pharmarack/packages/utils/auto_login_utils.dart';
import 'package:pharmarack/packages/utils/retailer_app_constants.dart';
import 'package:pharmarack/view/dashboard/cart/presentation/cubit/cart_screen_state.dart';
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
  var network = await const InternetConnectionUtils().checkconnection();

  runApp(RetailerApp(
      flavor: flavor,
      isLoggedIn: isUserSessionAvailable && isRetailerInfoResponseAvailable,
      /*
    isResetPasswordAvailable is used to navigate to reset password screen
    if the app is quit in the process of forgot password feature
    */
      isResetPasswordAvailable: isResetPasswordAvailable,
      network: network));
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
  final bool network;

  const RetailerApp(
      {super.key,
      required this.flavor,
      required this.isLoggedIn,
      required this.isResetPasswordAvailable,
      required this.network});

  @override
  State<RetailerApp> createState() => _RetailerAppState();
}

class _RetailerAppState extends State<RetailerApp> {
  Map<String, dynamic> pushNotiflcationData = {};
  List<ConnectivityResult> _connectionStatus = [ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    initPlatformState();
    registerConnectivityCubit();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  Future<void> initConnectivity() async {
    late List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      return;
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(List<ConnectivityResult> result) async {
    setState(() {
      _connectionStatus = result;
    });
    switch (_connectionStatus) {
      case [ConnectivityResult.mobile]:
        // if (getIt<ConnectivityCubit>().getBottomNavigationIndex() != 1) {}
        var network = await const InternetConnectionUtils().checkconnection();
        if (network) {
          getIt<ConnectivityCubit>().updateBottomNavigationIndex(1);
        } else {
          getIt<ConnectivityCubit>().updateBottomNavigationIndex(2);
        }

        break;
      case [ConnectivityResult.wifi]:
        // if (getIt<ConnectivityCubit>().getBottomNavigationIndex() != 1) {
        //   getIt<ConnectivityCubit>().updateBottomNavigationIndex(1);
        // }
        var network = await const InternetConnectionUtils().checkconnection();
        print(network);
        print("sdfjhbsjdsdfjshdgbv");
        if (network) {
          getIt<ConnectivityCubit>().updateBottomNavigationIndex(1);
        } else {
          getIt<ConnectivityCubit>().updateBottomNavigationIndex(2);
        }
        break;
      case [ConnectivityResult.none]:
        getIt<ConnectivityCubit>().updateBottomNavigationIndex(2);
        break;
      default:
        getIt<ConnectivityCubit>().updateBottomNavigationIndex(0);
        break;
    }
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
    return BlocBuilder<ConnectivityCubit, dynamic>(
        bloc: getIt<ConnectivityCubit>(),
        builder: (BuildContext context, dynamic cubitIndex) {
          print(cubitIndex);
          print("dfhgvshdfgbvsvgbd");
          if (cubitIndex == 2) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              retailerAppLevelKey.currentState
                  ?.pushReplacementNamed(RoutePaths.noInternet);
            });
            //  Navigator.pushReplacementNamed(
            //                   context, RoutePaths.homeScreen);
          }
          return MaterialApp(
            navigatorKey: retailerAppLevelKey,
            builder: (context, child) {
              return ResponsiveWrapper.builder(child ?? Container(),
                  breakpoints: const [
                    ResponsiveBreakpoint.resize(360, name: MOBILE),
                    ResponsiveBreakpoint.resize(900,
                        name: TABLET, scaleFactor: 1.25),
                    ResponsiveBreakpoint.resize(1440,
                        name: DESKTOP, scaleFactor: 1.5),
                    ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                  ]);
            },
            //home: const AppBottomNavigationBar(),
            debugShowCheckedModeBanner: false,
            title: widget.flavor.appTitle,
            onGenerateRoute: (_) {
              return AppRouter.generateRoute(_, widget.isLoggedIn,
                  widget.isResetPasswordAvailable, cubitIndex, widget.network);
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
        });
  }

  notificationPageRedirection(Map<String, dynamic> pushNotiflcationData) async {
    if (pushNotiflcationData["Navigation"] == "OrderHistory") {
      retailerAppLevelKey.currentState?.pushNamed(RoutePaths.orderHistory);
    } else if (pushNotiflcationData["Navigation"] == "Cart") {
      getIt<BottomNavigationCubit>().updateBottomNavigationIndex(4);
    }
  }

  // Future<void> fetchData() async {}
}

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({super.key});

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
  }

  Future<List<ConnectivityResult>> initConnectivity() async {
    if (!mounted) {
      return Future.value(null);
    }

    try {
      await Future.delayed(const Duration(seconds: 1));
      return await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      return Future.value(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, dynamic>(
        bloc: getIt<ConnectivityCubit>(),
        builder: (BuildContext context, dynamic cubitIndex) {
          var message = 'No Internet Connection';
          var color = Colors.grey;
          if (cubitIndex == 1) {
            message = 'Connection Established';
            color = Colors.green;
          }
          if (cubitIndex == 0) {
            message = 'Loading ...';
            color = Colors.red;
          }

          return Scaffold(
            body: PopScope(
              canPop: true,
              onPopInvoked: (pop) async {
                exit(0);
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    cubitIndex == 1
                        ? Icon(Icons.wifi_2_bar_sharp, size: 80.0, color: color)
                        : Icon(Icons.wifi_off_rounded,
                            size: 80.0, color: color),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'No Internet Connection',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text('Please connect to the internet and try again'),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var network = await const InternetConnectionUtils()
                            .checkconnection();
                        if (network) {
                          getIt<ConnectivityCubit>()
                              .updateBottomNavigationIndex(1);
                          final autoLoginUtils = getIt<AutoLoginUtils>();
                          final isUserSessionAvailable =
                              await autoLoginUtils.isUserLoggedIn();

                          if (isUserSessionAvailable != false) {
                            final islogin =
                                await autoLoginUtils.checkTokenExpiration();

                            // Navigator.pop(context);
                            Navigator.pushReplacementNamed(
                                context, RoutePaths.homeScreen);
                          } else {
                            // Navigator.pop(context);
                            Navigator.pushReplacementNamed(
                                context, RoutePaths.homeScreen);
                          }
                        } else {
                          cubitIndex = 2;
                          // getIt<ConnectivityCubit>()
                          //     .updateBottomNavigationIndex(2);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.blueButtonColor,
                      ),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
