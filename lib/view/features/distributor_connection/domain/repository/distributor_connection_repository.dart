import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/view/features/distributor_connection/data/api/distributor_connection_api_service.dart';
import 'package:pharmarack/view/features/distributor_connection/data/model/distributor_store_status.dart';
import 'package:pharmarack/view/features/distributor_connection/data/model/multiple_store_mapping_request_model.dart';
import 'package:pharmarack/view/features/distributor_connection/data/model/multiple_store_mapping_response_model.dart';
import 'package:pharmarack/view/features/distributor_connection/data/model/store_status_mapping_request_model.dart';
import 'package:pharmarack/view/features/distributor_connection/domain/model/new_distributor_details.dart';

class DistributorConnectionRepository {
  final DistributorConnectionApiService _apiService;
  //final LoginEntity _loginEntity;
  final RetailerInfoEntity _retailerInfoEntity;

  DistributorConnectionRepository(
    DistributorConnectionApiService apiService,
    //LoginEntity loginEntity,
    RetailerInfoEntity retailerInfoEntity,
  )   : _apiService = apiService,
        _retailerInfoEntity = retailerInfoEntity;

  Future<List<DistributorStoreStatus>> getNonmappedStores() async {
    final response = await _apiService.getNonmappedStoreStatus(
      retailerId: _retailerInfoEntity.getRetailerId().toString(),
      userId: _retailerInfoEntity.userId.toString(),
    );
    return response.data;
  }

  Future<MultipleStoreMappingResponseModel> requestStoreMapping(
    List<StoreStatusMappingRequestModel> mapRequests,
  ) async {
    var request = MultipleStoreMappingRequestModel(
      rid: _retailerInfoEntity.getRetailerId() ?? 0,
      maprequests: mapRequests,
    );
    return await _apiService.requestStoreMapping(
      request.toJson(),
    );
  }

  Future<bool> saveRetailerStoreRequest(NewDistributorDetails details) async {
    var result = await _apiService.saveRetailerStoreRequest({
      'rid': _retailerInfoEntity.getRetailerId().toString(),
      'uid': _retailerInfoEntity.userId.toString(),
      'sname': details.name,
      'mobile': details.contactNumber
    });
    return result.success;
  }
}
