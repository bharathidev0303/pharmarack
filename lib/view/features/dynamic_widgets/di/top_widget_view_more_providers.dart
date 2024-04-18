import 'package:dio/dio.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/api_services/top_widgets_view_more_services.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/data_source/top_widgets_remote_datasource.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/repository/top_widgets_view_more_repository.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/use_case/top_widgets_use_case.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/top_widgets_view_more/top_widgets_view_more_cubit.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/top_widgets_view_more/top_widgets_view_more_state.dart';

void initTopWidgetsViewMoreDi() {
  getIt.registerFactory<TopWidgetsViewMoreApiService>(
    () => TopWidgetsViewMoreApiService(
        getIt<Dio>(instanceName: AppConstants.baseUrlDioConstant)),
  );
  getIt.registerFactory<TopWidgetsViewMoreCmsApiService>(
    () => TopWidgetsViewMoreCmsApiService(
        getIt<Dio>(instanceName: AppConstants.cmsGatewayBaseUrlDioConstant)),
  );

  getIt.registerFactory<TopWidgetsViewMoresRemoteDataSource>(
    () => TopWidgetsViewMoresRemoteDataSource(
        getIt<TopWidgetsViewMoreApiService>(),
        getIt<TopWidgetsViewMoreCmsApiService>()),
  );

  getIt.registerFactory<TopWidgetsViewMoreRepository>(() =>
      TopWidgetsViewMoreRepository(
          getIt<TopWidgetsViewMoresRemoteDataSource>()));

  getIt.registerFactory<TopWidgetsViewMoreUseCase>(
      () => TopWidgetsViewMoreUseCase(getIt<TopWidgetsViewMoreRepository>()));

  // Register Cubits
  getIt.unregister<TopWidgetsViewMoreCubit>();

  getIt.registerSingleton<TopWidgetsViewMoreCubit>(
    TopWidgetsViewMoreCubit(
        TopWidgetsViewMoreState.initial(), getIt<TopWidgetsViewMoreUseCase>()),
  );
}

final topWidgetsViewMoreCubit = getIt.isRegistered<TopWidgetsViewMoreCubit>()
    ? getIt<TopWidgetsViewMoreCubit>()
    : getIt.registerSingleton(
        TopWidgetsViewMoreCubit(getIt(), getIt()),
      );

void clearTopWidgetsViewMorsDi() {
  getIt.unregister<TopWidgetsViewMoreApiService>();
  getIt.unregister<TopWidgetsViewMoreCmsApiService>();
  getIt.unregister<TopWidgetsViewMoresRemoteDataSource>();
  getIt.unregister<TopWidgetsViewMoreRepository>();
  getIt.unregister<TopWidgetsViewMoreUseCase>();
  getIt.unregister<TopWidgetsViewMoreCubit>();
}
