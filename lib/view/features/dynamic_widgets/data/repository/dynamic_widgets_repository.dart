import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/data_source/dynamic_widgets_remote_datasource.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/model/DynamicWidgetModel.dart';

class DynamicWidgetRepository {
  final DynamicWidgetsRemoteDataSource _dynamicWidgetsRemoteDataSource;

  DynamicWidgetRepository(this._dynamicWidgetsRemoteDataSource);

  Future<Either<NetworkError, DynamicWidgetModel>> fetchHomePageWidgetList() {
    return _dynamicWidgetsRemoteDataSource.fetchHomePageWidgetList();
  }

  Future<Either<NetworkError, DynamicWidgetModel>>
      fetchDistributorPageWidgetList({required String sId}) {
    return _dynamicWidgetsRemoteDataSource.fetchDistributorPageWidgetList(
        sId: sId);
  }

  Future<Either<NetworkError, DynamicWidgetModel>> fetchCompanyPageWidgetList(
      {required String cId}) {
    return _dynamicWidgetsRemoteDataSource.fetchCompanyPageWidgetList(cId: cId);
  }

  Future<Either<NetworkError, DynamicWidgetModel>>
      fetchNullSearchPageWidgetList() {
    return _dynamicWidgetsRemoteDataSource.fetchNullSearchPageWidgetList();
  }

  Future<Either<NetworkError, DynamicWidgetModel>>
      fetchRewardsPageWidgetList() {
    return _dynamicWidgetsRemoteDataSource.fetchRewardsPageWidgetList();
  }
}
