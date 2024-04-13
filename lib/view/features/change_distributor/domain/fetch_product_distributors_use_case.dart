import 'package:pharmarack/view/features/change_distributor/data/product_distributors_response_entity.dart';

import 'change_distributor_repository.dart';

class GetProductDistributorsUseCase {
  final ChangeDistributorRepository _repository;

  GetProductDistributorsUseCase(this._repository);

  Future<ProductDistributorsResponseEntity> call(
      int productId, int pageNo) async {
    return await _repository.getProductDistributors(productId, pageNo);
  }
}
