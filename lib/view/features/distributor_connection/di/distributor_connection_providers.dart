import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/features/distributor_connection/domain/usecase/add_distributor_usecase.dart';
import 'package:pharmarack/view/features/distributor_connection/presentation/cubit/distributor_connection_add_tab_cubit.dart';

import '../data/api/distributor_connection_api_service.dart';
import '../domain/repository/distributor_connection_repository.dart';
import '../domain/usecase/get_nonmapped_stores_usecase.dart';
import '../domain/usecase/request_store_mapping_usecase.dart';
import '../presentation/cubit/request_distributor_connection_cubit.dart';

class DistributorConnectionProviders {
  DistributorConnectionProviders._();

  static void register(GetIt getIt) {
    getIt.registerLazySingleton<DistributorConnectionApiService>(
      () => DistributorConnectionApiService(
          getIt<Dio>(instanceName: AppConstants.baseUrlDioConstant)),
    );
    getIt.registerFactory<DistributorConnectionRepository>(
      () => DistributorConnectionRepository(
        getIt<DistributorConnectionApiService>(),
        getIt<RetailerInfoEntity>(),
      ),
    );
    getIt.registerFactory<RequestStoreMappingUseCase>(
      () => RequestStoreMappingUseCase(
        getIt<DistributorConnectionRepository>(),
      ),
    );
    getIt.registerFactory<GetNonmappedStoresUseCase>(
      () => GetNonmappedStoresUseCase(
        getIt<DistributorConnectionRepository>(),
      ),
    );
    getIt.registerFactory<RequestDistributorConnectionCubit>(
      () => RequestDistributorConnectionCubit(
        getIt<GetNonmappedStoresUseCase>(),
        getIt<RequestStoreMappingUseCase>(),
      ),
    );
    getIt.registerFactory<AddDistributorUseCase>(
      () => AddDistributorUseCase(getIt<DistributorConnectionRepository>()),
    );
    getIt.registerFactory<DistributorConnectionAddTabCubit>(
      () => DistributorConnectionAddTabCubit(getIt<AddDistributorUseCase>()),
    );
  }
}
