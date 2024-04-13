import 'package:dio/dio.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/search_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/api_service/stockiest_priority_api_service.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/data_source/remote_data_source/stockiest_priority_remote_data_source.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/repository/stockiest_priority_repository_impl.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/repository/stockiest_priority_repository.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/mapped_non_mapped_search_use_case.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/non_mapped_distributors_use_case.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/save_distributor_priorities_use_case.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/stockiest_priority_use_case.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/store_request_mapping_use_case.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/distributor_mapped_tab_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/save_priority_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/send_request_mapping_cubit.dart';

void initStockiestDi() {
  /// factory storing
  getIt.registerFactory<StockiestPriorityApiService>(
    () => StockiestPriorityApiService(
      getIt<Dio>(instanceName: AppConstants.baseUrlDioConstant),
    ),
    instanceName: "stockiestApi",
  );

  getIt.registerFactory<StockiestPriorityRemoteDataSource>(
    () => StockiestPriorityRemoteDataSource(
      getIt<StockiestPriorityApiService>(instanceName: "stockiestApi"),
    ),
    instanceName: "stockiestRemote",
  );

  getIt.registerFactory<StockiestPriorityUseCase>(
    () => StockiestPriorityUseCase(
      getIt<StockiestPriorityRepository>(
          instanceName: "stockiestPriorityRepository"),
    ),
    instanceName: "stockiestPriorityUseCase",
  );

  getIt.registerFactory<NonMappedDistributorsUseCase>(
    () => NonMappedDistributorsUseCase(
      getIt<StockiestPriorityRepository>(
          instanceName: "stockiestPriorityRepository"),
    ),
  );

  getIt.registerFactory<MappedNonMappedSearchUseCase>(
    () => MappedNonMappedSearchUseCase(
      mappedList: [],
      nonMappedList: [],
    ),
  );

  getIt.registerFactory<SaveDistributorPrioritiesUseCase>(
    () => SaveDistributorPrioritiesUseCase(
      stockiestPriorityRepository: getIt<StockiestPriorityRepository>(
          instanceName: "stockiestPriorityRepository"),
    ),
  );

  getIt.registerFactory<StoreRequestMappingUseCase>(
    () => StoreRequestMappingUseCase(
      stockiestPriorityRepository: getIt<StockiestPriorityRepository>(
          instanceName: "stockiestPriorityRepository"),
    ),
  );

  /// singleton storing
  getIt.registerSingleton<StockiestPriorityRepository>(
    StockiestPriorityRepositoryImpl(
      getIt<StockiestPriorityRemoteDataSource>(instanceName: "stockiestRemote"),
    ),
    instanceName: "stockiestPriorityRepository",
  );

  getIt.registerSingleton<SearchCubit>(
    SearchCubit(""),
  );

  getIt.registerSingleton<SearchCubit>(SearchCubit(""),
      instanceName: "partyCode");

  getIt.registerSingleton<SavePriorityCubit>(
    SavePriorityCubit(
      getIt<SaveDistributorPrioritiesUseCase>(),
    ),
  );

  getIt.registerSingleton<DistributorMappedTabCubit>(
    DistributorMappedTabCubit(
      getIt<StockiestPriorityUseCase>(instanceName: "stockiestPriorityUseCase"),
      getIt<NonMappedDistributorsUseCase>(),
      getIt<MappedNonMappedSearchUseCase>(),
      getIt<SearchCubit>(),
      getIt<SavePriorityCubit>(),
    ),
  );

  getIt.registerSingleton<SendRequestMappingCubit>(
    SendRequestMappingCubit(
      getIt<StoreRequestMappingUseCase>(),
      getIt<DistributorMappedTabCubit>(),
    ),
  );
}

Future<void> clearStockiestDi() async {
  await getIt.unregister<StockiestPriorityApiService>(
    instanceName: "stockiestApi",
  );

  await getIt.unregister<StockiestPriorityRemoteDataSource>(
    instanceName: "stockiestRemote",
  );

  await getIt.unregister<StockiestPriorityUseCase>(
    instanceName: "stockiestPriorityUseCase",
  );

  await getIt.unregister<StockiestPriorityRepository>(
    instanceName: "stockiestPriorityRepository",
  );
  await getIt.unregister<NonMappedDistributorsUseCase>();
  await getIt.unregister<MappedNonMappedSearchUseCase>();
  await getIt.unregister<SaveDistributorPrioritiesUseCase>();
  await getIt.unregister<StoreRequestMappingUseCase>();
  await getIt.unregister<SendRequestMappingCubit>();
  await getIt.unregister<SavePriorityCubit>();
  await getIt.unregister<DistributorMappedTabCubit>();
  await getIt.unregister<SearchCubit>();
  await getIt.unregister<SearchCubit>(instanceName: "partyCode");
}
