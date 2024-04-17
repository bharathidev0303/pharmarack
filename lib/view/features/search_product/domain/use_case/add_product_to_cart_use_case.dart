import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/app_error.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/core_flutter/error/error_info.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/utils/retailer_app_constants.dart';
import 'package:pharmarack/view/dashboard/cart/domain/model/add_product_to_cart_param.dart';
import 'package:pharmarack/view/dashboard/cart/presentation/cubit/draggable_cart/cubit/draggable_cart_cubit.dart';
import 'package:pharmarack/view/features/search_product/domain/model/add_product_to_cart/add_product_to_cart_model.dart';
import '../model/search_product/search_product_model.dart';
import '../repository/add_product_repository.dart';

class AddProductToCartUseCase extends BaseUseCase<BaseError,
    AddProductToCartUseCaseParam, AddProductToCartModel> {
  final AddProductRepository _addProductRepository;

  AddProductToCartUseCase(this._addProductRepository);

  @override
  Future<Either<BaseError, AddProductToCartModel>> execute(
      {required AddProductToCartUseCaseParam params}) {
    return _addProductRepository.addProductToCart(params);
  }

  Either<AppError, bool> validateQuantity(
      String value, SearchProductListModel productData, BuildContext context) {
    var data = getIt<RetailerInfoEntity>()
        .stores
        ?.where((element) => element.storeId == productData.storeId)
        .first;
    int minMaxItemsLength = getIt<DraggableCartScreenCubit>()
        .stores
        .where((element) => element.storeId == productData.storeId)
        .length;

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
    } else if (productData.stepUpValue != null &&
        productData.stepUpValue != 0 &&
        int.parse(value) % productData.stepUpValue! != 0) {
      return Left(
        AppError(
          error: ErrorInfo(
            message:
                'Please Add Products in Multiple of ${productData.stepUpValue}',
          ),
        ),
      );
    } else if (productData.allowMinQty != null &&
        productData.allowMinQty != 0 &&
        productData.allowMinQty! > int.parse(value)) {
      return Left(
        AppError(
          error: ErrorInfo(
            message: 'This item has a minimum purchase quantity $value',
          ),
        ),
      );
    } else if (productData.allowMaxQty != null &&
        productData.allowMaxQty != 0 &&
        productData.allowMaxQty! < int.parse(value)) {
      return Left(
        AppError(
          error: ErrorInfo(
            message: 'This item has a limited purchase quantity $value',
          ),
        ),
      );
    } else if (data?.isPartyLockedSoonByDist == 1) {
      Navigator.pop(context);
      showBinaryButtonAlertDialog(context,
          subTitle: context.localizedString.partySoonMsg,
          firstButtonTitle: context.localizedString.ok);
    } else if (data?.isPartyLocked == 1) {
      Navigator.pop(context);
      showBinaryButtonAlertDialog(context,
          subTitle: context.localizedString.partySoonMsg,
          firstButtonTitle: context.localizedString.ok);
    } else if (double.parse(data!.minAmountLimit!) != 0 &&
        double.parse(data.minAmountLimit!) >
            productData.mrp! * double.parse(value)) {
      return Left(
        AppError(
          error: ErrorInfo(
            message:
                'Your minimum order amount limit for this products is ₹${data.minAmountLimit}',
          ),
        ),
      );
    } else if (double.parse(data.maxAmountLimit!) != 0 &&
        double.parse(data.maxAmountLimit!) <
            productData.mrp! * double.parse(value)) {
      return Left(
        AppError(
          error: ErrorInfo(
            message:
                'Your maximum order amount limit for this products is ₹${data.maxAmountLimit}',
          ),
        ),
      );
    } /* else if (getIt<DraggableCartScreenCubit>().stores.isNotEmpty &&
        int.parse(data.minItemLimit!) != 0 &&
        int.parse(data.minItemLimit!) > minMaxItemsLength) {
      return Left(
        AppError(
          error: ErrorInfo(
            message:
                'Minimum line items per order for ${data.storeName}. with stoke is ${data.minItemLimit}',
          ),
        ),
      );
    } */
    else if (getIt<DraggableCartScreenCubit>().stores.isNotEmpty &&
        int.parse(data.maxItemLimit!) != 0 &&
        int.parse(data.maxItemLimit!) < minMaxItemsLength) {
      return Left(
        AppError(
          error: ErrorInfo(
            message:
                'You can order maximum ${data.maxItemLimit!} items per order for ${data.storeName}. To add more, please confirm this order and place a new order for remaining items.',
          ),
        ),
      );
    }
    return const Right(true);
  }
}

class AddProductToCartUseCaseParam extends Params {
  final AddProductToCartParams addProductToCartParam;

  AddProductToCartUseCaseParam({required this.addProductToCartParam});
}
