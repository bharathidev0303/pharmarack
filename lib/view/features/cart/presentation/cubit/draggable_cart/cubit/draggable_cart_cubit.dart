import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/features/cart/domain/model/cart_details_model.dart';
import 'package:pharmarack/view/features/cart/domain/usecase/cart_details_usecase.dart';
import 'package:pharmarack/view/features/cart/domain/usecase/delete_product_usecase.dart';
import 'package:pharmarack/view/features/cart/presentation/cubit/cart_screen_state.dart';

class DraggableCartScreenCubit extends Cubit<CartScreenState> {
  final CartDetailsUseCase _cartDetailsUseCase;
  final DeleteProductUseCase _deleteProductUseCase;
  final List<Store> stores = [];

  DraggableCartScreenCubit(CartDetailsUseCase cartDetailsUseCase,
      DeleteProductUseCase deleteProductUseCase)
      : _cartDetailsUseCase = cartDetailsUseCase,
        _deleteProductUseCase = deleteProductUseCase,
        super(CartScreenInitialState()) {
    // Initial task
  }

  void getCartDetails({bool isUpdate = false}) async {
    if (!isUpdate) {
      emit(CartScreenLoadingState());
    }
    final response =
        await _cartDetailsUseCase.execute(params: CartDetailsParams());
    response.fold((l) {
      emit(const CartScreenErrorState());
    }, (r) {
      if (r == null || r.statusCode != 200) {
        emit(const CartScreenErrorState());
      } else if (r.stores.isEmpty) {
        stores.clear();
        emit(CartScreenNoDataState());
      } else {
        stores.clear();
        stores.addAll(r.stores);
        emit(CartScreenDataState(r, false, true, r.stores.length));
      }
    });
  }

  CartDetailsModel? getProductsFromStore() {
    return _cartDetailsUseCase.onAllStoreSelected(true);
  }

  List<String> getDistributorList() {
    return _cartDetailsUseCase.getDistributorList();
  }

  getProductListForDistributor(String storeName) {
    final response = _cartDetailsUseCase.getProductList(storeName);
    emit(CartDistributorSelectedState(response!, UniqueKey().toString()));
  }

  getAllDistributorAndProductList() {
    final response = _cartDetailsUseCase.getAllDistributorAndProductList();
    emit(CartScreenDataState(response!, false, false, response.stores.length));
  }

  int getProductCount() {
    return _cartDetailsUseCase.getProductCount();
  }

  deleteProductFromCart(String storeId, String productID) async {
    emit(CartScreenLoadingState());
    final response = await _deleteProductUseCase.execute(
        params: DeleteProductParams(
            deleteProductRequestParam: DeleteProductRequestParam(
                storeId: storeId, productCode: productID)));

    response.fold((l) {
      emit(const CartScreenErrorState());
    }, (r) {
      if (r == null || r.statusCode != 200) {
        emit(const CartScreenErrorState());
      } else if (r.stores.isEmpty) {
        stores.clear();
        emit(CartScreenNoDataState());
      } else {
        stores.clear();
        stores.addAll(r.stores);
        emit(CartScreenDataState(r, false, false, r.stores.length));
      }
    });
  }

  List<int> getTotalQuantityAndScheme() {
    return _cartDetailsUseCase.getQuantityAndScheme();
  }

  CartLastItemModel? getLastAddedProduct() {
    return _cartDetailsUseCase.getLastAddedProduct();
  }
}
