import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/distributor_store_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_model.dart';

class MappedNonMappedSearchUseCase {
  final List<StockiestPriorityModel> _mappedList;
  final List<DistributorStoreModel> _nonMappedList;

  MappedNonMappedSearchUseCase(
      {required List<StockiestPriorityModel> mappedList,
      required List<DistributorStoreModel> nonMappedList})
      : _mappedList = mappedList,
        _nonMappedList = nonMappedList;

  void updateList(List<StockiestPriorityModel> mappedValues,
      List<DistributorStoreModel> nonMappedValues) {
    _mappedList.clear();
    _nonMappedList.clear();
    _mappedList.addAll(mappedValues);
    _nonMappedList.addAll(nonMappedValues);
  }

  (List<StockiestPriorityModel>, List<DistributorStoreModel>)
      searchMappedNonMappedResults(String searchQuery) {
    final mappedFilterResults = searchQuery.isEmpty
        ? _mappedList
        : _mappedList
            .where((element) =>
                element.storeName
                    ?.toLowerCase()
                    .contains(searchQuery.toLowerCase()) ??
                false)
            .toList();

    final nonMappedFilterResults = searchQuery.isEmpty
        ? _nonMappedList
        : _nonMappedList
            .where((element) =>
                element.storeName
                    ?.toLowerCase()
                    .contains(searchQuery.toLowerCase()) ??
                false)
            .toList();

    return (List.of(mappedFilterResults), List.of(nonMappedFilterResults));
  }

  List<StockiestPriorityModel> sortMappedListOnPriority() {
    var (nonZero, zero) = (
      _mappedList
          .where((element) => element.priority != 0)
          .sortWith((t) => t.priority, Order.orderInt),
      _mappedList.where((element) => element.priority == 0)
    );
    return [...nonZero, ...zero]
        .mapWithIndex((t, index) => t.copyWith(displayIndex: (index + 1)))
        .toList();
  }

  void updateListBasedOnReorder(List<StockiestPriorityModel> mappedValues) {
    _mappedList.clear();
    _mappedList.addAll(mappedValues);
  }

  (List<StockiestPriorityModel>, List<DistributorStoreModel>)
      updateNonMappedState(int storeId, String status, String searchQuery) {
    final (mappedResults, nonMappedResults) =
        searchMappedNonMappedResults(searchQuery);

    int index =
        nonMappedResults.indexWhere((element) => element.storeId == storeId);
    if (index != -1) {
      nonMappedResults[index] =
          nonMappedResults[index].copyWith(status: status);
    }

    int anotherIndex =
        _nonMappedList.indexWhere((element) => element.storeId == storeId);
    if (anotherIndex != -1) {
      _nonMappedList[anotherIndex] =
          _nonMappedList[anotherIndex].copyWith(status: status);
    }
    return (List.of(mappedResults), List.of(nonMappedResults));
  }
}
