import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/view/features/cart/domain/model/add_product_to_cart_param.dart';
import 'package:pharmarack/view/features/cart/presentation/cubit/draggable_cart/cubit/draggable_cart_cubit.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';
import 'package:pharmarack/view/features/search_product/domain/use_case/add_product_to_cart_use_case.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/add_product_to_cart_state.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/search_product_cubit.dart';
import 'package:pharmarack/view/features/widgets/custom_app_bar/custom_app_bar_cubit.dart';

class AddProductToCartCubit extends Cubit<AddProductToCartState> {
  final AddProductToCartUseCase _addProductToCartUseCase;

  AddProductToCartCubit(AddProductToCartUseCase addProductToCartUseCase)
      : _addProductToCartUseCase = addProductToCartUseCase,
        super(AddProductToCartInitialState());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController quantityController = TextEditingController();

  addProductToCartRequest({
    required SearchProductListModel productDetails,
    required int quantity,
  }) async {
    emit(AddProductToCartLoadingState());
    try {
      final response = await _addProductToCartUseCase.execute(
          params: AddProductToCartUseCaseParam(
              addProductToCartParam: AddProductToCartParams(
                  storeId: productDetails.storeId ?? 0,
                  quantity: quantity,
                  productCode: productDetails.productCode ?? '',
                  ptr: productDetails.ptr ?? 0.0,
                  hiddenPTR: productDetails.hiddenPtr ?? 0.0,
                  gSTPercentage: productDetails.storeProductGST ?? 0.0,
                  cartSource: 'MOVP',
                  isDODProductCheck: 1,
                  isDODPreferenceSet: 0,
                  isDODProductSelected: 0)));

      response.fold((l) => emit(AddProductToCartErrorState()), (r) {
        emit(AddProductToCartDataState(r));
        getIt<DraggableCartScreenCubit>().getCartDetails(isUpdate: false);

        //ShowDistributorPageState

        if (getIt<SearchProductCubit>().isDistributor &&
            getIt<SearchProductCubit>().selectedDistributorName != '') {
          Future.delayed(
            const Duration(
              milliseconds: 500,
            ),
            () {
              getIt<SearchProductCubit>().emitDistributorState();
            },
          );
        } else {
          Future.delayed(
            const Duration(
              milliseconds: 500,
            ),
            () {
              getIt<SearchProductCubit>().emitInitialState();
            },
          );
        }
        getIt.get<CustomAppBarCubit>().resetAppBar();
      });
    } catch (e) {}
  }

  validateQuantityField({
    required SearchProductListModel productDetails,
    required String quantity,
    required BuildContext context,
  }) {
    _addProductToCartUseCase
        .validateQuantity(quantity, productDetails, context)
        .fold((l) {
      final message = l.error.message;
      emit(QuantityValidatorState(message));
    }, (r) {
      addProductToCartRequest(
          productDetails: productDetails, quantity: int.parse(quantity));
    });
  }

  resetQuantityField() {
    emit(ResetQuantityValidatorState());
  }

  updateFreeValue(int quantity) {
    emit(FreeValueUpdateState(quantity));
  }
}
