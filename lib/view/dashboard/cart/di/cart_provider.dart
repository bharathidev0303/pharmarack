import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/dashboard/cart/data/api_service/cart_api_service.dart';
import 'package:pharmarack/view/dashboard/cart/data/data_source/cart_remote_datasource.dart';
import 'package:pharmarack/view/dashboard/cart/data/repository/cart_details_repository_impl.dart';
import 'package:pharmarack/view/dashboard/cart/domain/repository/cart_repository.dart';
import 'package:pharmarack/view/dashboard/cart/domain/usecase/add_change_cart_usecase.dart';
import 'package:pharmarack/view/dashboard/cart/domain/usecase/cart_details_usecase.dart';
import 'package:pharmarack/view/dashboard/cart/domain/usecase/cencel_order_usecase.dart';
import 'package:pharmarack/view/dashboard/cart/domain/usecase/delete_product_usecase.dart';
import 'package:pharmarack/view/dashboard/cart/domain/usecase/place_order_usecase.dart';
import 'package:pharmarack/view/dashboard/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:pharmarack/view/dashboard/cart/presentation/cubit/draggable_cart/cubit/draggable_cart_cubit.dart';

class CartProvider {
  static void register(GetIt getIt) {
    getIt.registerSingleton<CartApiService>(CartApiService(
        getIt<Dio>(instanceName: AppConstants.baseUrlDioConstant)));

    getIt
        .registerSingleton<CartRemoteDataSource>(CartRemoteDataSource(getIt()));

    getIt.registerSingleton<CartRepository>(CartRepositoryImpl(getIt()));

    getIt.registerSingleton<CartDetailsUseCase>(CartDetailsUseCase(getIt()));

    getIt.registerSingleton(AddChangeCartUseCase(getIt()));

    getIt
        .registerSingleton<DeleteProductUseCase>(DeleteProductUseCase(getIt()));

    getIt.registerSingleton<PlaceOrderUseCase>(PlaceOrderUseCase(getIt()));
    getIt.registerSingleton<CancelOrderUseCase>(CancelOrderUseCase(getIt()));
  }
}


final cartScreenCubit = getIt.registerSingleton(
  CartScreenCubit(
    getIt(),
    getIt(),
    getIt(),
    getIt(),
    getIt(),
  ),
);

final draggableCartScreenCubit = getIt.isRegistered<DraggableCartScreenCubit>()
    ? getIt<DraggableCartScreenCubit>()
    : getIt.registerSingleton(
        DraggableCartScreenCubit(
          getIt(),
          getIt(),
        ),
      );
