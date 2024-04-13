import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/features/search_product/domain/model/add_product_to_cart/add_product_to_cart_model.dart';
import 'package:pharmarack/view/features/search_product/domain/use_case/add_product_to_cart_use_case.dart';
import '../../api_service/add_product_api_service.dart';

/// This class [AddProductRemoteDataSource] is used to fetch Api from network
/// using [AddProductApiService] class.
class AddProductRemoteDataSource {
  final AddProductApiService _addProductApiService;

  AddProductRemoteDataSource(this._addProductApiService);

  Future<Either<NetworkError, AddProductToCartModel>> addProductToCart(
      AddProductToCartUseCaseParam param) async {
    final response = await safeApiCall(
        _addProductApiService.addProductToCartApi(
            storeId: param.addProductToCartParam.storeId,
            quantity: param.addProductToCartParam.quantity,
            cartSource: param.addProductToCartParam.cartSource,
            gSTPercentage: param.addProductToCartParam.gSTPercentage,
            hiddenPTR: param.addProductToCartParam.hiddenPTR,
            isDODPreferenceSet: param.addProductToCartParam.isDODPreferenceSet,
            isDODProductCheck: param.addProductToCartParam.isDODProductCheck,
            isDODProductSelected:
                param.addProductToCartParam.isDODProductSelected,
            productCode: param.addProductToCartParam.productCode,
            ptr: param.addProductToCartParam.ptr));

    return response.fold((l) => left(l), (r) {
      return Right(AddProductToCartModel(
          statusCode: r.data.statusCode ?? 0, message: r.data.message ?? ""));
    });
  }
}
