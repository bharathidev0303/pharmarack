import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/packages/storage_utils/storage_factory.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/api_service/stockiest_priority_api_service.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/data_source/remote_data_source/stockiest_priority_remote_data_source.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/repository/stockiest_priority_repository_impl.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/repository/stockiest_priority_repository.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/stockiest_priority_use_case.dart';
import 'package:pharmarack/view/features/search_product/data/api_service/add_product_api_service.dart';
import 'package:pharmarack/view/features/search_product/data/api_service/search_product_api_service.dart';
import 'package:pharmarack/view/features/search_product/data/data_source/remote_data_source/add_product_remote_data_source.dart';
import 'package:pharmarack/view/features/search_product/data/data_source/remote_data_source/search_product_remote_data_source.dart';
import 'package:pharmarack/view/features/search_product/data/repository/search_product_repository_impl.dart';
import 'package:pharmarack/view/features/search_product/domain/repository/search_product_repository.dart';
import 'package:pharmarack/view/features/search_product/domain/use_case/add_product_to_cart_use_case.dart';
import 'package:pharmarack/view/features/search_product/domain/use_case/filter_search_product_use_case.dart';
import 'package:pharmarack/view/features/search_product/domain/use_case/search_product_use_case.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/add_product_to_cart_cubit.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/search_product_cubit.dart';
import '../data/repository/add_product_repository_impl.dart';
import '../domain/repository/add_product_repository.dart';

intProductDI() {
  if (!GetIt.instance.isRegistered<SearchProductApiService>()) {
    final searchProductApiService =
        getIt.registerSingleton<SearchProductApiService>(
            SearchProductApiService(getIt<Dio>(
                instanceName: AppConstants.baseUrlElasticSearchConstant)));
    final searchProductRemoteDataSource =
        getIt.registerSingleton<SearchProductRemoteDataSource>(
            SearchProductRemoteDataSource(
      searchProductApiService,
      StorageFactory.getStorage(isSecure: true),
    ));
    final searchProductRepository =
        getIt.registerSingleton<SearchProductRepository>(
            SearchProductRepositoryImpl(searchProductRemoteDataSource));

    final searchProductUseCase = getIt.registerSingleton<SearchProductUseCase>(
        SearchProductUseCase(searchProductRepository));

    final filterSearchProduct =
        getIt.registerSingleton<FilterSearchProductUseCase>(
            FilterSearchProductUseCase([]));

    getIt.registerSingleton<SearchProductCubit>(SearchProductCubit(
        searchProductUseCase,
        filterSearchProduct,
        getIt<StockiestPriorityUseCase>()));
  }
}

intCartDI() {
  if (!GetIt.instance.isRegistered<AddProductApiService>()) {
    final addProductApiService = getIt.registerSingleton<AddProductApiService>(
        AddProductApiService(
            getIt<Dio>(instanceName: AppConstants.baseUrlDioConstant)));
    final addProductRemoteDataSource =
        getIt.registerSingleton<AddProductRemoteDataSource>(
            AddProductRemoteDataSource(
      addProductApiService,
    ));
    getIt.registerSingleton<AddProductRepository>(
        AddProductRepositoryImpl(addProductRemoteDataSource));
  }
  // if (!GetIt.instance.isRegistered<AddProductToCartUseCase>()) {
  final addProductToCartUseCase =
      getIt.registerSingleton<AddProductToCartUseCase>(
          AddProductToCartUseCase(getIt<AddProductRepository>()));

  getIt.registerFactory<AddProductToCartCubit>(
      () => AddProductToCartCubit(addProductToCartUseCase));
  //}
}

deIntCartDI() {
  getIt.unregister<AddProductToCartUseCase>();
  getIt.unregister<AddProductToCartCubit>();
}

void initStockiestDI() {
  /// factory storing
  if (!GetIt.instance.isRegistered<StockiestPriorityApiService>()) {
    getIt.registerFactory<StockiestPriorityApiService>(
      () => StockiestPriorityApiService(
        getIt<Dio>(instanceName: AppConstants.baseUrlDioConstant),
      ),
    );
  }

  if (!GetIt.instance.isRegistered<StockiestPriorityRemoteDataSource>()) {
    getIt.registerFactory<StockiestPriorityRemoteDataSource>(
      () => StockiestPriorityRemoteDataSource(
        getIt<StockiestPriorityApiService>(),
      ),
    );
  }

  if (!GetIt.instance.isRegistered<StockiestPriorityRepository>()) {
    getIt.registerSingleton<StockiestPriorityRepository>(
      StockiestPriorityRepositoryImpl(
        getIt<StockiestPriorityRemoteDataSource>(),
      ),
    );
  }

  if (!GetIt.instance.isRegistered<StockiestPriorityUseCase>()) {
    getIt.registerFactory<StockiestPriorityUseCase>(
      () => StockiestPriorityUseCase(
        getIt<StockiestPriorityRepository>(),
      ),
    );
  }
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

void deInitProductDI() {
  if (getIt.isRegistered<AddProductApiService>()) {
    getIt.unregister<AddProductApiService>();
  }
  if (getIt.isRegistered<AddProductRemoteDataSource>()) {
    getIt.unregister<AddProductRemoteDataSource>();
  }
  if (getIt.isRegistered<AddProductRepository>()) {
    getIt.unregister<AddProductRepository>();
  }
  if (getIt.isRegistered<SearchProductApiService>()) {
    getIt.unregister<SearchProductApiService>();
  }

  if (getIt.isRegistered<SearchProductRemoteDataSource>()) {
    getIt.unregister<SearchProductRemoteDataSource>();
  }

  if (getIt.isRegistered<SearchProductRepository>()) {
    getIt.unregister<SearchProductRepository>();
  }

  if (getIt.isRegistered<SearchProductUseCase>()) {
    getIt.unregister<SearchProductUseCase>();
  }

  if (getIt.isRegistered<FilterSearchProductUseCase>()) {
    getIt.unregister<FilterSearchProductUseCase>();
  }

  if (getIt.isRegistered<SearchProductCubit>()) {
    getIt.unregister<SearchProductCubit>();
  }
}
