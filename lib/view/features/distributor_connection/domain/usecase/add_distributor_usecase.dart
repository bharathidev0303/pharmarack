import 'package:pharmarack/view/features/distributor_connection/domain/model/new_distributor_details.dart';
import 'package:pharmarack/view/features/distributor_connection/domain/repository/distributor_connection_repository.dart';

class AddDistributorUseCase {
  final DistributorConnectionRepository _repository;

  AddDistributorUseCase(this._repository);

  Future<bool> execute(NewDistributorDetails details) {
    return _repository.saveRetailerStoreRequest(details);
  }
}
