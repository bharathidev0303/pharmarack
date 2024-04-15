
import 'package:pharmarack/view/dashboard/cart/merchandising_widget/card_one/data/model/special_offer_entity.dart';

class SpecialOffersModel {
  String? id;
  String? medicineName;
  String? ptr;
  String? mrp;
  String? imageUrl;

  SpecialOffersModel({
    this.id,
    this.medicineName,
    this.ptr,
    this.mrp,
    this.imageUrl,
  });

  factory SpecialOffersModel.fromSpecialOffers(SpecialOffers specialOffers) {
    return SpecialOffersModel(
      id: specialOffers.id,
      medicineName: specialOffers.medicineName,
      ptr: specialOffers.ptr,
      mrp: specialOffers.mrp,
      imageUrl: specialOffers.imageUrl,
    );
  }
}
