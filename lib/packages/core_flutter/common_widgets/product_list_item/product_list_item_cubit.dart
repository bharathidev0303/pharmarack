import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListItemCubit extends Cubit<ProductListItemState> {
  ProductListItemCubit() : super(ProductItemInitState());

  arrowTapped(bool currentState) {
    emit(ArrowTapped(isTapped: currentState));
  }
}

class ProductListItemState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductItemInitState extends ProductListItemState {
  ProductItemInitState();
}

class ArrowTapped extends ProductListItemState {
  final bool isTapped;

  ArrowTapped({this.isTapped = false});
  @override
  List<Object?> get props => [isTapped];
}
