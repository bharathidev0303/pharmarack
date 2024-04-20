import '../../data/model/cart_detail.dart';

class CartDetailsModel {
  final int? statusCode;
  final List<Store> stores;
  int totalSelectedStores;
  int totalItems;
  double totalCartValue;
  bool isAllExpanded;
  bool isAllSelected;
  CartLastItemModel? lastAddedProduct;

  CartDetailsModel(
      {this.statusCode,
      required this.stores,
      this.totalSelectedStores = 0,
      this.totalItems = 0,
      this.totalCartValue = 0.0,
      this.isAllExpanded = false,
      this.isAllSelected = true,
      this.lastAddedProduct});
}

class Store {
  final int storeId;
  final String storeName;
  final List<CartListItemEntity> cartItemList;
  bool isSelected = true;
  bool isExpanded = true;
  double total = 0.0;
  bool? isStoreValid = true;

  Store(this.storeId, this.storeName, this.cartItemList, this.total,
      this.isSelected, this.isExpanded);
}

class CartListItemModel {
  int? storeId;
  int productId;
  String? storeName;
  String? partyCode;
  String? productCode;
  int? retailerId;
  int? quantity;
  double? ptr;
  double? hiddenPtr;
  double totalAmount;
  int? free;
  double? netRate;
  String? scheme;
  double? gstPercentage;
  double? itemGSTValue;
  String? deliveryOption;
  String? remarkForStore;
  int? productAddedBy;
  String? priority;
  String? productName;
  double? productWiseAmount;
  int? isDeleted;
  int? allowMinQty;
  int? allowMaxQty;
  int? stepUpValue;
  bool? allowMOQ;
  int? minItemLimit;
  int? maxItemLimit;
  double? minAmountLimit;
  double? maxAmountLimit;
  int? minOrderQuantity;
  int? maxOrderQuantity;
  int? orderDeliveryModeStatus;
  int? orderRemarks;
  List<DeliveryPersonEntity>? deliveryPersonList;
  double? specialRate;
  int? stock;
  int? rShowPtr;
  String? deliveryPerson;
  String? deliveryPersonCode;
  String? dateFormat;
  int? rShowPtrForAllCompanies;
  String? company;
  int? isGroupWisePTR;
  int? isGroupWisePTRRetailer;
  int? rateValidity;
  double? storeWiseAmount;
  double? productWiseGSTAmount;
  String? cartSource;
  String? schemeType;
  bool? isValid = true;
  String? errorMessage;
  String? mrp;

  CartListItemModel(
      this.storeId,
      this.productId,
      this.storeName,
      this.partyCode,
      this.productCode,
      this.retailerId,
      this.quantity,
      this.ptr,
      this.hiddenPtr,
      this.totalAmount,
      this.free,
      this.netRate,
      this.scheme,
      this.gstPercentage,
      this.itemGSTValue,
      this.deliveryOption,
      this.remarkForStore,
      this.productAddedBy,
      this.priority,
      this.productName,
      this.productWiseAmount,
      this.isDeleted,
      this.allowMinQty,
      this.allowMaxQty,
      this.stepUpValue,
      this.allowMOQ,
      this.minItemLimit,
      this.maxItemLimit,
      this.minAmountLimit,
      this.maxAmountLimit,
      this.minOrderQuantity,
      this.maxOrderQuantity,
      this.orderDeliveryModeStatus,
      this.orderRemarks,
      this.deliveryPersonList,
      this.specialRate,
      this.stock,
      this.rShowPtr,
      this.deliveryPerson,
      this.deliveryPersonCode,
      this.dateFormat,
      this.rShowPtrForAllCompanies,
      this.company,
      this.isGroupWisePTR,
      this.isGroupWisePTRRetailer,
      this.rateValidity,
      this.storeWiseAmount,
      this.productWiseGSTAmount,
      this.cartSource,
      this.schemeType,
      this.mrp);
}

class CartLastItemModel {
  final String? productName;
  final int? quantity;
  final String? scheme;
  final int? quantityWithScheme;

  CartLastItemModel(
      {this.productName, this.quantity, this.scheme, this.quantityWithScheme});
}
