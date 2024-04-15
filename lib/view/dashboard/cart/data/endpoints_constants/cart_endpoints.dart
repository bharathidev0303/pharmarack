
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';

class CartEndPoints {
  static const String cartDetails =
      "/cart/api/${AppConstants.apiVersion}/GetUserCartDetails";
  static const String deleteProduct =
      '/cart/api/${AppConstants.apiVersion}/DeleteUserCartDetailByStoreId';
  static const String addProductToCart =
      "/cart/api/${AppConstants.apiVersion}/AddUserProductCartDetail";
  static const String savePlaceOrder =
      "/cart/api/${AppConstants.apiVersion}/SaveOrderCartForRetailerManager";
  static const String getStoreDetailsAPI =
      '/cart/api/${AppConstants.apiVersion}/GetStoredetailsAPI';
  static const String cancelOrder =
      '/cart/api/${AppConstants.apiVersion}/CancelPlaceOrder';
}
