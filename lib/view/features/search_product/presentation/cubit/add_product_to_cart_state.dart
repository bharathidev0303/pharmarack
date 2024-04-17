import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/search_product/domain/model/add_product_to_cart/add_product_to_cart_model.dart';

class AddProductToCartState extends Equatable {
  const AddProductToCartState();
  @override
  List<Object?> get props => [];
}

class AddProductToCartInitialState extends AddProductToCartState {}

class AddProductToCartLoadingState extends AddProductToCartState {}

class AddProductToCartErrorState extends AddProductToCartState {}

class DistributorsPartyLockedState extends AddProductToCartState {
  final String message;

  const DistributorsPartyLockedState(this.message);
  @override
  List<Object?> get props => [message];
}

class AddProductToCartDataState extends AddProductToCartState {
  final AddProductToCartModel addProductToCartModel;

  const AddProductToCartDataState(this.addProductToCartModel);
}

class FreeValueUpdateState extends AddProductToCartState {
  final int quantity;

  const FreeValueUpdateState(this.quantity);
  @override
  List<Object?> get props => [quantity];
}

class QuantityValidatorState extends AddProductToCartState {
  final String errorMessage;

  const QuantityValidatorState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

class ResetQuantityValidatorState extends AddProductToCartState {}
