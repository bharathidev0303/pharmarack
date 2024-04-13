import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/features/dynamic_widgets/data/data_source/top_widgets_remote_datasource.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/model/TopBrandsList.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/model/TopDistributorsList.dart';

class TopWidgetsViewMoreRepository {
  final TopWidgetsViewMoresRemoteDataSource _topWidgetsViewMoreRemoteDataSource;

  TopWidgetsViewMoreRepository(this._topWidgetsViewMoreRemoteDataSource);

  Future<Either<NetworkError, List<TopBrandsLists>>> fetchBrandsList(
      {required int page, required int limit}) {
    return _topWidgetsViewMoreRemoteDataSource.fetchBrandsList(
        page: page, limit: limit);
  }

  Future<Either<NetworkError, List<TopDistributorsList>>> fetchDistributorsList(
      {required int page, required int limit}) {
    return _topWidgetsViewMoreRemoteDataSource.fetchDistributorsList(
        page: page, limit: limit);
  }
}
