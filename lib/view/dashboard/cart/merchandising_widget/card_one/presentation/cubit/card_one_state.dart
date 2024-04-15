import 'package:equatable/equatable.dart';
import '../../domain/model/special_offer_model.dart';

class CardOneState extends Equatable {
  final List<SpecialOffersModel> specialOffers;

  const CardOneState(this.specialOffers);

  factory CardOneState.initState() {
    return const CardOneState(
      [],
    );
  }

  CardOneState copyWith({List<SpecialOffersModel>? specialOffers}) {
    return CardOneState(specialOffers ?? this.specialOffers);
  }

  @override
  List<Object?> get props => [
        specialOffers,
      ];
}
