
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/card_one/data/data_source/remote_data_source/card_one_remote_data_source.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/card_one/domain/model/special_offer_model.dart';

import '../../domain/repository/special_offer_repository.dart';

class SpecailOfferRepositoryImpl implements SpecailOfferRepository {
  final CardOneRemoteDataSource _cardOneRemoteDataSource;

  SpecailOfferRepositoryImpl(this._cardOneRemoteDataSource);

  @override
  Future<Either<BaseError, List<SpecialOffersModel>>> getSpecialOffers() {
    return _cardOneRemoteDataSource.getSpecialProduct();
  }
}
