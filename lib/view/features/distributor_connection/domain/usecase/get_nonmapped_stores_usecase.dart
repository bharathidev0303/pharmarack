import '../../data/model/distributor_store_status.dart';
import '../repository/distributor_connection_repository.dart';

class GetNonmappedStoresUseCase {
  final DistributorConnectionRepository _repository;

  GetNonmappedStoresUseCase(this._repository);

  Future<List<DistributorStoreStatus>> execute() async {
    return await _repository.getNonmappedStores();
  }
}
