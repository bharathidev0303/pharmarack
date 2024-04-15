import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core/log_util/log_util.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/dashboard/cart/domain/model/cart_details_model.dart';
import 'package:pharmarack/view/features/change_distributor/data/product_distributors_response_entity.dart';
import 'package:pharmarack/view/features/change_distributor/presentation/bloc/distributor_details.dart';

import '../../../../dashboard/cart/domain/model/add_product_to_cart_param.dart';
import '../../../../dashboard/cart/domain/usecase/add_change_cart_usecase.dart';
import '../../../../dashboard/cart/domain/usecase/delete_product_usecase.dart';
import '../../domain/fetch_product_distributors_use_case.dart';
import '../../domain/no_distributors_found_exception.dart';
import 'change_distributor_dialog_state.dart';

class ChangeDistributorDialogCubit extends Cubit<ChangeDistributorDialogState> {
  final GetProductDistributorsUseCase _getProductDistributors;
  final AddChangeCartUseCase _addChangeCartUseCase;
  final DeleteProductUseCase _deleteProductUseCase;

  ChangeDistributorDialogCubit(
    this._getProductDistributors,
    this._addChangeCartUseCase,
    this._deleteProductUseCase,
  ) : super(ChangeDistributorLoadingState());

  Future<void> fetchProductDistributors(int productId, int pageNo) async {
    emit(ChangeDistributorLoadingState());
    await _getProductDistributors(productId, pageNo).then((result) {
      emit(ChangeDistributorDataState(
        productName: result.productName,
        offerName: result.offerName,
        offerValue: result.offer,
        selectedDistributor: null,
        distributors: _mapToDistributorDetails(result.distributors),
      ));
    }).catchError((error, stacktrace) {
      if (error is NoDistributorsFoundException) {
        emit(NoDistributorsFoundErrorState(productName: error.productName));
      } else {
        emit(ChangeDistributorErrorState());
      }
      LogUtil.info(
        'Error fetching product distributors',
        error: error,
        stackTrace: stacktrace,
      );
    });
  }

  List<DistributorDetails> _mapToDistributorDetails(
    List<DistributorDetailResponseEntity> distributors,
  ) {
    return distributors
        .map(
          (item) => DistributorDetails(
            id: item.storeId,
            name: item.distributorName,
            ptr: stringToDouble(item.ptr.toString()),
            mrp: stringToDouble(item.mrp.toString()),
            stockQuantity: item.stock,
            scheme: item.scheme,
            freeQuantity: item.freeQuantity ?? 0,
            hiddenPtr: stringToDouble(item.hiddenPtr.toString()),
            gstPercentage: stringToDouble(item.gstPercentage.toString()),
          ),
        )
        .toList(growable: false);
  }

  void selectDistributor(int distributorId) {
    final currentState = state;
    if (currentState is ChangeDistributorDataState) {
      final selectedDistributor = currentState.distributors
          .where((element) => element.id == distributorId)
          .firstOrNull;
      emit(
        currentState.copyWith(selectedDistributor: () => selectedDistributor),
      );
    }
  }

  Future<void> changeDistributor({
    required int productCode,
    required int storeId,
    required int quantity,
  }) async {
    final state = this.state;
    if (state is ChangeDistributorDataState) {
      if (state.selectedDistributor == null) {
        return;
      }

      emit(ChangeDistributorLoadingState());
      final addToCartResult = await _addToCartWithNewDistributor(
        newDistributor: state.selectedDistributor!,
        quantity: quantity,
        productCode: productCode,
      );
      if (addToCartResult.isRight()) {
        final deleteResult = await _deleteOldProductFromCart(
          storeId,
          productCode,
        );
        if (deleteResult.isRight()) {
          emit(ChangeDistributorSuccessState());
        } else {
          emit(ChangeDistributorErrorState());
        }
      } else {
        emit(ChangeDistributorErrorState());
      }
    }
  }

  Future<Either<BaseError, CartDetailsModel?>> _deleteOldProductFromCart(
      int storeId, int productCode) async {
    return await _deleteProductUseCase.execute(
      params: DeleteProductParams(
        deleteProductRequestParam: DeleteProductRequestParam(
          storeId: storeId.toString(),
          productCode: productCode.toString(),
        ),
      ),
    );
  }

  Future<Either<BaseError, CartDetailsModel?>> _addToCartWithNewDistributor({
    required DistributorDetails newDistributor,
    required int quantity,
    required int productCode,
  }) async {
    final params = AddChangeCartParam(
      addProductToCartParam: AddProductToCartParams(
        storeId: newDistributor.id,
        quantity: quantity,
        productCode: productCode.toString(),
        ptr: newDistributor.ptr ?? 0,
        hiddenPTR: newDistributor.hiddenPtr ?? 0,
        gSTPercentage: newDistributor.gstPercentage ?? 0,
        cartSource: 'MOVP',
        isDODProductCheck: 1,
        isDODPreferenceSet: 0,
        isDODProductSelected: 0,
      ),
    );

    return await _addChangeCartUseCase.execute(params: params);
  }

  static double? stringToDouble(String? value) {
    if (value == null || value.isEmpty) return null;
    final strippedValue = value.replaceAll('₹', '').replaceAll(' ', '');
    return double.tryParse(strippedValue);
  }
}
