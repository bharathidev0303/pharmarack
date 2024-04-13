import 'package:dio/dio.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/cubit/fly_milestone/milestone_cubit.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/cubit/fly_milestone/milestone_state.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/api_services/fly_services.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/repository/fly_repository.dart';

void initFlyMileStoneDi() {
  getIt.registerFactory<FlyApiService>(
    () => FlyApiService(
        getIt<Dio>(instanceName: AppConstants.flyBaseUrlDioConstant)),
  );

  getIt.registerFactory<FlyRepository>(
    () => FlyRepository(getIt<FlyApiService>()),
  );

  // Register Cubits
  getIt.unregister<MileStoneCubit>();

  getIt.registerSingleton<MileStoneCubit>(
    MileStoneCubit(MileStoneState.initial(), getIt<FlyRepository>()),
  );
}

final mileStoneCubit = getIt.isRegistered<MileStoneCubit>()
    ? getIt<MileStoneCubit>()
    : getIt.registerSingleton(
        MileStoneCubit(getIt(), getIt()),
      );

void clearFlyMileStoneDi() {
  getIt.unregister<FlyApiService>();
  getIt.unregister<FlyRepository>();
  getIt.unregister<MileStoneCubit>();
}
