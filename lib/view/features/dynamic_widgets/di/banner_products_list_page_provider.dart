import 'package:dio/dio.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/api_services/banner_products_list_services.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/repository/banner_products_list_repository.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/banner_products_list_page/banner_products_list_page_cubit.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/banner_products_list_page/banner_products_list_page_state.dart';

void initBannerProductsListDi() {
  getIt.registerFactory<BannerProductsListApiService>(
    () => BannerProductsListApiService(
        getIt<Dio>(instanceName: AppConstants.baseUrlDioConstant)),
  );

  getIt.registerFactory<BannerProductsListRepository>(() =>
      BannerProductsListRepository(getIt<BannerProductsListApiService>()));

  // Register Cubits
  getIt.unregister<BannerProductsListCubit>();

  getIt.registerSingleton<BannerProductsListCubit>(
    BannerProductsListCubit(BannerProductsListState.initial(),
        getIt<BannerProductsListRepository>()),
  );
}

final bannerProductsListCubit = getIt.isRegistered<BannerProductsListCubit>()
    ? getIt<BannerProductsListCubit>()
    : getIt.registerSingleton(
        BannerProductsListCubit(getIt(), getIt()),
      );

void clearBannerProductsListDi() {
  getIt.unregister<BannerProductsListApiService>();
  getIt.unregister<BannerProductsListRepository>();
  getIt.unregister<BannerProductsListCubit>();
}
