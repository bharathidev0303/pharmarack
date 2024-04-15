

import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/widget_1/domain/product_model.dart';

class ProductItemState extends Equatable {
  final List<ProductModel> productModel;

  const ProductItemState(this.productModel);

  @override
  List<Object?> get props => [];

  factory ProductItemState.initial() {
    return const ProductItemState([]);
  }
}

class ProductItemInitial extends ProductItemState {
  const ProductItemInitial(super.productModel);

  @override
  List<Object> get props => [];
}
