import 'package:dio/dio.dart';
import 'package:pharmarack/packages/core/log_util/log_util.dart';
import 'package:pharmarack/view/features/change_distributor/data/product_distributors_response_entity.dart';
import 'package:pharmarack/view/features/change_distributor/domain/no_distributors_found_exception.dart';

import '../data/change_distributor_api_service.dart';

class ChangeDistributorRepository {
  final ChangeDistributorsApiService _apiService;

  ChangeDistributorRepository(this._apiService);

  Future<ProductDistributorsResponseEntity> getProductDistributors(
    int productId,
    int pageNo,
  ) async {
    return await _apiService.fetchProductDistributors(productId, pageNo).then(
      (value) {
        final data = value.data!;
        if (data.distributors.isEmpty) {
          throw NoDistributorsFoundException(value.data!.productName);
        }
        return data;
      },
    ).onError<DioException>(
      (error, stackTrace) {
        LogUtil.error(
          'Error fetching product distributors',
          error: error.error,
          stackTrace: stackTrace,
        );
        throw error;
      },
    );
  }
}
