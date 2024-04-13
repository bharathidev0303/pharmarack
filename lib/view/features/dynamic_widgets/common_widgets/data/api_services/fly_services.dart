import 'package:dio/dio.dart' hide Headers;
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/endpoints_constants/fly_endpoints.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/model/flymilestone/mile_stone_entity.dart';
import 'package:retrofit/retrofit.dart';

part 'fly_services.g.dart';

@RestApi()
abstract class FlyApiService {
  factory FlyApiService(Dio dio) = _FlyApiService;

  @Headers(<String, String>{
    'Accept': '*/*',
    'PARTNER-KEY': 'Bi1laXpmjM9q379AQCgoResDd9PGKnQ6cXhg9VEq'
  })
  @GET(FlyEndpoints.getMilestoneOffers)
  Future<HttpResponse<MileStoneEntity>> fetchMilestoneDetails(
      {@Path("rId") required String rId});
}
