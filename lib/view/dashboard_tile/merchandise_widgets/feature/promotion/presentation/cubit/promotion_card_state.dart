part of 'promotion_card_cubit.dart';

class PromotionCardState extends Equatable {
  final List<PromotionCardModel> promotionCardModel;
  const PromotionCardState(this.promotionCardModel);

  @override
  List<Object?> get props => [];
}

class PromotionCardInitial extends PromotionCardState {
  const PromotionCardInitial(super.promotionCardModel);
}

class PromotionCardLoading extends PromotionCardState {
  const PromotionCardLoading(super.promotionCardModel);
}

class PromotionCardLoadeded extends PromotionCardState {
  const PromotionCardLoadeded(super.promotionCardModel);
}
