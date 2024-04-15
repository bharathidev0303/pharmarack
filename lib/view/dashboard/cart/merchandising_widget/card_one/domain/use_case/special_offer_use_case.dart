import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/card_one/domain/model/special_offer_model.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/card_one/domain/repository/special_offer_repository.dart';

class SpecialOfferUseCase {
  final SpecailOfferRepository _specialOfferRepository;
  final List<SpecialOffersModel> _specialOffer;

  SpecialOfferUseCase(this._specialOfferRepository, this._specialOffer);

  Future<Either<BaseError, List<SpecialOffersModel>>> execute() {
    return _specialOfferRepository.getSpecialOffers();
  }

  void updateSpecialOfferProduct(List<SpecialOffersModel> specialOffer) {
    _specialOffer.clear();
    _specialOffer.addAll(specialOffer);
  }

  List<SpecialOffersModel> searchSpecailOfferProduct(String query) {
    final lowercase = query.toLowerCase();
    return lowercase.isEmpty
        ? _specialOffer
        : _specialOffer
            .filter((t) =>
                t.medicineName?.toLowerCase().contains(lowercase) ?? false)
            .toList();
  }

  List<SpecialOffersModel> filterSpecailOffersProduct(
      List<String> productName, String query) {
    final results = searchSpecailOfferProduct(query);

    return productName.isNotEmpty
        ? results
            .filter((elementModel) =>
                productName.any((element) =>
                    (elementModel.medicineName?.contains(element) ?? false)) ||
                productName.contains("All"))
            .toList()
        : results;
  }
}
