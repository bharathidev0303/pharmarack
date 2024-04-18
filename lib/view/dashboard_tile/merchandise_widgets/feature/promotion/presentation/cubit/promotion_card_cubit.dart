import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/feature/promotion/domain/promotion_card_model.dart';

part 'promotion_card_state.dart';

class PromotionCardCubit extends Cubit<PromotionCardState> {
  final PromotionCardModel promotionCardModel;

  PromotionCardCubit(super.initialState, this.promotionCardModel);
}
