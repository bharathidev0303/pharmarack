
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/widget_1/cubit/product_item_state.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/widget_1/domain/product_model.dart';


class ProductItemCubit extends Cubit<ProductItemState> {
  final ProductModel productModel;

  ProductItemCubit(super.initialState, this.productModel);
}
