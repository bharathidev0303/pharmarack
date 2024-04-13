import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/approve_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/mapped_settings_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_model.dart';

/// This class [FulfilmentPartnerRepository] is the blueprint of network api call
abstract class FulfilmentPartnerRepository {
  Future<Either<NetworkError, RequestModel>> fetchFulfilmentRequests(
      Map<String, dynamic> body);

  Future<Either<NetworkError, ApproveRejectMappingModel>>
      checkApproveRejectMapping(Map<String, dynamic> body);

  Future<Either<NetworkError, MappedSettingsModel>> getMappedSettings();

  Future<Either<NetworkError, String>> saveFulfillmentPartnerSettings(
      String query);
}
