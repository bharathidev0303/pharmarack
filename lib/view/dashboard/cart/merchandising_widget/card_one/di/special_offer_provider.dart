
import 'package:get_it/get_it.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/card_one/data/data_source/remote_data_source/card_one_remote_data_source.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/card_one/data/repository/special_offer_repository_impl.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/card_one/domain/repository/special_offer_repository.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/card_one/domain/use_case/special_offer_use_case.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/card_one/presentation/cubit/card_one_cubit.dart';

class SpecialOfferProvider {
  static void register(GetIt getIt) {
    // getIt.registerFactory<CardOneApiService>(
    //   () => CardOneApiService(getIt<Dio>(instanceName: 'apiCall')),
    // );
    getIt.registerFactory<CardOneRemoteDataSource>(
      () => CardOneRemoteDataSource(getIt()),
    );
    getIt.registerFactory<SpecailOfferRepository>(
      () => SpecailOfferRepositoryImpl(getIt()),
    );
    getIt.registerFactory<SpecialOfferUseCase>(
      () => SpecialOfferUseCase(getIt(), []),
    );
    getIt.registerFactory<CardOneCubit>(() => CardOneCubit(getIt()),
        instanceName: "cardCubit");
  }
}
