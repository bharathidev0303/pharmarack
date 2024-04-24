import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/main/flavor.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/packages/storage_utils/storage.dart';
import 'package:pharmarack/packages/storage_utils/storage_constants.dart';
import 'package:pharmarack/view/features/search_product/data/api_service/search_product_api_service.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';
import 'package:pharmarack/view/features/search_product/domain/use_case/search_product_use_case.dart';

/// This class [SearchProductRemoteDataSource] is used to fetch Api from network
/// using [SearchProductApiService] class.
class SearchProductRemoteDataSource {
  final SearchProductApiService _searchProductApiService;
  final Storage _secureStorage;

  SearchProductRemoteDataSource(
      this._searchProductApiService, this._secureStorage);

  final Env env = getIt<Flavor>().env;

  Future<Either<NetworkError, SearchProductModel>> fetchProductFromElastic(
      SearchProductParams param) async {
    String? loginToken =
        await _secureStorage.getItem(key: StorageConstants.authToken);
    var body = {
      'SearchKeyword': param.elasticSearchApiRequest.searchKeyword,
      'CartSource': param.elasticSearchApiRequest.cartSource,
      'StoreName': param.elasticSearchApiRequest.storeName,
      'Count': param.elasticSearchApiRequest.count,
      'SkipCount': param.elasticSearchApiRequest.skipCount
    };
    final response = await safeApiCall(_searchProductApiService
        .fetchProductFromElastic(body, loginToken ?? ''));
    return response.fold((l) => left(l), (r) {
      return right(SearchProductModel(
          message: r.data.message,
          statusCode: r.data.statusCode,
          productList: r.data.data
              .map((e) => SearchProductListModel(
                  companyName: e.companyName ?? '',
                  slot: e.storeId,
                  id: e.storeId,
                  mrp: e.mrp,
                  cashbackMessage: e.cashbackMessage ?? '',
                  ptr: e.ptr,
                  packing: e.packing,
                  displayProductCode: e.displayProductCode,
                  productName: e.productName,
                  qty: e.stock,
                  company: e.company,
                  storeName: e.storeName,
                  stock: e.stock,
                  isMapped: e.isMapped,
                  productFullName: e.productFullName ?? '',
                  expiryDate: e.expiryDate ?? '',
                  margin: e.margin != 'NA' ? double.parse(e.margin) : 0,
                  storeProductGST: e.storeProductGst,
                  prProductName: e.prProductName,
                  scheme: e.scheme,
                  productCode: e.productCode,
                  storeId: e.storeId,
                  hiddenPtr: e.hiddenPtr,
                  netRate: e.netRate != 'NA' ? double.parse(e.netRate) : 0,
                  productLock: e.productLock,
                  stepUpValue: e.stepUpValue,
                  rStockVisibility: e.rStockVisibility,
                  allowMaxQty: e.allowMaxQty,
                  allowMinQty: e.allowMinQty,
                  isPartyLocked:
                      e.isPartyLocked != 'NA' ? int.parse(e.isPartyLocked) : 0,
                  isPartyLockedSoonByDist: e.isPartyLockedSoonByDist != 'NA'
                      ? int.parse(e.isPartyLockedSoonByDist)
                      : 0))
              .toList()));
    });
  }

  Future<Either<NetworkError, SearchProductModel>>
      fetchCompanyProductFromElastic(SearchCompanyProductParams param) async {
    String? loginToken =
        await _secureStorage.getItem(key: StorageConstants.authToken);
    var body = {
      'SearchKeyword': param.elasticSearchCompanyApiRequest.searchKeyword,
      'Company': param.elasticSearchCompanyApiRequest.company,
      'StoreName': param.elasticSearchCompanyApiRequest.storeName,
      'Count': param.elasticSearchCompanyApiRequest.count,
      'SkipCount': param.elasticSearchCompanyApiRequest.skipCount
    };
    final response = await safeApiCall(_searchProductApiService
        .fetchCompanyProductFromElastic(body, loginToken ?? ''));
    return response.fold((l) => left(l), (r) {
      return right(SearchProductModel(
          message: r.data.message,
          statusCode: r.data.statusCode,
          productList: r.data.data
              .map((e) => SearchProductListModel(
                  companyName: e.companyName ?? '',
                  slot: e.storeId,
                  id: e.storeId,
                  mrp: e.mrp,
                  cashbackMessage: e.cashbackMessage ?? '',
                  ptr: e.ptr,
                  packing: e.packing,
                  productName: e.productName,
                  qty: e.stock,
                  company: e.company,
                  storeName: e.storeName,
                  stock: e.stock,
                  isMapped: e.isMapped,
                  productFullName: e.productFullName ?? '',
                  displayProductCode: e.displayProductCode,
                  expiryDate: e.expiryDate ?? '',
                  margin: e.margin != 'NA' ? double.parse(e.margin) : 0,
                  storeProductGST: e.storeProductGst,
                  prProductName: e.prProductName,
                  scheme: e.scheme,
                  productCode: e.productCode,
                  storeId: e.storeId,
                  hiddenPtr: e.hiddenPtr,
                  netRate: e.netRate != 'NA' ? double.parse(e.netRate) : 0,
                  productLock: e.productLock,
                  stepUpValue: e.stepUpValue,
                  rStockVisibility: e.rStockVisibility,
                  allowMaxQty: e.allowMaxQty,
                  allowMinQty: e.allowMinQty,
                  isPartyLocked:
                      e.isPartyLocked != 'NA' ? int.parse(e.isPartyLocked) : 0,
                  isPartyLockedSoonByDist: e.isPartyLockedSoonByDist != 'NA'
                      ? int.parse(e.isPartyLockedSoonByDist)
                      : 0))
              .toList()));
    });
  }

  Future<Either<NetworkError, SearchProductModel>>
      fetchTheropyProductFromElastic(SearchTheropyProductParams param) async {
    String? loginToken =
        await _secureStorage.getItem(key: StorageConstants.authToken);
    var body = {
      'TherapyName': param.elasticSearchTheropyApiRequest.therapyName,
      'Company': param.elasticSearchTheropyApiRequest.company,
      'StoreName': param.elasticSearchTheropyApiRequest.storeName,
      'Count': param.elasticSearchTheropyApiRequest.count,
      'SkipCount': param.elasticSearchTheropyApiRequest.skipCount
    };
    final response = await safeApiCall(_searchProductApiService
        .fetchTheropyProductFromElastic(body, loginToken ?? ''));
    return response.fold((l) => left(l), (r) {
      return right(SearchProductModel(
          message: r.data.message,
          statusCode: r.data.statusCode,
          productList: r.data.data
              .map((e) => SearchProductListModel(
                  companyName: e.companyName ?? '',
                  slot: e.storeId,
                  id: e.storeId,
                  mrp: e.mrp,
                  cashbackMessage: e.cashbackMessage ?? '',
                  ptr: e.ptr,
                  packing: e.packing,
                  productName: e.productName,
                  qty: e.stock,
                  company: e.company,
                  storeName: e.storeName,
                  stock: e.stock,
                  isMapped: e.isMapped,
                  productFullName: e.productFullName ?? '',
                  displayProductCode: e.displayProductCode,
                  expiryDate: e.expiryDate ?? '',
                  margin: e.margin != 'NA' ? double.parse(e.margin) : 0,
                  storeProductGST: e.storeProductGst,
                  prProductName: e.prProductName,
                  scheme: e.scheme,
                  productCode: e.productCode,
                  storeId: e.storeId,
                  hiddenPtr: e.hiddenPtr,
                  netRate: e.netRate != 'NA' ? double.parse(e.netRate) : 0,
                  productLock: e.productLock,
                  stepUpValue: e.stepUpValue,
                  rStockVisibility: e.rStockVisibility,
                  allowMaxQty: e.allowMaxQty,
                  allowMinQty: e.allowMinQty,
                  isPartyLocked:
                      e.isPartyLocked != 'NA' ? int.parse(e.isPartyLocked) : 0,
                  isPartyLockedSoonByDist: e.isPartyLockedSoonByDist != 'NA'
                      ? int.parse(e.isPartyLockedSoonByDist)
                      : 0))
              .toList()));
    });
  }
}
