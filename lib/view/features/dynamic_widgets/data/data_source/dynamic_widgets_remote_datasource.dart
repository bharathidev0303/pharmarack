import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/api_services/dynamic_widget_services.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/model/DynamicWidgetModel.dart';

class DynamicWidgetsRemoteDataSource {
  final DynamicWidgetApiService _dynamicWidgetsApiService;

  DynamicWidgetsRemoteDataSource(this._dynamicWidgetsApiService);

// Home Page Api Call
  Future<Either<NetworkError, DynamicWidgetModel>>
      fetchHomePageWidgetList() async {
    int? rId = getIt<RetailerInfoEntity>().getRetailerId() ?? 0;
    final response = await safeApiCall(
        _dynamicWidgetsApiService.fetchHomePageDetails(rId.toString()));

    return response.fold((l) => left(l), (r) {
      return right(DynamicWidgetModel.fromJson(
          r.data.components as Map<String, dynamic>));
    });
  }

  // Distributor Page Api Call
  Future<Either<NetworkError, DynamicWidgetModel>>
      fetchDistributorPageWidgetList({required String sId}) async {
    int? rId = getIt<RetailerInfoEntity>().getRetailerId() ?? 0;
    final response = await safeApiCall(_dynamicWidgetsApiService
        .fetchDistributorPageDetails(rId: rId.toString(), sId: sId));

    return response.fold((l) => left(l), (r) {
      return right(DynamicWidgetModel.fromJson(
          r.data.components as Map<String, dynamic>));
    });
  }

  // Company Page Api Call
  Future<Either<NetworkError, DynamicWidgetModel>> fetchCompanyPageWidgetList(
      {required String cId}) async {
    int? rId = getIt<RetailerInfoEntity>().getRetailerId() ?? 0;
    final response = await safeApiCall(_dynamicWidgetsApiService
        .fetchCompanyPageDetails(rId: rId.toString(), cId: cId));

    return response.fold((l) => left(l), (r) {
      return right(DynamicWidgetModel.fromJson(
          r.data.components as Map<String, dynamic>));
    });
  }

  // Null Search Page Api Call
  Future<Either<NetworkError, DynamicWidgetModel>>
      fetchNullSearchPageWidgetList() async {
    int? rId = getIt<RetailerInfoEntity>().getRetailerId() ?? 0;
    final response = await safeApiCall(
        _dynamicWidgetsApiService.fetchNullSearchPageDetails(rId.toString()));

    return response.fold((l) => left(l), (r) {
      return right(DynamicWidgetModel.fromJson(
          r.data.components as Map<String, dynamic>));
    });
  }

  // Rewards Page Api Call
  Future<Either<NetworkError, DynamicWidgetModel>>
      fetchRewardsPageWidgetList() async {
    int? rId = getIt<RetailerInfoEntity>().getRetailerId() ?? 0;
    final response = await safeApiCall(
        _dynamicWidgetsApiService.fetchRewardsPageDetails(rId.toString()));

    return response.fold((l) => left(l), (r) {
      return right(DynamicWidgetModel.fromJson(
          r.data.components as Map<String, dynamic>));
    });
  }
}
