import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/main/connectivity/conectivity_cubit.dart';
import 'package:pharmarack/view/dashboard/cart/presentation/cubit/cart_screen_state.dart';

void registerConnectivityCubit() {
  if (getIt.isRegistered<ConnectivityCubit>()) {
    getIt.unregister<ConnectivityCubit>();
  }
  getIt.registerSingleton<ConnectivityCubit>(ConnectivityCubit(0));
}

class LoadingScreenCubit extends Cubit {
  LoadingScreenCubit(super.initialState);

  void startLoding() async {
    print("dsfsd");
    emit(CartScreenLoadingState());
  }

  void stopLoding() async {
    emit(const CartScreenErrorState());
  }
}
