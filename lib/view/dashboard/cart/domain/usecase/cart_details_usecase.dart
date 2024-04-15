
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core/log_util/log_util.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/utils/retailer_utils.dart';
import 'package:pharmarack/view/dashboard/cart/domain/model/cart_details_model.dart';
import 'package:pharmarack/view/dashboard/cart/domain/repository/cart_repository.dart';

class CartDetailsUseCase
    extends BaseUseCase<BaseError, CartDetailsParams, CartDetailsModel?> {
  final CartRepository _cartRepository;

  CartDetailsUseCase(this._cartRepository);

  @override
  Future<Either<BaseError, CartDetailsModel?>> execute(
      {required CartDetailsParams params}) async {
    return _cartRepository.getCartDetails();
  }

  CartDetailsModel? onAllStoreItemsExpandCollapse(bool isExpanded) {
    CartDetailsModel? cartDetails = _cartRepository.getCartDetailsData();
    for (var store in cartDetails?.stores ?? []) {
      store.isExpanded = isExpanded;
    }
    cartDetails?.isAllExpanded = isExpanded;
    _cartRepository.updateCartDetailsData(cartDetails);
    return cartDetails;
  }

  CartDetailsModel? onStoreItemsExpanded(int storeId, bool isExpanded) {
    CartDetailsModel? cartDetails = _cartRepository.getCartDetailsData();
    try {
      Store? store =
          cartDetails?.stores.firstWhere((store) => store.storeId == storeId);
      if (store != null) {
        store.isExpanded = isExpanded;
      }
    } on Exception {
      LogUtil.error("Store not found for select or unselect");
    }
    if (cartDetails!.stores.any((element) => element.isExpanded == false) ==
        true) {
      cartDetails.isAllExpanded = false;
    } else {
      cartDetails.isAllExpanded = true;
    }
    _cartRepository.updateCartDetailsData(cartDetails);
    return cartDetails;
  }

  CartDetailsModel? onAllStoreSelected(bool isSelected) {
    CartDetailsModel? cartDetails = _cartRepository.getCartDetailsData();
    cartDetails?.totalItems = 0;
    cartDetails?.totalCartValue = 0;
    cartDetails?.totalSelectedStores = 0;
    for (Store store in cartDetails?.stores ?? []) {
      if (isSelected) {
        cartDetails?.totalItems += store.cartItemList.length;
        cartDetails?.totalCartValue += store.total;
        cartDetails?.totalSelectedStores += 1;
      }
      store.isSelected = isSelected;
    }
    cartDetails?.isAllSelected = isSelected;
    _cartRepository.updateCartDetailsData(cartDetails);
    return cartDetails;
  }

  CartDetailsModel? onStoreSelected(int storeId, bool isSelected) {
    CartDetailsModel? cartDetails = _cartRepository.getCartDetailsData();
    try {
      Store? store =
          cartDetails?.stores.firstWhere((store) => store.storeId == storeId);
      if (store != null) {
        store.isSelected = isSelected;
        if (isSelected) {
          cartDetails?.totalItems += store.cartItemList.length;
          cartDetails?.totalCartValue += store.total;
          cartDetails?.totalSelectedStores += 1;
        } else {
          cartDetails?.totalItems -= store.cartItemList.length;
          cartDetails?.totalCartValue -= store.total;
          cartDetails?.totalSelectedStores -= 1;
        }
      }
    } on Exception {
      LogUtil.error("Store not found for select or unselect");
    }
    if (cartDetails!.stores.any((element) => element.isSelected == false) ==
        true) {
      cartDetails.isAllSelected = false;
    } else {
      cartDetails.isAllSelected = true;
    }
    _cartRepository.updateCartDetailsData(cartDetails);
    return cartDetails;
  }

  List<String> getDistributorList() {
    final List<String> distributorsList = [];

    distributorsList.add("All Distributors");
    CartDetailsModel? cartDetails = _cartRepository.getCartDetailsData();
    for (Store store in cartDetails?.stores ?? []) {
      distributorsList.add(store.storeName);
    }

    return distributorsList;
  }

  //CartDetailsModel
  CartDetailsModel? getProductList(String storeName) {
    CartDetailsModel? cartDetails = _cartRepository.getCartDetailsData();

    if (storeName == 'All Distributors') {
      return _cartRepository.getCartDetailsData();
    } else {
      CartDetailsModel productList;
      final List<Store> storesList = [];
      double totalCartValueForDist = 0.0;
      int totalItemsForDist = 0;

      for (Store store in cartDetails?.stores ?? []) {
        if (storeName == store.storeName) {
          storesList.add(store);
          totalCartValueForDist = store.total;
          totalItemsForDist = store.cartItemList.length;
        }
      }

      productList = CartDetailsModel(
          stores: storesList,
          isAllExpanded: false,
          isAllSelected: false,
          totalCartValue: totalCartValueForDist,
          totalItems: totalItemsForDist,
          totalSelectedStores: storesList.length);

      return productList;
    }
  }

  int getProductCount() {
    CartDetailsModel? cartDetails = _cartRepository.getCartDetailsData();
    int productCount = 0;

    for (Store store in cartDetails?.stores ?? []) {
      productCount += store.cartItemList.length;
    }
    return productCount;
  }

  List<int> getQuantityAndScheme() {
    int totalQuantity = 0;
    int totalScheme = 0;

    CartDetailsModel? cartDetails = _cartRepository.getCartDetailsData();
    for (Store store in cartDetails?.stores ?? []) {
      for (CartListItemModel cartItem in store.cartItemList) {
        totalQuantity += cartItem.quantity!;
        if (cartItem.scheme != null && cartItem.scheme != '') {
          final calculatedScheme = RetailerUtils.getFreeTabletsCountAsPerScheme(
              cartItem.scheme, cartItem.quantity!);

          totalScheme += int.parse(calculatedScheme);
        }
      }
    }
    return [totalQuantity, totalScheme];
  }

  CartLastItemModel? getLastAddedProduct() {
    CartDetailsModel? cartDetails = _cartRepository.getCartDetailsData();
    return cartDetails?.lastAddedProduct;
  }

  CartDetailsModel? getAllDistributorAndProductList() {
    return _cartRepository.getCartDetailsData();
  }

  CartDetailsModel? getCartDetailsData() {
    return _cartRepository.getCartDetailsData();
  }
}

class CartDetailsParams extends Params {}
