import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/api_service/fulfilment_partner_api_service.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/model/approve_reject_entity.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/model/mapped_settings_entity.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/model/request_model_entity.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/approve_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/mapped_settings_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_model.dart';

/// This class [FulfilmentPartnerRemoteDataSource] is used to fetch Api from network
/// using [FulfilmentPartnerApiService] class.
class FulfilmentPartnerRemoteDataSource {
  final FulfilmentPartnerApiService _fulfilmentPartnerApiService;

  FulfilmentPartnerRemoteDataSource(this._fulfilmentPartnerApiService);

  Future<Either<NetworkError, RequestModel>> fetchFulfilmentRequests(
      Map<String, dynamic> body) async {
    final response = await safeApiCall(
        _fulfilmentPartnerApiService.fetchFulfilmentRequests(body));

    return response.fold((l) => left(l), (r) {
      final RequestModelEntity model =
          RequestModelEntity.fromJson(jsonDecode(r.data));
      final requests = model.fulfillmentPartnersforApproval
          ?.map((e) => Request.fromRequestEntity(e))
          .toList();
      return right(RequestModel(data: requests));
    });
  }

  Future<Either<NetworkError, ApproveRejectMappingModel>>
      checkApproveRejectMappingRequest(Map<String, dynamic> body) async {
    final response = await safeApiCall(
        _fulfilmentPartnerApiService.checkApproveRejectMappingRequest(body));

    return response.fold((l) => left(l), (r) {
      final ApproveRejectEntity model =
          ApproveRejectEntity.fromJson(jsonDecode(r.data));

      return right(
          ApproveRejectMappingModel(responseText: model.responseText ?? ""));
    });
  }

  Future<Either<NetworkError, MappedSettingsModel>> getMappedSettings() async {
    final response = await safeApiCall(
        _fulfilmentPartnerApiService.getMappedSettingsRequest());
    return response.fold((l) => left(l), (r) {
      final MappedSettingsEntity model =
          MappedSettingsEntity.fromJson(jsonDecode(r.data));

      final list = model.mappedFulfillmentPartnerList
          ?.map((e) => MappedSettingPartners.fromMappedPartnerList(e))
          .toList();

      return right(MappedSettingsModel(mappedPartnerList: list));
    });
  }

  Future<Either<NetworkError, String>> saveFulfillmentPartnerSettings(
      String query) async {
    final response = await safeApiCall(
        _fulfilmentPartnerApiService.saveFulfillmentPartnerSettings(query));
    return response.fold((l) => left(l), (r) {
      final String response = r.data;
      return right(response);
    });
  }
}
