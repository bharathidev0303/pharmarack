
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/card_one/data/api_services/card_one_api_service.dart';
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/card_one/domain/model/special_offer_model.dart';

import '../../model/special_offer_entity.dart';

class CardOneRemoteDataSource {
  final CardOneApiService _cardOneApiService;

  CardOneRemoteDataSource(this._cardOneApiService);

  Future<Either<BaseError, List<SpecialOffersModel>>>
      getSpecialProduct() async {
    await safeApiCall(_cardOneApiService.fetchSpecialOfferProduct());

    final specialOffers = [
      SpecialOffers(
        id: "Special Offers",
        medicineName: "Cremaffin Plus",
        ptr: "4.10",
        mrp: "5.33",
        imageUrl: "https://i.ibb.co/fC01t61/cremaffine-plus.png",
      ),
      SpecialOffers(
        id: "Special Offers",
        medicineName: "Asthakind",
        ptr: "5.40",
        mrp: "10.33",
        imageUrl: "https://i.ibb.co/JBvNF7G/Asthakind.png",
      ),
      SpecialOffers(
        id: "Special Offers",
        medicineName: "Revital H",
        ptr: "5.40",
        mrp: "10",
        imageUrl: "https://i.ibb.co/68GGPgL/Revital-h.png",
      ),
      SpecialOffers(
        id: "Special Offers",
        medicineName: "15% off",
        ptr: "7.40",
        mrp: "13.32",
        imageUrl: "https://i.ibb.co/f0tf80D/15-off.png",
      ),
      SpecialOffers(
        id: "Special Offers",
        medicineName: "Buy 1 Get 1",
        ptr: "17.40",
        mrp: "10.32",
        imageUrl: "https://i.ibb.co/TmRZXjR/buy1-get1.png",
      ),
    ];
    return right(specialOffers
        .map((e) => SpecialOffersModel.fromSpecialOffers(e))
        .toList());
  }
}
