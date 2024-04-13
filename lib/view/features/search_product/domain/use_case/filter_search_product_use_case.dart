import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/error/local_error.dart';
import 'package:pharmarack/view/features/cart/domain/model/cart_details_model.dart';
import 'package:pharmarack/view/features/cart/presentation/cubit/draggable_cart/cubit/draggable_cart_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_model.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';

class FilterSearchProductUseCase {
  final List<SearchProductListModel> productList;

  FilterSearchProductUseCase(this.productList);

  static List<StockiestPriorityModel> stockiestPriority = [];

  void updateProductLists(List<SearchProductListModel> list) {
    // List<SearchProductListModel> green=[];
    // List<SearchProductListModel> blue=[];
    // List<SearchProductListModel> red=[];
    //
    // red.addAll(list.where((element) => element.stock==0 || element.rStockVisibility=='1'));
    // green.addAll(list.where((element) => element.stock! > 10 && element.rStockVisibility=='0'));
    // blue.addAll(list.where((element) => element.stock! < 10 && element.stock! >1 && element.rStockVisibility=='0'));
    //
    productList.clear();
    productList.addAll(list.where(
        (element) => element.stock! > 10 && element.rStockVisibility == '0'));
    productList.addAll(list.where((element) =>
        element.stock! < 10 &&
        element.stock! > 1 &&
        element.rStockVisibility == '0'));
    productList.addAll(list.where(
        (element) => element.stock == 0 || element.rStockVisibility == '1'));
  }

  void updateStockiestPriorityLists(List<StockiestPriorityModel> list) {
    // Sort the list based on the 'priority' property
    list.sort((a, b) => (a.priority ?? 0).compareTo(b.priority ?? 0));
    stockiestPriority.clear();
    stockiestPriority.addAll(list);
  }

  Either<LocalError, List<List<SearchProductListModel>>> filterList() {
    if (productList.isNotEmpty) {
      final List<SearchProductListModel> mappedDistributors = [];
      //final List<SearchProductListModel> preferredDistributors = [];
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

        // if (product.isMapped != null) {
        //   if (product.isMapped == 1) {
        //     mappedDistributors.add(product);
        //   } else {
        //     unMappedDistributors.add(product);
        //   }
        // } else {
        //   return Left(LocalError(
        //       message: 'Mapper not found', localError: 2, cause: Exception()));
        // }
      }
      // ///TODO:Need to verify this logic
      // for (StockiestPriorityModel priorityModel in stockiestPriority) {
      //   for (SearchProductListModel mappedDistributorsModel
      //       in mappedDistributors) {
      //     if (priorityModel.storeId == mappedDistributorsModel.storeId) {
      //       preferredDistributors.add(mappedDistributorsModel);
      //     }
      //   }
      // }

      return Right([mappedDistributors, unMappedDistributors]);
    } else {
      return Left(LocalError(
          message: 'List is empty', localError: 2, cause: Exception()));
    }
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

  String getStoreIds() {
    final fullStoresList = getIt<RetailerInfoEntity>().stores ?? [];
    final stores = fullStoresList.sublist(0, 10);
    // final stores = getIt<LoginEntity>().stores ?? [];

    if (stores.isNotEmpty) {
      String idString = stores.map((id) => id.storeId.toString()).join(',');
      return idString;
    } else {
      return '';
    }
  }

  String getMappedStoreIds() {
    final stores = getIt<RetailerInfoEntity>().stores ?? [];
    if (stores.isNotEmpty) {
      return stores
          .filter((t) => t.ismapped == 1)
          .toList()
          .map((e) => e.storeId)
          .toList()
          .join(",");
    } else {
      return '';
    }
  }

  String getNonMappedStoreIds() {
    final stores = getIt<RetailerInfoEntity>().stores ?? [];
    if (stores.isNotEmpty) {
      return stores
          .filter((t) => t.ismapped == 0)
          .toList()
          .map((e) => e.storeId)
          .toList()
          .join(",");
    } else {
      return '';
    }
  }
}
