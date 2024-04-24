import 'package:get_it/get_it.dart';
import 'package:pharmarack/auth/user_auth_manager.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/main/connectivity/conectivity_cubit.dart';
import 'package:pharmarack/packages/core_flutter/common_local_data_source/local_data_source.dart';
import 'package:pharmarack/packages/core_flutter/di/core_flutter_provider.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/packages/utils/auto_login_utils.dart';
import 'package:pharmarack/view/features/splash_screen/data/data_source/local_data_source/local_data_source.dart';
import 'package:pharmarack/view/features/splash_screen/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:pharmarack/view/features/splash_screen/data/repository/splash_screen_repository_impl.dart';
import 'package:pharmarack/view/onboarding/data/api_service/onboarding_api_service.dart';

import '../../view/features/splash_screen/domain/repository/splash_screen_repository.dart';

void registerConnectivityCubit() {
  if (getIt.isRegistered<ConnectivityCubit>()) {
    getIt.unregister<ConnectivityCubit>();
  }
  getIt.registerSingleton<ConnectivityCubit>(ConnectivityCubit(0));
}

Future<void> reytailerdetailsUtils() async {
  getIt.registerSingleton<SplashScreenRemoteDataSource>(
      SplashScreenRemoteDataSource(getIt<OnboardingApiService>()));

  getIt.registerSingletonWithDependencies<SplashScreenRepository>(
      () => SplashScreenRepositoryImpl(getIt<SplashScreenLocalDataSource>(),
          getIt<SplashScreenRemoteDataSource>()),
      dependsOn: [SplashScreenLocalDataSource]);
  await getIt.isReady<SplashScreenRepository>();
  await coreFlutterDI.isReady<CommonLocalDataSource>();

  if (getIt.isRegistered<AutoLoginUtils>()) {
    getIt.unregister<AutoLoginUtils>();
  }
  getIt.registerSingleton<AutoLoginUtils>(
    AutoLoginUtils(
      splashScreenRepository: getIt<SplashScreenRepository>(),
      legacyUserAuthManager: getIt.get<UserAuthManager>(
          instanceName: AppConstants.legacyBaseUrlUserAuthManager),
      userAuthManager: getIt.get<UserAuthManager>(
          instanceName: AppConstants.baseUrlUserAuthManager),
      commonLocalDataSource: coreFlutterDI<CommonLocalDataSource>(),
    ),
  );
}
