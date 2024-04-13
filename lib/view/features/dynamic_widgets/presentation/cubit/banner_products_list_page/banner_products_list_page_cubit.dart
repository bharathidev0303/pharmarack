import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/repository/banner_products_list_repository.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/banner_products_list_page/banner_products_list_page_state.dart';

/// This class [BannerProductsListCubit] is consume by the [BannerProductsList]
/// where all state will observed by [BannerProductsList]
class BannerProductsListCubit extends Cubit<BannerProductsListState> {
  final BannerProductsListRepository _bannerProductsListRepository;

  BannerProductsListCubit(
      super.initialState, this._bannerProductsListRepository);

  void fetchBannerProductsList({required String productIds}) async {
    emit(BannerProductsListLoadingState());
    final value = await _bannerProductsListRepository.fetchBannerProductsList(
        productIds: productIds);
    value.fold((l) {
      emit(BannerProductsListErrorState());
    }, (r) {
      emit(BannerProductsListDataState(bannerProductsList: r));
    });
  }
}
