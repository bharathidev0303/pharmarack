import 'package:dio/dio.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/features/common/cubit/bottom_navigation_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/api_service/stockiest_priority_api_service.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/data_source/remote_data_source/stockiest_priority_remote_data_source.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/repository/stockiest_priority_repository_impl.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/repository/stockiest_priority_repository.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/stockiest_priority_use_case.dart';

void initDashboardDi() {
  getIt.registerFactory<StockiestPriorityApiService>(
    () => StockiestPriorityApiService(
      getIt<Dio>(instanceName: AppConstants.legacyBaseUrlDioConstant),
    ),
    instanceName: "dashboardApi",
  );

  getIt.registerFactory<StockiestPriorityRemoteDataSource>(
    () => StockiestPriorityRemoteDataSource(
      getIt<StockiestPriorityApiService>(instanceName: "dashboardApi"),
    ),
    instanceName: "dashboardRemote",
  );

  getIt.registerFactory<StockiestPriorityRepository>(
    () => StockiestPriorityRepositoryImpl(
      getIt<StockiestPriorityRemoteDataSource>(instanceName: "dashboardRemote"),
    ),
    instanceName: "dashboardStockiestRepo",
  );

  getIt.registerFactory<StockiestPriorityUseCase>(
    () => StockiestPriorityUseCase(
      getIt<StockiestPriorityRepository>(
          instanceName: "dashboardStockiestRepo"),
    ),
    instanceName: "dashboardPriorityUseCase",
  );
}

void clearDashboardDi() {
  getIt.unregister<StockiestPriorityApiService>(
    instanceName: "dashboardApi",
  );
  getIt.unregister<StockiestPriorityRemoteDataSource>(
    instanceName: "dashboardRemote",
  );
  getIt.unregister<StockiestPriorityRepository>(
    instanceName: "dashboardStockiestRepo",
  );
  getIt.unregister<StockiestPriorityUseCase>(
    instanceName: "dashboardPriorityUseCase",
  );
}

void registerBottomNavigationCubit() {
  if (getIt.isRegistered<BottomNavigationCubit>()) {
    getIt.unregister<BottomNavigationCubit>();
  }
  getIt.registerSingleton<BottomNavigationCubit>(BottomNavigationCubit(0));
}
