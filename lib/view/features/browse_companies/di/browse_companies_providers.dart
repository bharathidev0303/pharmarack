import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/search_cubit.dart';
import 'package:pharmarack/view/features/browse_companies/data/api_service/browse_companies_api_service.dart';
import 'package:pharmarack/view/features/browse_companies/data/data_source/remote_data_source/browse_companies_remote_data_source.dart';
import 'package:pharmarack/view/features/browse_companies/data/repository/browse_companies_repository_impl.dart';
import 'package:pharmarack/view/features/browse_companies/domain/repository/browse_companies_repository.dart';
import 'package:pharmarack/view/features/browse_companies/domain/use_case/browse_companies_use_case.dart';
import 'package:pharmarack/view/features/browse_companies/presentation/cubit/browse_companies_cubit.dart';

class BrowseCompaniesProviders {
  static void register(GetIt getIt) {
    getIt.registerFactory<BrowseCompaniesApiService>(
      () => BrowseCompaniesApiService(
          getIt<Dio>(instanceName: AppConstants.baseUrlDioConstant)),
    );
    getIt.registerFactory<BrowseCompaniesRemoteDataSource>(
      () => BrowseCompaniesRemoteDataSource(getIt()),
    );
    getIt.registerFactory<BrowseCompaniesRepository>(
      () => BrowseCompaniesRepositoryImpl(getIt()),
    );
    getIt.registerFactory<BrowseCompaniesUseCase>(
      () => BrowseCompaniesUseCase(getIt(), []),
    );
    getIt.registerFactory<SearchCubit>(() => SearchCubit(""),
        instanceName: "browseCompaniesSearch");
    getIt.registerFactory<BrowseCompaniesCubit>(
      () => BrowseCompaniesCubit(getIt()),
    );
  }
}
