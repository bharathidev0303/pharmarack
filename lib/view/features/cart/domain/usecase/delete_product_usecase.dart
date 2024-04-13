import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/cart/domain/model/cart_details_model.dart';
import 'package:pharmarack/view/features/cart/domain/repository/cart_repository.dart';

class DeleteProductUseCase
    extends BaseUseCase<BaseError, DeleteProductParams, CartDetailsModel?> {
  final CartRepository _cartRepository;

  DeleteProductUseCase(this._cartRepository);

  @override
  Future<Either<BaseError, CartDetailsModel?>> execute(
      {required DeleteProductParams params}) async {
    return _cartRepository.deleteProduct(params.deleteProductRequestParam);
  }
}

class DeleteProductParams extends Params {
  final DeleteProductRequestParam deleteProductRequestParam;

  DeleteProductParams({required this.deleteProductRequestParam});
}

class DeleteProductRequestParam {
  final String storeId;
  final String productCode;

  DeleteProductRequestParam({required this.storeId, required this.productCode});
}
