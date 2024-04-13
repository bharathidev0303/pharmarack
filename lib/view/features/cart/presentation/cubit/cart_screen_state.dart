import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/cart/domain/model/cart_details_model.dart';

abstract class CartScreenState extends Equatable {
  @override
  List<Object?> get props => [];

  const CartScreenState();
}

class CartScreenInitialState extends CartScreenState {}

class CartScreenLoadingState extends CartScreenState {}

class CartScreenNoDataState extends CartScreenState {}

class CartScreenDataState extends CartScreenState {
  final CartDetailsModel cartDetails;
  final bool isAllExpanded;
  final bool isAllSelected;
  final bool? isListUpdate;
  final int totalSelectedStores;

  @override
  List<Object?> get props => [
        cartDetails,
        isAllExpanded,
        isAllSelected,
        totalSelectedStores,
        isListUpdate
      ];

  const CartScreenDataState(this.cartDetails, this.isAllExpanded,
      this.isAllSelected, this.totalSelectedStores,
      {this.isListUpdate});
}

class CartDistributorSelectedState extends CartScreenState {
  final CartDetailsModel cartDetails;
  final String uniqueKey; //UniqueKey().toString(),

  @override
  List<Object?> get props => [cartDetails, uniqueKey];

  const CartDistributorSelectedState(this.cartDetails, this.uniqueKey);
}

class CartScreenErrorState extends CartScreenState {
  final String? errorMessage;
  const CartScreenErrorState({this.errorMessage});
}

class PlaceOrderSuccess extends CartScreenState {}

class CancelOrderEnableState extends CartScreenState {
  const CancelOrderEnableState();
}

class CancelOrderSuccessState extends CartScreenState {
  const CancelOrderSuccessState();
}

class ChangeSelectedStoreValue extends CartScreenState {
  final bool value;
  const ChangeSelectedStoreValue(this.value);
}
