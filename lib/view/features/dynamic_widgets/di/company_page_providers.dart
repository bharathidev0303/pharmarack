import 'package:dio/dio.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/api_services/dynamic_widget_services.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/data_source/dynamic_widgets_remote_datasource.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/repository/dynamic_widgets_repository.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/use_case/dynamic_widgets_use_case.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/company_page/company_page_cubit.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/company_page/company_page_state.dart';

void initCompanyPageDi() {
  getIt.registerFactory<DynamicWidgetApiService>(
    () => DynamicWidgetApiService(
        getIt<Dio>(instanceName: AppConstants.cmsGatewayBaseUrlDioConstant)),
  );

  getIt.registerFactory<DynamicWidgetsRemoteDataSource>(
    () => DynamicWidgetsRemoteDataSource(getIt<DynamicWidgetApiService>()),
  );

  getIt.registerFactory<DynamicWidgetRepository>(
      () => DynamicWidgetRepository(getIt<DynamicWidgetsRemoteDataSource>()));

  getIt.registerFactory<DynamicWidgetsUseCase>(
      () => DynamicWidgetsUseCase(getIt<DynamicWidgetRepository>()));

  // Register Cubits
  getIt.unregister<CompanyPageCubit>();

  getIt.registerSingleton<CompanyPageCubit>(
    CompanyPageCubit(
        CompanyPageState.initial(), getIt<DynamicWidgetsUseCase>()),
  );
}

final companyPageScreenCubit = getIt.isRegistered<CompanyPageCubit>()
    ? getIt<CompanyPageCubit>()
    : getIt.registerSingleton(
        CompanyPageCubit(getIt(), getIt()),
      );

void clearCompanyPageDi() {
  getIt.unregister<DynamicWidgetApiService>();
  getIt.unregister<DynamicWidgetsRemoteDataSource>();
  getIt.unregister<DynamicWidgetRepository>();
  getIt.unregister<DynamicWidgetsUseCase>();
  getIt.unregister<CompanyPageCubit>();
}
