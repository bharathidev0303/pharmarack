import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/data_source/remote_data_source/fulfilment_partner_remote_data_source.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/approve_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/mapped_settings_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/repository/fulfilment_partner_repository.dart';

/// This class [FulfilmentPartnerRepositoryImpl] is the implementation of [FulfilmentPartnerRepository]
class FulfilmentPartnerRepositoryImpl implements FulfilmentPartnerRepository {
  final FulfilmentPartnerRemoteDataSource _fulfilmentPartnerRemoteDataSource;

  FulfilmentPartnerRepositoryImpl(this._fulfilmentPartnerRemoteDataSource);

  @override
  Future<Either<NetworkError, RequestModel>> fetchFulfilmentRequests(
      Map<String, dynamic> body) {
    return _fulfilmentPartnerRemoteDataSource.fetchFulfilmentRequests(body);
  }

  @override
  Future<Either<NetworkError, ApproveRejectMappingModel>>
      checkApproveRejectMapping(Map<String, dynamic> body) {
    return _fulfilmentPartnerRemoteDataSource
        .checkApproveRejectMappingRequest(body);
  }

  @override
  Future<Either<NetworkError, MappedSettingsModel>> getMappedSettings() {
    return _fulfilmentPartnerRemoteDataSource.getMappedSettings();
  }

  @override
  Future<Either<NetworkError, String>> saveFulfillmentPartnerSettings(
      String query) {
    return _fulfilmentPartnerRemoteDataSource
        .saveFulfillmentPartnerSettings(query);
  }
}
