import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/feedback/domain/usecase/save_feedback_usecase.dart';
import 'package:pharmarack/feedback/presentation/cubit/feedback_screen_cubit.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/packages/storage_utils/storage_factory.dart';
import 'package:pharmarack/view/dashboard/order_history/data/api_service/order_history_api_service.dart';
import 'package:pharmarack/view/dashboard/order_history/data/api_service/order_history_api_service_legacy.dart';
import 'package:pharmarack/view/dashboard/order_history/data/data_source/order_history_remote_datasoruce.dart';
import 'package:pharmarack/view/dashboard/order_history/data/repository/order_histroy_repository_impl.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/repository/order_history_repository.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/display_orders_usecase.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/order_history_detail_use_case.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/order_history_filter_use_case.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/reorder_use_case.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/order_history_cubit.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/order_history_detail_cubit.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/order_history_detail_state.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/order_history_filter_cubit.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/reorder_cubit.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/reorder_state.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/search_bar_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/api_service/stockiest_priority_api_service.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/data_source/remote_data_source/stockiest_priority_remote_data_source.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/data/repository/stockiest_priority_repository_impl.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/repository/stockiest_priority_repository.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/stockiest_priority_use_case.dart';
import 'package:pharmarack/view/features/search_product/data/api_service/search_product_api_service.dart';
import 'package:pharmarack/view/features/search_product/data/data_source/remote_data_source/search_product_remote_data_source.dart';
import 'package:pharmarack/view/features/search_product/data/repository/search_product_repository_impl.dart';
import 'package:pharmarack/view/features/search_product/domain/repository/search_product_repository.dart';
import 'package:pharmarack/view/features/search_product/domain/use_case/filter_search_product_use_case.dart';
import 'package:pharmarack/view/features/search_product/domain/use_case/search_product_use_case.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/search_product_cubit.dart';
import 'package:pharmarack/view/features/widgets/custom_app_bar/custom_app_bar_cubit.dart';
import 'package:pharmarack/view/features/widgets/dropdown/distributor_drop_down/cubit/distributor_drop_down_cubit.dart';
import 'package:pharmarack/view/features/widgets/dropdown/distributor_drop_down/use_case/distributor_drop_down_use_case.dart';

final getIt = GetIt.instance;

final orderHistoryApiServiceLegacy =
    getIt.registerSingleton<OrderHistoryApiServiceLegacy>(
        OrderHistoryApiServiceLegacy(
            getIt<Dio>(instanceName: AppConstants.legacyBaseUrlDioConstant)));

final orderHistoryApiService = getIt.registerSingleton<OrderHistoryApiService>(
    OrderHistoryApiService(
        getIt<Dio>(instanceName: AppConstants.baseUrlDioConstant)));

final orderHistoryRemoteDataSource =
    getIt.registerSingleton<OrderHistoryRemoteDataSource>(
        OrderHistoryRemoteDataSource(
            orderHistoryApiServiceLegacy, orderHistoryApiService));

final orderHistoryRepository = getIt.registerSingleton<OrderHistoryRepository>(
    OrderHistoryRepositoryImpl(orderHistoryRemoteDataSource));

final displayOrderUseCase = getIt.registerSingleton<DisplayOrdersUseCase>(
    DisplayOrdersUseCase(orderHistoryRepository));

final searchBarCubit =
    getIt.registerSingleton<SearchBarCubit>(SearchBarCubit());

void initOrderHistoryPageDI() {
  getIt.registerFactory<OrderHistoryCubit>(
      () => OrderHistoryCubit(displayOrderUseCase));
  getIt.registerSingleton<SaveFeedbackUseCase>(
    SaveFeedbackUseCase(feedbackRepository: getIt()),
  );
  getIt.registerFactory<FeedbackScreenCubit>(
    () => FeedbackScreenCubit(saveFeedbackUseCase: getIt()),
  );

  if (getIt.isRegistered<CustomAppBarCubit>()) {
    getIt.unregister<CustomAppBarCubit>();
  } else {
    getIt.registerSingleton<CustomAppBarCubit>(CustomAppBarCubit());
  }
  if (getIt.isRegistered<DistributorDropDownUseCase>()) {
    getIt.unregister<DistributorDropDownUseCase>();
  } else {
    getIt.registerFactory<DistributorDropDownUseCase>(
        () => DistributorDropDownUseCase());
  }
  if (getIt.isRegistered<DistributorDropDownCubit>()) {
    getIt.unregister<DistributorDropDownCubit>();
  } else {
    getIt.registerFactory<DistributorDropDownCubit>(() =>
        DistributorDropDownCubit(getIt<DistributorDropDownUseCase>(),
            getIt<StockiestPriorityUseCase>()));
  }
}

void initStockiestDI() {
  /// factory storing
  if (!getIt.isRegistered<StockiestPriorityApiService>()) {
    getIt.registerFactory<StockiestPriorityApiService>(
      () => StockiestPriorityApiService(
        getIt<Dio>(instanceName: AppConstants.baseUrlDioConstant),
      ),
    );
  }

  if (!getIt.isRegistered<StockiestPriorityRemoteDataSource>()) {
    getIt.registerFactory<StockiestPriorityRemoteDataSource>(
      () => StockiestPriorityRemoteDataSource(
        getIt<StockiestPriorityApiService>(),
      ),
    );
  }

  if (!getIt.isRegistered<StockiestPriorityRepository>()) {
    getIt.registerSingleton<StockiestPriorityRepository>(
      StockiestPriorityRepositoryImpl(
        getIt<StockiestPriorityRemoteDataSource>(),
      ),
    );
  }

  if (!getIt.isRegistered<StockiestPriorityUseCase>()) {
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

void initOrderHistoryDI() {
  getIt.registerFactory<OrderHistoryDetailUseCase>(
    () => OrderHistoryDetailUseCase(orderHistoryRepository),
  );

  getIt.registerFactory<ReorderUseCase>(
    () => ReorderUseCase(orderHistoryRepository),
  );
  getIt.registerSingleton<OrderHistoryDetailCubit>(
    OrderHistoryDetailCubit(
      OrderHistoryDetailState.initial(),
      getIt<OrderHistoryDetailUseCase>(),
    ),
  );

  getIt.registerSingleton<ReorderCubit>(
    ReorderCubit(
      ReorderState.initial(),
      getIt<ReorderUseCase>(),
    ),
  );
}

intProductDI() {
  if (!getIt.isRegistered<SearchProductApiService>()) {
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

void deInitProductDI() {
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

final orderHistoryFilterUseCase =
    getIt.registerSingleton<OrderHistoryFilterUseCase>(
        OrderHistoryFilterUseCase(orderHistoryRepository));

final orderHistoryFilterCubit =
    getIt.registerSingleton<OrderHistoryFilterCubit>(
        OrderHistoryFilterCubit(orderHistoryFilterUseCase));

void clearOrderHistoryDI() {
  getIt.unregister<OrderHistoryCubit>();
  getIt.unregister<FeedbackScreenCubit>();
  getIt.unregister<SaveFeedbackUseCase>();
}

void clearOrderDetailsDI() {
  getIt.unregister<OrderHistoryDetailCubit>();
  getIt.unregister<OrderHistoryDetailUseCase>();
  getIt.unregister<OrderHistoryCubit>();
  getIt.unregister<ReorderCubit>();
  getIt.unregister<ReorderUseCase>();
}
