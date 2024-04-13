import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/model/DynamicWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/repository/dynamic_widgets_repository.dart';

/// This class [DynamicWidgetsUseCase] is the Behaviour that we
/// want for the respective page via [Cubit]
class DynamicWidgetsUseCase {
  final DynamicWidgetRepository _dynamicWidgetsRepository;

  DynamicWidgetsUseCase(this._dynamicWidgetsRepository);

  Future<Either<BaseError, DynamicWidgetModel>> executeHomePage() {
    return _dynamicWidgetsRepository.fetchHomePageWidgetList();
  }

  Future<Either<BaseError, DynamicWidgetModel>> executeDistributorPage(
      {required String sId}) {
    return _dynamicWidgetsRepository.fetchDistributorPageWidgetList(sId: sId);
  }

  Future<Either<BaseError, DynamicWidgetModel>> executeCompanyPage(
      {required String cId}) {
    return _dynamicWidgetsRepository.fetchCompanyPageWidgetList(cId: cId);
  }

  Future<Either<BaseError, DynamicWidgetModel>> executeNullSearchPage() {
    return _dynamicWidgetsRepository.fetchNullSearchPageWidgetList();
  }

  Future<Either<BaseError, DynamicWidgetModel>> executeRewardsPage() {
    return _dynamicWidgetsRepository.fetchRewardsPageWidgetList();
  }
}
