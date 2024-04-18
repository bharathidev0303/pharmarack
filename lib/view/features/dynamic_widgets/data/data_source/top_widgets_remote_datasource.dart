import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/topWidgetModels/ProductListModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/api_services/top_widgets_view_more_services.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/model/TopBrandsList.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/model/TopDistributorsList.dart';

class TopWidgetsViewMoresRemoteDataSource {
  final TopWidgetsViewMoreApiService _topWidgetsViewMoreEndPoints;
  final TopWidgetsViewMoreCmsApiService _topWidgetsViewMoreCmsApiService;

  TopWidgetsViewMoresRemoteDataSource(
      this._topWidgetsViewMoreEndPoints, this._topWidgetsViewMoreCmsApiService);

  Future<Either<NetworkError, List<TopBrandsLists>>> fetchBrandsList(
      {required int page, required int limit}) async {
    final response = await safeApiCall(_topWidgetsViewMoreEndPoints
        .fetchBrandsDetails(page: page, limit: limit));

    return response.fold((l) => left(l), (r) {
      final brands =
          r.data.data!.map((res) => TopBrandsLists.fromJson(res)).toList();

      return right(brands);
    });
  }

  Future<Either<NetworkError, List<TopDistributorsList>>> fetchDistributorsList(
      {required int page, required int limit}) async {
    int? rId = getIt<RetailerInfoEntity>().userId ?? 0;
    final response = await safeApiCall(_topWidgetsViewMoreEndPoints
        .fetchDistributorsDetails(rId: rId, page: page, limit: limit));

    return response.fold((l) => left(l), (r) {
      final distributors =
          r.data.data!.map((res) => TopDistributorsList.fromJson(res)).toList();

      return right(distributors);
    });
  }

  Future<Either<NetworkError, List<ProductListModel>>> fetchTopWidgetsProducts(
      {required int companyId,
      required int storeId,
      required String context}) async {
    int? rId = getIt<RetailerInfoEntity>().userId ?? 0;
    if (context == "picked" && storeId == 0) {
      final response = await safeApiCall(
          _topWidgetsViewMoreCmsApiService.fetchTopPicksProducts(rId: rId));

      return response.fold((l) => left(l), (r) {
        List<dynamic> listData = r.data as List<dynamic>;

        List<ProductListModel> data = listData
            .map((products) => ProductListModel.fromJson(products))
            .toList();
        return right(data);
      });
    } else if (context == "picked" && storeId != 0) {
      final response = await safeApiCall(_topWidgetsViewMoreCmsApiService
          .fetchTopPickStoreProducts(rId: rId, storeId: storeId));

      return response.fold((l) => left(l), (r) {
        List<dynamic> listData = r.data as List<dynamic>;

        List<ProductListModel> data = listData
            .map((products) => ProductListModel.fromJson(products))
            .toList();
        return right(data);
      });
    } else if (context == "offered" && companyId != 0) {
      final response = await safeApiCall(
          _topWidgetsViewMoreCmsApiService.fetchTopPicksProducts(rId: rId));

      return response.fold((l) => left(l), (r) {
        List<dynamic> listData = r.data as List<dynamic>;

        List<ProductListModel> data = listData
            .map((products) => ProductListModel.fromJson(products))
            .toList();
        return right(data);
      });
    } else {
      return right(List<ProductListModel>.empty());
    }
  }
}
