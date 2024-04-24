import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/error/local_error.dart';
import 'package:pharmarack/view/dashboard/cart/domain/model/cart_details_model.dart';
import 'package:pharmarack/view/dashboard/cart/presentation/cubit/draggable_cart/cubit/draggable_cart_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_model.dart';
import 'package:pharmarack/view/features/filters/domain/model/filters/filter_type.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';

class FilterSearchProductUseCase {
  final List<SearchProductListModel> productList;

  FilterSearchProductUseCase(this.productList);

  static List<StockiestPriorityModel> stockiestPriority = [];

  void updateProductLists(List<SearchProductListModel> list) {
    productList.clear();
    productList.addAll(list);
  }

  void updateStockiestPriorityLists(List<StockiestPriorityModel> list) {
    // Sort the list based on the 'priority' property
    list.sort((a, b) => (a.priority ?? 0).compareTo(b.priority ?? 0));
    stockiestPriority.clear();
    stockiestPriority.addAll(list);
  }

  Either<LocalError, List<List<SearchProductListModel>>> filterList(
      Map<String, bool> filtersMapForApiRequest,
      List<LoginResponseStores> distributors) {
    if (productList.isNotEmpty) {
      final List<SearchProductListModel> mappedDistributors = [];
      final List<SearchProductListModel> unMappedDistributors = [];
      for (SearchProductListModel product in productList) {
        if (product.isMapped != null && product.isMapped == 1) {
          if (product.productLock == false) {
            product.isAlreadyAdded =
                checkProductIsAlreadyAddedInCart(product.productCode!);
            product.existingQty = getExistingProductQty(product.productCode!);
            mappedDistributors.add(product);
          }
        } else {
          if (product.productLock == false) {
            product.isAlreadyAdded =
                checkProductIsAlreadyAddedInCart(product.productCode!);
            product.existingQty = getExistingProductQty(product.productCode!);
            unMappedDistributors.add(product);
          }
        }
      }
      if (filtersMapForApiRequest.isNotEmpty) {
        List<SearchProductListModel> filterMappedDistributors = [];
        List<SearchProductListModel> filterUnMappedDistributors = [];
        bool bothStockAndPriority = filtersMapForApiRequest[
                "${FilterType.searchBy.name}#${FilterType.BothStockAndPriority.name}"] ??
            false;

        bool onlyPriority = filtersMapForApiRequest[
                "${FilterType.searchBy.name}#${FilterType.OnlyPriority.name}"] ??
            false;

        bool onlyInStock = filtersMapForApiRequest[
                "${FilterType.stock.name}#${FilterType.OnlyInStock.name}"] ??
            false;

        bool onlySchemeProduct = filtersMapForApiRequest[
                "${FilterType.scheme.name}#${FilterType.OnlySchemeProduct.name}"] ??
            false;

        if (bothStockAndPriority) {
          mappedDistributors.sort((a, b) => a.stock!.compareTo(b.stock!));
          unMappedDistributors.sort((a, b) => a.stock!.compareTo(b.stock!));
          mappedDistributors
              .sort((a, b) => a.storePriority!.compareTo(b.storePriority!));
          unMappedDistributors
              .sort((a, b) => a.storePriority!.compareTo(b.storePriority!));
          filterMappedDistributors.addAll(mappedDistributors);
          filterUnMappedDistributors.addAll(unMappedDistributors);
        }
        if (onlyPriority) {
          mappedDistributors
              .sort((a, b) => a.storePriority!.compareTo(b.storePriority!));
          unMappedDistributors
              .sort((a, b) => a.storePriority!.compareTo(b.storePriority!));
          filterMappedDistributors.addAll(mappedDistributors);
          filterUnMappedDistributors.addAll(unMappedDistributors);
        }

        if (onlyInStock) {
          List<SearchProductListModel> temp = [];
          for (var element in filterMappedDistributors) {
            if (element.stock != null &&
                element.stock! > 0 &&
                element.rStockVisibility == '0') {
              temp.add(element);
            }
          }
          filterMappedDistributors.clear();
          filterMappedDistributors
              .addAll(temp as Iterable<SearchProductListModel>);
          temp.clear();

          for (var element in filterUnMappedDistributors) {
            if (element.stock != null && element.stock! > 0) {
              temp.add(element);
            }
          }
          filterUnMappedDistributors.clear();
          filterUnMappedDistributors
              .addAll(temp as Iterable<SearchProductListModel>);
          temp.clear();
        }

        if (onlySchemeProduct) {
          List<SearchProductListModel> temp = [];
          for (var element in filterMappedDistributors) {
            if (element.scheme != null && element.scheme!.isNotEmpty) {
              temp.add(element);
            }
          }
          filterMappedDistributors.clear();
          filterMappedDistributors.addAll(temp);
          temp.clear();

          for (var element in filterUnMappedDistributors) {
            if (element.scheme != null && element.scheme!.isNotEmpty) {
              temp.add(element);
            }
          }
          filterUnMappedDistributors.clear();
          filterUnMappedDistributors.addAll(temp);
          temp.clear();
        }

        if (distributors.isNotEmpty) {
          var tempStore = [];
          List<SearchProductListModel> temp = [];
          var data = distributors
              .where((element) => element.isDistributorCheck == true);
          if (data.isNotEmpty) {
            for (var element in data) {
              tempStore.add(element.storeId);
            }

            for (var element in filterMappedDistributors) {
              if (tempStore.contains(element.storeId)) {
                temp.add(element);
              }
            }
            filterMappedDistributors.clear();
            filterMappedDistributors.addAll(temp);
            temp.clear();
            for (var element in filterUnMappedDistributors) {
              if (tempStore.contains(element.storeId)) {
                temp.add(element);
              }
            }
            filterUnMappedDistributors.clear();
            filterUnMappedDistributors.addAll(temp);
            temp.clear();
          }
        }
        return Right([
          sortProductListAsPerStock(filterMappedDistributors),
          sortProductListAsPerStock(filterUnMappedDistributors)
        ]);
      }
      return Right([
        sortProductListAsPerStock(mappedDistributors),
        sortProductListAsPerStock(unMappedDistributors)
      ]);
    } else {
      return Left(LocalError(
          message: 'List is empty', localError: 2, cause: Exception()));
    }
  }

  List<SearchProductListModel> sortProductListAsPerStock(
      List<SearchProductListModel> list) {
    List<SearchProductListModel> tempList = [];
    tempList.addAll(list.where((element) =>
        element.stock! > 10 &&
        element.rStockVisibility == '0' &&
        element.isShowNonMappedOrderStock == 0));
    tempList.addAll(list.where((element) =>
        element.stock! < 10 &&
        element.stock! > 1 &&
        element.rStockVisibility == '0' &&
        element.isShowNonMappedOrderStock == 0));
    tempList.addAll(list.where((element) =>
        element.stock == 0 ||
        element.rStockVisibility == '1' ||
        element.isShowNonMappedOrderStock == 1));
    return tempList;
  }

  int? getExistingProductQty(String productCode) {
    List<Store> list = getIt<DraggableCartScreenCubit>().stores;
    for (var element in list) {
      for (var data in element.cartItemList) {
        if (data.productCode == productCode) {
          return data.quantity;
        }
      }
    }
    return 0;
  }

  bool checkProductIsAlreadyAddedInCart(String productCode) {
    List<Store> list = getIt<DraggableCartScreenCubit>().stores;
    for (var element in list) {
      for (var data in element.cartItemList) {
        if (data.productCode == productCode) {
          return true;
        }
      }
    }
    return false;
  }
}
