// ignore_for_file: null_argument_to_non_null_type

import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/main/connectivity/conectivity_cubit.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/utils/retailer_app_constants.dart';
import 'package:pharmarack/utils/auto_login_utils.dart';

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
                if (pop) {
                  final connectionStatus = await initConnectivity();
                  if (connectionStatus.contains(ConnectivityResult.none)) {
                    exit(0);
                  }
                }
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.wifi_off_rounded,
                        size: 80.0, color: Colors.grey),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      message,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(message != 'Connection Established'
                        ? 'Please connect to the internet and try again'
                        : ''),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        print("sdxcsddfdsddxc");
                        if (getIt<ConnectivityCubit>()
                                .getBottomNavigationIndex() ==
                            1) {
                          print("sdxcsdsddxc");
                          final autoLoginUtils = getIt<AutoLoginUtils>();
                          final isUserSessionAvailable =
                              await autoLoginUtils.isUserLoggedIn();
                          print(isUserSessionAvailable);
                          print("sdfsdcs");
                          if (isUserSessionAvailable != false) {
                            final islogin =
                                await autoLoginUtils.checkTokenExpiration();
                            Navigator.pushReplacementNamed(
                                context, RoutePaths.homeScreen);
                          } else {
                            Navigator.pushReplacementNamed(
                                context, RoutePaths.homeScreen);
                          }
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
