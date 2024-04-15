import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/auth/user_auth_manager.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core/network/interceptor/dio_base_option.dart';
import 'package:pharmarack/packages/core/network/interceptor/dio_interceptor.dart';
import 'package:pharmarack/packages/core_flutter/common_local_data_source/local_data_source.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/drawer_router_paths.dart';
import 'package:pharmarack/packages/core_flutter/di/core_flutter_provider.dart';
import 'package:pharmarack/packages/core_flutter/navigation/core_route_path.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/feedback/data/api_service/feedback_api_service.dart';
import 'package:pharmarack/feedback/data/data_source/remote_data_source.dart';
import 'package:pharmarack/feedback/data/repository/feedback_repository_impl.dart';
import 'package:pharmarack/feedback/domain/repository/feedback_repository.dart';
import 'package:pharmarack/view/features/browse_companies/di/browse_companies_providers.dart';
import 'package:pharmarack/view/dashboard/cart/di/cart_provider.dart';
import 'package:pharmarack/view/features/change_distributor/change_distributor_providers.dart';
import 'package:pharmarack/view/features/distributor_connection/di/distributor_connection_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/api_services/widget_builder_services.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/repository/widget_builder_repository.dart';
import 'package:pharmarack/view/features/splash_screen/data/data_source/local_data_source/local_data_source.dart';
import 'package:pharmarack/view/features/splash_screen/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:pharmarack/view/features/splash_screen/data/repository/splash_screen_repository_impl.dart';
import 'package:pharmarack/view/features/splash_screen/domain/repository/splash_screen_repository.dart';
import 'package:pharmarack/view/onboarding/data/api_service/onboarding_api_service.dart';
import 'package:pharmarack/view/onboarding/data/api_service/onboarding_legacy_api_service.dart';
import 'package:pharmarack/view/onboarding/data/data_source/local_data_source/local_data_source.dart';
import 'package:pharmarack/view/onboarding/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:pharmarack/view/onboarding/data/repository/onboarding_repository_impl.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/domain/repository/onboarding_repository.dart';
import 'package:pharmarack/packages/storage_utils/box_constants/box_name_constants.dart';
import 'package:pharmarack/packages/storage_utils/storage.dart';
import 'package:pharmarack/packages/storage_utils/storage_factory.dart';
import 'package:pharmarack/packages/utils/auto_login_utils.dart';

import '../main/flavor.dart';

final getIt = GetIt.instance;

class AppProviders {
  init(Flavor flavor) async {
    // Register Dio
    getIt.registerSingleton<Dio>(
      DioInterceptor.createDio(
        DioBaseOption(
          baseUrl: flavor.legacyBaseUrl,
          proxyBaseUrl: flavor.proxyBaseUrl,
        ),
      ),
      instanceName: AppConstants.legacyBaseUrlDioConstant,
    );
    getIt.registerSingleton<Dio>(
      DioInterceptor.createDio(
        DioBaseOption(
          baseUrl: flavor.baseUrl,
          proxyBaseUrl: flavor.proxyBaseUrl,
        ),
      ),
      instanceName: AppConstants.baseUrlDioConstant,
    );
    getIt.registerSingleton<Dio>(
      DioInterceptor.createDio(
        DioBaseOption(
          baseUrl: flavor.cmsGatewayBaseUrl,
          proxyBaseUrl: flavor.proxyBaseUrl,
        ),
      ),
      instanceName: AppConstants.cmsGatewayBaseUrlDioConstant,
    );
    getIt.registerSingleton<Dio>(
      DioInterceptor.createDio(
        DioBaseOption(
          baseUrl: flavor.elasticSearchBaseUrl,
          proxyBaseUrl: flavor.proxyBaseUrl,
        ),
      ),
      instanceName: AppConstants.baseUrlElasticSearchConstant,
    );
    await initHive();
    await createBox(BoxName.retailerAppBoxName);
    getIt.registerSingleton<DrawerRouterPaths>(RoutePaths());
    coreFlutterDI.registerLazySingletonAsync<CommonLocalDataSource>(() async {
      return CommonLocalDataSource(
          StorageFactory.getStorage(
              isSecure: false, boxName: BoxName.retailerAppBoxName),
          StorageFactory.getStorage(isSecure: true));
    });
    getIt.registerSingleton<FeedbackApiService>(FeedbackApiService(
        getIt<Dio>(instanceName: AppConstants.baseUrlDioConstant)));
    getIt.registerSingleton<FeedbackRemoteDataSource>(FeedbackRemoteDataSource(
        feedbackApiService: getIt<FeedbackApiService>()));
    getIt.registerSingleton<FeedbackRepository>(FeedbackRepositoryImpl(
        feedbackRemoteDataSource: getIt<FeedbackRemoteDataSource>()));
    getIt.registerSingletonAsync<OnboardingLocalDBService>(() async {
      return OnboardingLocalDBService(BoxName.retailerAppBoxName);
    });
    getIt.registerLazySingleton<CoreRoutePaths>(() => RoutePaths());
    getIt.registerLazySingleton<OnboardingLegacyApiService>(() =>
        OnboardingLegacyApiService(
            getIt<Dio>(instanceName: AppConstants.legacyBaseUrlDioConstant)));
    getIt.registerLazySingleton<OnboardingApiService>(() =>
        OnboardingApiService(
            getIt<Dio>(instanceName: AppConstants.baseUrlDioConstant)));
    getIt.registerLazySingleton<OnboardingRemoteDataSource>(() =>
        OnboardingRemoteDataSource(getIt<OnboardingLegacyApiService>(),
            getIt<OnboardingApiService>()));

    getIt.registerSingletonWithDependencies<OnboardingRepository>(
        () => OnboardingRepositoryImpl(getIt<OnboardingRemoteDataSource>(),
            getIt<OnboardingLocalDBService>()),
        dependsOn: [OnboardingLocalDBService]);
    // getIt.registerLazySingleton<GetBouncedOrdersApiService>(() =>
    //     GetBouncedOrdersApiService(
    //         getIt<Dio>(instanceName: AppConstants.legacyBaseUrlDioConstant)));
    // getIt.registerLazySingleton<GetBouncedOrdersRemoteDataSource>(() =>
    //     GetBouncedOrdersRemoteDataSource(getIt<GetBouncedOrdersApiService>()));
    // getIt.registerLazySingleton<GetBouncedOrdersRepository>(() =>
    //     GetBouncedOrdersRepositoryImpl(
    //         getIt<GetBouncedOrdersRemoteDataSource>()));

    // getIt.registerLazySingleton<ViewBouncedOrderDetailsRemoteDataSource>(() =>
    //     ViewBouncedOrderDetailsRemoteDataSource(
    //         getIt<GetBouncedOrdersApiService>()));

    // getIt.registerLazySingleton<ViewBouncedOrderDetailsRepository>(() =>
    //     ViewBouncedOrderDetailsRepositoryImpl(
    //         getIt<ViewBouncedOrderDetailsRemoteDataSource>()));

    DistributorConnectionProviders.register(getIt);
    getIt.registerSingleton<UserAuthManager>(
        UserAuthManager(
            dio: getIt.get<Dio>(
                instanceName: AppConstants.legacyBaseUrlDioConstant)),
        instanceName: AppConstants.legacyBaseUrlUserAuthManager);
    getIt.registerSingleton<UserAuthManager>(
        UserAuthManager(
            dio: getIt.get<Dio>(instanceName: AppConstants.baseUrlDioConstant)),
        instanceName: AppConstants.baseUrlUserAuthManager);
    initChangePasswordDependency(getIt);

    //  Widgets Builder
    getIt.registerLazySingleton<WidgetBuilderApiService>(() =>
        WidgetBuilderApiService(
            getIt<Dio>(instanceName: AppConstants.baseUrlDioConstant)));
    getIt.registerLazySingleton<WidgetBuilderRepository>(
        () => WidgetBuilderRepository(getIt<WidgetBuilderApiService>()));

    ///Splash screen DI
    getIt.registerSingletonAsync<SplashScreenLocalDataSource>(() async {
      await initHive();

      return SplashScreenLocalDataSource(
        StorageFactory.getStorage(isSecure: true),
        StorageFactory.getStorage(
            isSecure: false, boxName: BoxName.retailerAppBoxName),
      );
    });
    await getIt.isReady<OnboardingRepository>();
    getIt.registerSingleton<SplashScreenRemoteDataSource>(
        SplashScreenRemoteDataSource(getIt<OnboardingApiService>()));

    getIt.registerSingletonWithDependencies<SplashScreenRepository>(
        () => SplashScreenRepositoryImpl(getIt<SplashScreenLocalDataSource>(),
            getIt<SplashScreenRemoteDataSource>()),
        dependsOn: [SplashScreenLocalDataSource]);
    await getIt.isReady<SplashScreenRepository>();
    await coreFlutterDI.isReady<CommonLocalDataSource>();

    getIt.registerSingleton<Flavor>(flavor);
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
    // NotificationDiProviders.register(getIt);
    // SpecialOfferProvider.register(getIt);
    BrowseCompaniesProviders.register(getIt);
    ChangeDistributorProviders.register(getIt);
    CartProvider.register(getIt);
    _addDioInterceptor();
  }

  void _addDioInterceptor() {
    getIt<Dio>(instanceName: AppConstants.baseUrlDioConstant).interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            await getIt<AutoLoginUtils>().checkTokenExpiration();
            return handler.resolve(
                await getIt<Dio>(instanceName: AppConstants.baseUrlDioConstant)
                    .fetch(e.requestOptions));
          }
          return handler.next(e);
        },
      ),
    );
  }

  initFlySDK(Flavor flavor) async {
    // if (flavor.env == Env.dev ||
    //     flavor.env == Env.qa ||
    //     flavor.env == Env.uat) {
    //   FlyyFlutterPlugin.setPackageName("pr.com.retailer");
    //   FlyyFlutterPlugin.initFlyySDK(
    //       "f941335e1d8a27af91f8", FlyyFlutterPlugin.STAGE);
    //   FlyyFlutterPlugin.setThemeColor("#1439BB", "#1439BB");

    //   getIt.registerSingleton<Dio>(
    //     DioInterceptor.createDio(
    //       DioBaseOption(
    //         baseUrl: flavor.flyBaseUrl,
    //         proxyBaseUrl: flavor.proxyBaseUrl,
    //       ),
    //     ),
    //     instanceName: AppConstants.flyBaseUrlDioConstant,
    //   );
    // }
    return "Initiated";
  }
}
