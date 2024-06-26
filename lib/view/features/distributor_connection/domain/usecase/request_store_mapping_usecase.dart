import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/features/distributor_connection/data/model/multiple_store_mapping_response_model.dart';

import '../../data/model/store_status_mapping_request_model.dart';
import '../repository/distributor_connection_repository.dart';

class RequestStoreMappingUseCase {
  final DistributorConnectionRepository _repository;

  RequestStoreMappingUseCase(DistributorConnectionRepository repository)
      : _repository = repository;

  Future<Either<NetworkError, MultipleStoreMappingResponseModel>> execute(
      List<StoreStatusMappingRequestModel> request) async {
    return await _repository.requestStoreMapping(request);
  }
}
