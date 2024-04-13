import 'dart:core';
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/api_services/fly_services.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/model/flymilestone/mile_stone_entity.dart';

class FlyRepository {
  final FlyApiService _flyApiServices;

  FlyRepository(this._flyApiServices);

  Future<Either<NetworkError, MileStoneEntity>> fetchMilestoneList() async {
    final rid = getIt<RetailerInfoEntity>().userId;
    final response = await safeApiCall(
        _flyApiServices.fetchMilestoneDetails(rId: rid.toString()));
    return response.fold((l) => left(l), (r) {
      return right(r.data);
    });
  }
}
