import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/app_error.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/core_flutter/error/error_info.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/utils/retailer_app_constants.dart';
import 'package:pharmarack/view/features/cart/domain/repository/cart_repository.dart';

import '../model/add_product_to_cart_param.dart';
import '../model/cart_details_model.dart';

class AddChangeCartUseCase
    extends BaseUseCase<BaseError, AddChangeCartParam, CartDetailsModel?> {
  final CartRepository _cartRepository;

  AddChangeCartUseCase(this._cartRepository);

  @override
  Future<Either<BaseError, CartDetailsModel?>> execute(
      {required AddChangeCartParam params}) {
    return _cartRepository.addProductToCart(params);
  }

  Either<AppError, bool> validateQuantity(
      String value, CartListItemModel cartItem) {
    if (value.isEmpty) {
      return Left(AppError(
        error: ErrorInfo(
          message: retailerAppLevelKey
              .currentContext!.localizedString.pleaseEnterTheQuantity,
        ),
      ));
    } else if (int.parse(value) <= 0) {
      return Left(
        AppError(
          error: ErrorInfo(
            message: retailerAppLevelKey
                .currentContext!.localizedString.zeroQuantity,
          ),
        ),
      );
    } else if (cartItem.stepUpValue != 0 &&
        int.parse(value) % cartItem.stepUpValue! != 0) {
      return Left(
        AppError(
          error: ErrorInfo(
            message:
                'Please Add Products in Multiple of ${cartItem.stepUpValue}',
          ),
        ),
      );
    }

    /*else if (int.parse(value) > available) {
      return Left(
        AppError(
          error: ErrorInfo(
            message: "$available units in stock.",
          ),
        ),
      );
    }*/
    else {
      return const Right(true);
    }
  }
}

class AddChangeCartParam extends Params {
  final AddProductToCartParams addProductToCartParam;

  AddChangeCartParam({required this.addProductToCartParam});
}
