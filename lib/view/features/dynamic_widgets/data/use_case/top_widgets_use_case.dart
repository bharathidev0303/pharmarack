import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/repository/top_widgets_view_more_repository.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/model/TopBrandsList.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/model/TopDistributorsList.dart';

/// This class [TopWidgetsViewMoreUseCase] is the Behaviour that we
/// want for the respective page via [Cubit]
class TopWidgetsViewMoreUseCase {
  final TopWidgetsViewMoreRepository _topWidgetsViewMoreRepository;

  TopWidgetsViewMoreUseCase(this._topWidgetsViewMoreRepository);

  Future<Either<BaseError, List<TopBrandsLists>>> executeBrands(
      {required int page, required int limit}) {
    return _topWidgetsViewMoreRepository.fetchBrandsList(
        page: page, limit: limit);
  }

  Future<Either<BaseError, List<TopDistributorsList>>> executeDistributors(
      {required int page, required int limit}) {
    return _topWidgetsViewMoreRepository.fetchDistributorsList(
        page: page, limit: limit);
  }
}
