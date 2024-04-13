import 'package:get_it/get_it.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/features/change_distributor/data/change_distributor_api_service.dart';
import 'package:pharmarack/view/features/change_distributor/domain/fetch_product_distributors_use_case.dart';

import 'domain/change_distributor_repository.dart';
import 'presentation/bloc/change_distributor_dialog_cubit.dart';

class ChangeDistributorProviders {
  static void register(GetIt getIt) {
    getIt.registerFactory<ChangeDistributorsApiService>(
      () => ChangeDistributorsApiService(
        getIt.get(instanceName: AppConstants.baseUrlDioConstant),
      ),
    );
    getIt.registerFactory<ChangeDistributorRepository>(
      () => ChangeDistributorRepository(getIt.get()),
    );
    getIt.registerFactory<GetProductDistributorsUseCase>(
      () => GetProductDistributorsUseCase(getIt.get()),
    );
    getIt.registerFactory<ChangeDistributorDialogCubit>(
      () => ChangeDistributorDialogCubit(getIt.get(), getIt.get(), getIt.get()),
    );
  }
}
