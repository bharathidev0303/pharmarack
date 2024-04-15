import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/card_one/domain/model/special_offer_model.dart';

abstract class SpecailOfferRepository {
  Future<Either<BaseError, List<SpecialOffersModel>>> getSpecialOffers();
}
