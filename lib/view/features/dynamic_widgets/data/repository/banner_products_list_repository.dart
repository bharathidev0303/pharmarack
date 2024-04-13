import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/api_services/banner_products_list_services.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/endpoints_constants/banner_products_list/banner_products_list_options.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/model/BannerProductsList.dart';

class BannerProductsListRepository {
  final BannerProductsListApiService _bannerProductsListApiService;

  BannerProductsListRepository(this._bannerProductsListApiService);

  Future<Either<NetworkError, List<BannerProductsList>>>
      fetchBannerProductsList({required String productIds}) async {
    final response = await safeApiCall(
        _bannerProductsListApiService.fetchProductsAcrossStoresNewPost({
      BannerProductsListOptions.containsProductIds: true,
      BannerProductsListOptions.productIds: productIds
    }));

    return response.fold((l) => left(l), (r) {
      final productList = r.data.productList!
          .map((res) => BannerProductsList.fromJson(res))
          .toList();
      return right(productList);
    });
  }
}
