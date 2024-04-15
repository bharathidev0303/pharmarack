import 'package:pharmarack/view/dashboard/cart/merchandising_widget/card_one/data/model/special_offer_entity.dart';
import 'package:retrofit/retrofit.dart';

import '../endpoints_constants/card_one_endpoint.dart';

@RestApi()
abstract class CardOneApiService {
  // factory CardOneApiService(Dio dio) = _CardOneApiService;

  @GET(CardOneEndpoint.fetchSpecialOfferApiEndpoint)
  Future<HttpResponse<SpecialOfferEntity>> fetchSpecialOfferProduct();
}
