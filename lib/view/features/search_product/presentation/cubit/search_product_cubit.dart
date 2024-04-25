import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/storage_utils/storage.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_param.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/stockiest_priority_use_case.dart';
import 'package:pharmarack/view/features/filters/domain/model/filters/filter_type.dart';
import 'package:pharmarack/view/features/filters/presentation/pages/widgets/search_by_product_filter.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';
import 'package:pharmarack/view/features/search_product/domain/use_case/filter_search_product_use_case.dart';
import 'package:pharmarack/view/features/search_product/domain/use_case/search_product_use_case.dart';
import 'package:pharmarack/view/features/search_product/presentation/cubit/search_product_state.dart';
import '../../data/entity/molecule_and_company_model.dart';
import '../../domain/model/search_product/elastic_seach_api_request.dart';

/// This class [SearchProductCubit] is consume by the [SearchProductPage]
/// where all state will observed by [SearchProductPage]
class SearchProductCubit extends Cubit<SearchProductState> {
  final SearchProductUseCase _searchProductUseCase;
  final StockiestPriorityUseCase _stockiestPriorityUseCase;
  final FilterSearchProductUseCase _filterSearchProductUseCase;
  Map<String, SearchByProductFilter> filtersMap = {};
  Map<String, bool> filtersMapForApiRequest = {};
  final List<Company> checkedCompaniesList = [];
  late String searchQuery = "";
  late bool isDistributor = false;
  late String selectedDistributorName = '';
  late int selectedDistributorId = 0;
  late String selectedCompanyId = '';
  late String selectedCompanyName = '';
  SearchProductListModel? productListModel;
  List<SearchProductListModel> searchProductList = [];
  List<LoginResponseStores> distributors = [];

  SearchProductCubit(
    SearchProductUseCase searchProductUseCase,
    FilterSearchProductUseCase filterSearchProductUseCase,
    StockiestPriorityUseCase stockiestPriorityUseCase,
  )   : _searchProductUseCase = searchProductUseCase,
        _filterSearchProductUseCase = filterSearchProductUseCase,
        _stockiestPriorityUseCase = stockiestPriorityUseCase,
        super(SearchProductInitialState());

  handleSearchText(
      {required String query,
      int? id,
      String? storeName,
      String? companyId,
      String? companyName,
      String? contextType,
      bool? loaderEnable}) {
    selectedDistributorName = storeName ?? "";
    selectedDistributorId = id ?? 0;
    searchQuery = query;

    if (query.length >= 3) {
      if (contextType == "Company" && companyName!.isNotEmpty) {
        fetchCompanyProductFromElastic(
            query: query, storeName: storeName, companyName: companyName);
      } else if (contextType == "Theropy") {
        fetchTheropyProductFromElastic(
            query: query, storeName: storeName, companyName: companyName ?? "");
      } else {
        fetchProductFromElastic(query: query, storeName: storeName);
      }
    } else {
      if (query.isEmpty) {
        emit(SearchProductInitialState());
      }
    }
  }

  emitInitialState() {
    emit(SearchProductInitialState());
  }

  emitDistributorState() {
    emit(ShowDistributorPageState(
        selectedDistributorName, selectedDistributorId));
  }

  handleBlurState({required bool isBlur}) {
    emit(SearchProductBlurState(isBlur: isBlur));
  }

  showDistributorsPage(String distributorName, int id) {
    selectedDistributorName = distributorName;
    selectedDistributorId = id;
    if (getIt<RetailerInfoEntity>().stores != null) {
      var data = getIt<RetailerInfoEntity>()
          .stores
          ?.where((element) => element.storeId == id);
      if (data!.isNotEmpty) {
        if (data.first.isPartyLocked == 1 ||
            data.first.isPartyLockedSoonByDist == 1) {
          emit(ShowDistributorsLockedPageState(
              data.first.isPartyLocked!, data.first.isPartyLockedSoonByDist!));
        } else {
          emit(ShowDistributorPageState(distributorName, id));
        }
      } else {
        emit(DistributorsEmptyState());
      }
    } else {
      emit(DistributorsEmptyState());
    }
  }

  showCompanyPage(String companyName, String companyId) {
    selectedCompanyName = companyName;
    selectedCompanyId = companyId;
    if (selectedCompanyId != "" && selectedCompanyName != "") {
      emit(ShowCompanyPageState(
          selectedCompanyName, int.parse(selectedCompanyId)));
    }
  }

  fetchProductFromElastic({required String query, String? storeName}) async {
    String? cartSource;
    List<String> storeArr = [];
    emit(SearchProductLoadingState());
    if (storeName == null || storeName.isEmpty) {
      cartSource = 'MOVP';
    } else {
      cartSource = 'MOVD';
      storeArr.add(storeName);
      isDistributor = true;
    }
    try {
      final request = ElasticSearchApiRequest(
          searchKeyword: query,
          cartSource: cartSource,
          storeName: storeArr,
          count: 100,
          skipCount: 0);
      final response = await _searchProductUseCase.execute(
          params: SearchProductParams(request));
      response.fold((l) {
        emit(SearchProductErrorMessageState(l.error.message));
      }, (r) {
        if (searchQuery.isNotEmpty) {
          if (r.productList?.isNotEmpty ?? false) {
            searchProductList = r.productList!;
            refreshProductList();
          } else {
            emit(SearchProductDataEmptyListState());
          }
        } else {
          emit(SearchProductInitialState());
        }
      });
    } catch (e) {
      emit(SearchProductErrorState());
    }
  }

  fetchCompanyProductFromElastic(
      {required String query,
      String? storeName,
      required String companyName}) async {
    List<String> storeArr = [];
    List<String> companArr = [];

    if (companyName.isNotEmpty) {
      companArr.add(companyName);
    }
    if (storeName!.isNotEmpty) {
      storeArr.add(storeName);
    }
    emit(SearchProductLoadingState());

    try {
      final request = ElasticSearchCompanyApiRequest(
          searchKeyword: query,
          company: companArr,
          storeName: storeArr,
          count: 100,
          skipCount: 0);
      final response = await _searchProductUseCase.executeCompanyProducts(
          params: SearchCompanyProductParams(request));
      response.fold((l) {
        emit(SearchProductErrorMessageState(l.error.message));
      }, (r) {
        if (searchQuery.isNotEmpty) {
          if (r.productList?.isNotEmpty ?? false) {
            searchProductList = r.productList!;
            refreshProductList();
          } else {
            emit(SearchProductDataEmptyListState());
          }
        } else {
          emit(SearchProductInitialState());
        }
      });
    } catch (e) {
      emit(SearchProductErrorState());
    }
  }

  fetchTheropyProductFromElastic(
      {required String query,
      String? storeName,
      required String companyName}) async {
    List<String> storeArr = [];
    List<String> companArr = [];

    if (companyName.isNotEmpty) {
      companArr.add(companyName);
    }
    if (storeName!.isNotEmpty) {
      storeArr.add(storeName);
    }
    emit(SearchProductLoadingState());

    try {
      final request = ElasticSearchTheropyApiRequest(
          therapyName: query,
          company: companArr,
          storeName: storeArr,
          count: 100,
          skipCount: 0);
      final response = await _searchProductUseCase.executeTheropyProducts(
          params: SearchTheropyProductParams(request));
      response.fold((l) {
        emit(SearchProductErrorMessageState(l.error.message));
      }, (r) {
        if (searchQuery.isNotEmpty) {
          if (r.productList?.isNotEmpty ?? false) {
            searchProductList = r.productList!;
            refreshProductList();
          } else {
            emit(SearchProductDataEmptyListState());
          }
        } else {
          emit(SearchProductInitialState());
        }
      });
    } catch (e) {
      emit(SearchProductErrorState());
    }
  }

  fetchStockiestPriority(String page) async {
    final userId = getIt<RetailerInfoEntity>().userId ?? 0;
    final retailerId = getIt<RetailerInfoEntity>().getRetailerId() ?? 0;
    if (page == 'order_history') {
      final response =
          await _stockiestPriorityUseCase.orderDistributorExecute();

      response.fold(
          (l) => emit(SearchProductErrorMessageState(l.getFriendlyMessage())),
          (r) {
        if (r.isNotEmpty) {
          _filterSearchProductUseCase.updateStockiestPriorityLists(r);
        }
      });
    } else {
      final response = await _stockiestPriorityUseCase.execute(
          params: StockiestPriorityParams(
              StockiestPriorityParam(userId, retailedId: retailerId)));

      response.fold(
          (l) => emit(SearchProductErrorMessageState(l.getFriendlyMessage())),
          (r) {
        if (r.isNotEmpty) {
          _filterSearchProductUseCase.updateStockiestPriorityLists(r);
        }
      });
    }
  }

  void addInitialData() {
    if (filtersMap.isEmpty) {
      /*This code adds the default value of the filter which should be always selected
       the value is assigned as 1 or 8 because its the same value which is being added while rendering UI*/
      filtersMap.addAll({
        FilterType.searchBy.name:
            (!filtersMap.containsKey(FilterType.searchBy.name)
                ? SearchByProductFilter(
                    value: 1,
                    requestKey: FilterType.BothStockAndPriority,
                    groupKey: FilterType.searchBy,
                    selectedRadioValue: true)
                : filtersMap[FilterType.searchBy.name]!)
      });

      filtersMap.addAll({
        FilterType.stock.name: (!filtersMap.containsKey(FilterType.stock.name)
            ? SearchByProductFilter(
                value: 3,
                requestKey: FilterType.IncludeOutOfStockProducts,
                groupKey: FilterType.stock,
                selectedRadioValue: true)
            : filtersMap[FilterType.stock.name]!)
      });

      filtersMap.addAll({
        FilterType.scheme.name: (!filtersMap.containsKey(FilterType.scheme.name)
            ? SearchByProductFilter(
                value: 5,
                requestKey: FilterType.AllScheme,
                groupKey: FilterType.scheme,
                selectedRadioValue: true)
            : filtersMap[FilterType.scheme.name]!)
      });

      filtersMap.addAll({
        FilterType.expiry.name: (!filtersMap.containsKey(FilterType.expiry.name)
            ? SearchByProductFilter(
                value: 7,
                requestKey: FilterType.AllExpiry,
                groupKey: FilterType.expiry,
                selectedRadioValue: true)
            : filtersMap[FilterType.expiry.name]!)
      });
    }
    if (getIt<RetailerInfoEntity>().stores != null) {
      for (var element in getIt<RetailerInfoEntity>().stores!) {
        element.isDistributorCheck = false;
        distributors.add(element);
      }
    }

    if (filtersMapForApiRequest.isEmpty) {
      filtersMapForApiRequest.addAll({
        "${FilterType.searchBy.name}#${FilterType.BothStockAndPriority.name}":
            true
      });

      filtersMapForApiRequest.addAll({
        "${FilterType.searchBy.name}#${FilterType.OnlyPriority.name}": false
      });

      filtersMapForApiRequest.addAll({
        "${FilterType.stock.name}#${FilterType.IncludeOutOfStockProducts.name}":
            true
      });

      filtersMapForApiRequest.addAll(
          {"${FilterType.stock.name}#${FilterType.OnlyInStock.name}": false});

      filtersMapForApiRequest.addAll(
          {"${FilterType.scheme.name}#${FilterType.AllScheme.name}": true});

      filtersMapForApiRequest.addAll({
        "${FilterType.scheme.name}#${FilterType.OnlySchemeProduct.name}": false
      });

      filtersMapForApiRequest.addAll(
          {"${FilterType.expiry.name}#${FilterType.AllExpiry.name}": true});

      filtersMapForApiRequest.addAll(
          {"${FilterType.expiry.name}#${FilterType.HiddenExpiry.name}": false});

      filtersMapForApiRequest.addAll({
        "${FilterType.expiry.name}#${FilterType.VisibleExpiry.name}": false
      });
    }
  }

  void addFilter(SearchByProductFilter filter, dynamic value) {
    filtersMap.addAll({filter.groupKey!.name: value});
    SearchByProductFilter tempFilter = value as SearchByProductFilter;
    if (filtersMapForApiRequest.containsKey(
        "${tempFilter.groupKey!.name}#${tempFilter.requestKey!.name}")) {
      filtersMapForApiRequest.update(
          "${tempFilter.groupKey!.name}#${tempFilter.requestKey!.name}",
          (value) => tempFilter.selectedRadioValue);
    } else {
      filtersMapForApiRequest.addAll({
        "${tempFilter.groupKey!.name}#${tempFilter.requestKey!.name}":
            tempFilter.selectedRadioValue
      });
    }

    List<String> keysList = filtersMapForApiRequest.keys.toList();
    for (var key in keysList) {
      /*
        Only change the value of those filters whose group key is as same as the key &
        key also contains request key name because app should not change all filters value to the opposite of selected value
      */
      if (key.contains(tempFilter.groupKey!.name) &&
          !key.contains(tempFilter.requestKey!.name)) {
        filtersMapForApiRequest.update(
            key, (value) => !tempFilter.selectedRadioValue);
      }
    }
  }

  void addCheckBoxFilter(int storeId, bool isChecked) {
    LoginResponseStores storeData =
        distributors.firstWhere((product) => product.storeId == storeId);
    storeData.isDistributorCheck = isChecked;
    distributors[distributors.indexWhere(
        (element) => element.storeId == storeData.storeId)] = storeData;
  }

  void updateDialogProductData(SearchProductListModel data) {
    productListModel = data;
  }

  void invalidStore() async {
    emit(SearchProductLoadingState());
    await Future.delayed(const Duration(milliseconds: 500));
    emit(SearchProductErrorState());
  }

  void refreshProductList() {
    _filterSearchProductUseCase.updateProductLists(searchProductList);

    final filteredList = _filterSearchProductUseCase.filterList(
        filtersMapForApiRequest, distributors);

    filteredList.fold(
        (l) => emit(SearchProductErrorMessageState(l.getFriendlyMessage())),
        (r) => emit(SearchProductFilteredDataState(r[0], r[1])));
  }

  void resetFilters() {
    filtersMap.clear();
    filtersMapForApiRequest.clear();
    addInitialData();
    refreshProductList();
  }
}
