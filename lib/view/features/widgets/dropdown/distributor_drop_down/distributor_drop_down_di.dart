import 'package:dio/dio.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/api_service/stockiest_priority_api_service.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/data_source/remote_data_source/stockiest_priority_remote_data_source.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/repository/stockiest_priority_repository_impl.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/repository/stockiest_priority_repository.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/stockiest_priority_use_case.dart';

void initStockiestDI() {
  /// factory storing
  getIt.registerFactory<StockiestPriorityApiService>(
    () => StockiestPriorityApiService(
      getIt<Dio>(instanceName: AppConstants.legacyBaseUrlDioConstant),
    ),
  );

  getIt.registerFactory<StockiestPriorityRemoteDataSource>(
    () => StockiestPriorityRemoteDataSource(
      getIt<StockiestPriorityApiService>(),
    ),
  );
  getIt.registerSingleton<StockiestPriorityRepository>(
    StockiestPriorityRepositoryImpl(
      getIt<StockiestPriorityRemoteDataSource>(),
    ),
  );

  getIt.registerFactory<StockiestPriorityUseCase>(
    () => StockiestPriorityUseCase(
      getIt<StockiestPriorityRepository>(),
    ),
  );
}

void deInitStockiestDI() {
  if (getIt.isRegistered<StockiestPriorityApiService>()) {
    getIt.unregister<StockiestPriorityApiService>();
  }

  if (getIt.isRegistered<StockiestPriorityRemoteDataSource>()) {
    getIt.unregister<StockiestPriorityRemoteDataSource>();
  }

  if (getIt.isRegistered<StockiestPriorityRepository>()) {
    getIt.unregister<StockiestPriorityRepository>();
  }

  if (getIt.isRegistered<StockiestPriorityUseCase>()) {
    getIt.unregister<StockiestPriorityUseCase>();
  }
}
