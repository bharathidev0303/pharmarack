class SearchProductModel {
  final int? statusCode;

  final String? message;

  final List<SearchProductListModel>? productList;

  SearchProductModel({this.statusCode, this.message, this.productList});

  @override
  String toString() {
    return 'SearchProductModel(statusCode: $statusCode, message: $message, productList: $productList)';
  }
}

class SearchProductListModel {
  int? id;
  String? productName;
  String? prProductName;
  String? productFullName;
  int? qty;
  int? slot;
  String? companyName;
  String? packing;
  double? mrp;
  double? ptr;
  String? cashbackMessage;
  String? storeName;
  String? company;
  int? stock;
  int? isMapped;
  double? margin;
  double? storeProductGST;
  String? expiryDate;
  String? scheme;
  int? storeId;
  String? productCode;
  String? displayProductCode;
  double? hiddenPtr;
  double? netRate;
  bool? productLock;
  int? stepUpValue;
  int? allowMinQty;
  int? allowMaxQty;
  bool? isAlreadyAdded;
  int? existingQty;
  String? rStockVisibility;
  int? isPartyLocked;
  int? isPartyLockedSoonByDist;

  SearchProductListModel(
      {this.id,
      this.companyName,
      this.mrp,
      this.packing,
      this.slot,
      this.productName,
      this.qty,
      this.ptr,
      this.cashbackMessage,
      this.company,
      this.storeName,
      this.stock,
      this.isMapped,
      this.productFullName,
      this.margin,
      this.storeProductGST,
      this.expiryDate,
      this.prProductName,
      this.scheme,
      this.storeId,
      this.productCode,
      this.displayProductCode,
      this.hiddenPtr,
      this.netRate,
      this.productLock,
      this.stepUpValue,
      this.rStockVisibility,
      this.allowMaxQty,
      this.allowMinQty,
      this.isPartyLocked,
      this.isPartyLockedSoonByDist,
      this.existingQty});

  @override
  String toString() {
    return 'SearchProductListModel(id: $id, productName: $productName, qty: $qty, companyName: $companyName, mrp: $mrp)';
  }

  SearchProductListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    storeName = json['storeName'];
    company = json['company'];
    ptr = json['ptr'];
    mrp = json['mrp'];
    stock = json['stock'];
    margin = json['margin'];
    scheme = json['scheme'];
    productLock = json['ProductLock'];
    stepUpValue = json['StepUpValue'];
    rStockVisibility = json['RStockVisibility'];
    isPartyLocked = json['IsPartyLocked'];
    isPartyLockedSoonByDist = json['IsPartyLockedSoonByDist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productName'] = productName;
    data['storeName'] = storeName;
    data['company'] = company;
    data['ptr'] = ptr;
    data['mrp'] = mrp;
    data['stock'] = stock;
    data['margin'] = margin;
    data['scheme'] = scheme;
    data['ProductLock'] = productLock;
    data['StepUpValue'] = stepUpValue;
    data['RStockVisibility'] = rStockVisibility;
    data['IsPartyLocked'] = isPartyLocked;
    data['IsPartyLockedSoonByDist'] = isPartyLockedSoonByDist;
    return data;
  }
}
