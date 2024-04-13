import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/error/local_error.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_model.dart';

class DistributorDropDownUseCase {
  final _distributorList = GetIt.instance<RetailerInfoEntity>().stores ?? [];

  List<LoginResponseStores> getListOfDistributorsFromLogin() {
    return _distributorList;
  }

  static List<StockiestPriorityModel> stockiestPriority = [];

  void updateStockiestPriorityLists(List<StockiestPriorityModel> list) {
    // Sort the list based on the 'priority' property
    list.sort((a, b) => (a.priority ?? 0).compareTo(b.priority ?? 0));
    stockiestPriority.clear();
    stockiestPriority.addAll(list);
  }

  Either<LocalError, List<List<LoginResponseStores>>> getListOfDistributors() {
    final storesList = getListOfDistributorsFromLogin();
    if (storesList.isNotEmpty) {
      final List<LoginResponseStores> mappedDistributors = [];
      final List<LoginResponseStores> preferredDistributors = [];
      final List<LoginResponseStores> unMappedDistributors = [];
      for (LoginResponseStores store in storesList) {
        if (store.ismapped != null) {
          if (store.ismapped == 1) {
            mappedDistributors.add(store);
          } else {
            unMappedDistributors.add(store);
          }
        } else {
          return Left(LocalError(
              message: 'Mapper not found', localError: 2, cause: Exception()));
        }
      }

      for (StockiestPriorityModel priorityModel in stockiestPriority) {
        for (LoginResponseStores mappedDistributorsModel
            in mappedDistributors) {
          if (priorityModel.storeId == mappedDistributorsModel.storeId) {
            preferredDistributors.add(mappedDistributorsModel);
          }
        }
      }

      return Right([mappedDistributors, unMappedDistributors]);
    } else {
      return Left(LocalError(
          message: 'List is empty', localError: 2, cause: Exception()));
    }
  }

  List<LoginResponseStores> filterDistributorList(String query) {
    return _distributorList
        .where((element) =>
            element.storeName?.toLowerCase().contains(query.toLowerCase()) ??
            false)
        .toList();
  }

  List<List<LoginResponseStores>> getMappedList(String query) {
    final List<LoginResponseStores> mappedDistributors = [];
    final List<LoginResponseStores> unMappedDistributors = [];
    final List<LoginResponseStores> preferredDistributors = [];

    final distributorList = filterDistributorList(query);

    for (var i = 0; i < distributorList.length; i++) {
      if (distributorList[i].ismapped != null) {
        if (distributorList[i].ismapped == 1) {
          bool isPreferred = stockiestPriority.any((priorityModel) =>
              distributorList[i].storeId == priorityModel.storeId);
          if (isPreferred) {
            preferredDistributors.add(distributorList[i]);
          }
          mappedDistributors.add(distributorList[i]);
        } else {
          unMappedDistributors.add(distributorList[i]);
        }
      }
    }

    return [mappedDistributors, unMappedDistributors];
  }
}
