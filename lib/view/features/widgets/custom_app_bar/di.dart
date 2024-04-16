import 'package:get_it/get_it.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/stockiest_priority_use_case.dart';
import 'package:pharmarack/view/features/widgets/custom_app_bar/custom_app_bar_cubit.dart';

import '../dropdown/distributor_drop_down/cubit/distributor_drop_down_cubit.dart';
import '../dropdown/distributor_drop_down/use_case/distributor_drop_down_use_case.dart';

final getIt = GetIt.instance;

void initDI() {
  getIt.registerSingleton<CustomAppBarCubit>(CustomAppBarCubit());
  getIt.registerFactory<DistributorDropDownUseCase>(
      () => DistributorDropDownUseCase());
  getIt.registerFactory<DistributorDropDownCubit>(() =>
      DistributorDropDownCubit(getIt<DistributorDropDownUseCase>(), 
          getIt<StockiestPriorityUseCase>()));
}

void deInitDI() {
  if (getIt.isRegistered<CustomAppBarCubit>()) {
    getIt.unregister<CustomAppBarCubit>();
  }
  if (getIt.isRegistered<DistributorDropDownUseCase>()) {
    getIt.unregister<DistributorDropDownUseCase>();
  }
  if (getIt.isRegistered<DistributorDropDownCubit>()) {
    getIt.unregister<DistributorDropDownCubit>();
  }
}
