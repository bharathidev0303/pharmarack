import 'package:json_annotation/json_annotation.dart';

part 'display_order_detail.g.dart';

@JsonSerializable()
class DisplayOrderDetail {
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'data')
  Data? data;
  @JsonKey(name: 'message')
  String? message;

  DisplayOrderDetail({
    this.success,
    this.data,
    this.message,
  });

  factory DisplayOrderDetail.fromJson(Map<String, dynamic> json) =>
      _$DisplayOrderDetailFromJson(json);

  Map<String, dynamic> toJson() => _$DisplayOrderDetailToJson(this);

  DisplayOrderDetail copyWith({
    bool? success,
    Data? data,
    String? message,
  }) {
    return DisplayOrderDetail(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'invoiceTotal')
  String? invoiceTotal;
  @JsonKey(name: 'invoiceTax')
  String? invoiceTax;
  @JsonKey(name: 'invoiceDiscount')
  String? invoiceDiscount;
  @JsonKey(name: 'bouncedTaxTotal')
  String? bouncedTaxTotal;
  @JsonKey(name: 'bouncedTotal')
  String? bouncedTotal;
  @JsonKey(name: 'bouncedDiscountTotal')
  String? bouncedDiscountTotal;
  @JsonKey(name: 'invoicedItems')
  List<InvoicedItems>? invoicedItems;
  @JsonKey(name: 'bouncedItems')
  List<BouncedItems>? bouncedItems;

  Data({
    this.invoiceTotal,
    this.invoiceTax,
    this.invoiceDiscount,
    this.bouncedTaxTotal,
    this.bouncedTotal,
    this.bouncedDiscountTotal,
    this.invoicedItems,
    this.bouncedItems,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    String? invoiceTotal,
    String? invoiceTax,
    String? invoiceDiscount,
    String? bouncedTaxTotal,
    String? bouncedTotal,
    String? bouncedDiscountTotal,
    List<InvoicedItems>? invoicedItems,
    List<BouncedItems>? bouncedItems,
  }) {
    return Data(
      invoiceTotal: invoiceTotal ?? this.invoiceTotal,
      invoiceTax: invoiceTax ?? this.invoiceTax,
      invoiceDiscount: invoiceDiscount ?? this.invoiceDiscount,
      bouncedTaxTotal: bouncedTaxTotal ?? this.bouncedTaxTotal,
      bouncedTotal: bouncedTotal ?? this.bouncedTotal,
      bouncedDiscountTotal: bouncedDiscountTotal ?? this.bouncedDiscountTotal,
      invoicedItems: invoicedItems ?? this.invoicedItems,
      bouncedItems: bouncedItems ?? this.bouncedItems,
    );
  }
}

@JsonSerializable()
class InvoicedItems {
  @JsonKey(name: 'OrderDetailId')
  int? orderDetailId;
  @JsonKey(name: 'OrderId')
  int? orderId;
  @JsonKey(name: 'OrderNo')
  String? orderNo;
  @JsonKey(name: 'PartyCode')
  String? partyCode;
  @JsonKey(name: 'OrderDate')
  String? orderDate;
  @JsonKey(name: 'StoreId')
  int? storeId;
  @JsonKey(name: 'StoreName')
  String? storeName;
  @JsonKey(name: 'MobileNumber')
  String? mobileNumber;
  @JsonKey(name: 'OrderAmount')
  double? orderAmount;
  @JsonKey(name: 'CreatedBy')
  int? createdBy;
  @JsonKey(name: 'CreatedDate')
  String? createdDate;
  @JsonKey(name: 'IsUploaded')
  int? isUploaded;
  @JsonKey(name: 'UploadDate')
  String? uploadDate;
  @JsonKey(name: 'IsProcessed')
  int? isProcessed;
  @JsonKey(name: 'ProcessedDate')
  String? processedDate;
  @JsonKey(name: 'DeliveryMode')
  String? deliveryMode;
  @JsonKey(name: 'Remarks')
  String? remarks;
  @JsonKey(name: 'OrderSource')
  String? orderSource;
  @JsonKey(name: 'CreatedByName')
  String? createdByName;
  @JsonKey(name: 'ProductCode')
  String? productCode;
  @JsonKey(name: 'DisplayProductCode')
  String? displayProductCode;
  @JsonKey(name: 'ProductFullName')
  String? productFullName;
  @JsonKey(name: 'ProductName')
  String? productName;
  @JsonKey(name: 'CompanyCode')
  String? companyCode;
  @JsonKey(name: 'Company')
  String? company;
  @JsonKey(name: 'Quantity')
  int? quantity;
  @JsonKey(name: 'MRP')
  String? mrp;
  @JsonKey(name: 'PTR')
  String? ptr;
  @JsonKey(name: 'StoreProductPTR')
  String? storeProductPTR;
  @JsonKey(name: 'NetRate')
  String? netRate;
  @JsonKey(name: 'ProductWiseAmount')
  String? productWiseAmount;
  @JsonKey(name: 'Free')
  int? free;
  @JsonKey(name: 'HiddenPTR')
  String? hiddenPTR;
  @JsonKey(name: 'GST')
  String? gst;
  @JsonKey(name: 'Margin')
  String? margin;
  @JsonKey(name: 'Schemeold')
  String? schemeold;
  @JsonKey(name: 'Scheme')
  dynamic scheme;
  @JsonKey(name: 'DateFormat')
  String? dateFormat;
  @JsonKey(name: 'SchemeFrom')
  dynamic schemeFrom;
  @JsonKey(name: 'SchemeTo')
  dynamic schemeTo;
  @JsonKey(name: 'SchemeType')
  dynamic schemeType;
  @JsonKey(name: 'Packing')
  String? packing;
  @JsonKey(name: 'BoxPacking')
  String? boxPacking;
  @JsonKey(name: 'CasePacking')
  String? casePacking;
  @JsonKey(name: 'ActualQuantityReceived')
  int? actualQuantityReceived;
  @JsonKey(name: 'ActualFreeReceived')
  dynamic actualFreeReceived;
  @JsonKey(name: 'MinItemLimit')
  int? minItemLimit;
  @JsonKey(name: 'MaxItemLimit')
  int? maxItemLimit;
  @JsonKey(name: 'MinAmountLimit')
  String? minAmountLimit;
  @JsonKey(name: 'MaxAmountLimit')
  String? maxAmountLimit;
  @JsonKey(name: 'AllowMinQty')
  int? allowMinQty;
  @JsonKey(name: 'AllowMaxQty')
  int? allowMaxQty;
  @JsonKey(name: 'StepUpValue')
  int? stepUpValue;
  @JsonKey(name: 'AllowMOQ')
  String? allowMOQ;
  @JsonKey(name: 'IsDODProduct')
  int? isDODProduct;
  @JsonKey(name: 'RetailerSchemePreference')
  int? retailerSchemePreference;
  @JsonKey(name: 'RetailerSchemePriority')
  int? retailerSchemePriority;
  @JsonKey(name: 'SalesmanSchemePreference')
  int? salesmanSchemePreference;
  @JsonKey(name: 'SalesmanSchemePriority')
  int? salesmanSchemePriority;
  @JsonKey(name: 'DisplayHalfScheme')
  String? displayHalfScheme;
  @JsonKey(name: 'DisplayHalfSchemeOn')
  String? displayHalfSchemeOn;
  @JsonKey(name: 'RoundOffDisplayHalfScheme')
  String? roundOffDisplayHalfScheme;
  @JsonKey(name: 'RStockVisibility')
  int? rStockVisibility;
  @JsonKey(name: 'HalfSchemeValueToRetailer')
  int? halfSchemeValueToRetailer;
  @JsonKey(name: 'HalfSchemeValueToSalesman')
  int? halfSchemeValueToSalesman;
  @JsonKey(name: 'IsShowNonMappedOrderStock')
  int? isShowNonMappedOrderStock;
  @JsonKey(name: 'IsGroupWisePTRRetailer')
  int? isGroupWisePTRRetailer;
  @JsonKey(name: 'IsGroupWisePTR')
  int? isGroupWisePTR;
  @JsonKey(name: 'OrderDeliveryModeStatus')
  int? orderDeliveryModeStatus;
  @JsonKey(name: 'Stock')
  String? stock;
  @JsonKey(name: 'Loose')
  String? loose;
  @JsonKey(name: 'ProductLock')
  int? productLock;
  @JsonKey(name: 'DProductLock')
  String? dProductLock;
  @JsonKey(name: 'RShowPtr')
  int? rShowPtr;
  @JsonKey(name: 'RShowPtrForAllCompanies')
  int? rShowPtrForAllCompanies;
  @JsonKey(name: 'IsPartyLocked')
  String? isPartyLocked;
  @JsonKey(name: 'DoNotShowToRetailer')
  int? doNotShowToRetailer;
  @JsonKey(name: 'EnabledNonMappedOrder')
  int? enabledNonMappedOrder;
  @JsonKey(name: 'ExpiryDate')
  dynamic expiryDate;

  InvoicedItems({
    this.orderDetailId,
    this.orderId,
    this.orderNo,
    this.partyCode,
    this.orderDate,
    this.storeId,
    this.storeName,
    this.mobileNumber,
    this.orderAmount,
    this.createdBy,
    this.createdDate,
    this.isUploaded,
    this.uploadDate,
    this.isProcessed,
    this.processedDate,
    this.deliveryMode,
    this.remarks,
    this.orderSource,
    this.createdByName,
    this.productCode,
    this.displayProductCode,
    this.productFullName,
    this.productName,
    this.companyCode,
    this.company,
    this.quantity,
    this.mrp,
    this.ptr,
    this.storeProductPTR,
    this.netRate,
    this.productWiseAmount,
    this.free,
    this.hiddenPTR,
    this.gst,
    this.margin,
    this.schemeold,
    this.scheme,
    this.dateFormat,
    this.schemeFrom,
    this.schemeTo,
    this.schemeType,
    this.packing,
    this.boxPacking,
    this.casePacking,
    this.actualQuantityReceived,
    this.actualFreeReceived,
    this.minItemLimit,
    this.maxItemLimit,
    this.minAmountLimit,
    this.maxAmountLimit,
    this.allowMinQty,
    this.allowMaxQty,
    this.stepUpValue,
    this.allowMOQ,
    this.isDODProduct,
    this.retailerSchemePreference,
    this.retailerSchemePriority,
    this.salesmanSchemePreference,
    this.salesmanSchemePriority,
    this.displayHalfScheme,
    this.displayHalfSchemeOn,
    this.roundOffDisplayHalfScheme,
    this.rStockVisibility,
    this.halfSchemeValueToRetailer,
    this.halfSchemeValueToSalesman,
    this.isShowNonMappedOrderStock,
    this.isGroupWisePTRRetailer,
    this.isGroupWisePTR,
    this.orderDeliveryModeStatus,
    this.stock,
    this.loose,
    this.productLock,
    this.dProductLock,
    this.rShowPtr,
    this.rShowPtrForAllCompanies,
    this.isPartyLocked,
    this.doNotShowToRetailer,
    this.enabledNonMappedOrder,
    this.expiryDate,
  });

  factory InvoicedItems.fromJson(Map<String, dynamic> json) =>
      _$InvoicedItemsFromJson(json);

  Map<String, dynamic> toJson() => _$InvoicedItemsToJson(this);

  InvoicedItems copyWith({
    int? orderDetailId,
    int? orderId,
    String? orderNo,
    String? partyCode,
    String? orderDate,
    int? storeId,
    String? storeName,
    String? mobileNumber,
    double? orderAmount,
    int? createdBy,
    String? createdDate,
    int? isUploaded,
    String? uploadDate,
    int? isProcessed,
    String? processedDate,
    String? deliveryMode,
    String? remarks,
    String? orderSource,
    String? createdByName,
    String? productCode,
    String? displayProductCode,
    String? productFullName,
    String? productName,
    String? companyCode,
    String? company,
    int? quantity,
    String? mrp,
    String? ptr,
    String? storeProductPTR,
    String? netRate,
    String? productWiseAmount,
    int? free,
    String? hiddenPTR,
    String? gst,
    String? margin,
    String? schemeold,
    dynamic scheme,
    String? dateFormat,
    dynamic schemeFrom,
    dynamic schemeTo,
    dynamic schemeType,
    String? packing,
    String? boxPacking,
    String? casePacking,
    int? actualQuantityReceived,
    dynamic actualFreeReceived,
    int? minItemLimit,
    int? maxItemLimit,
    String? minAmountLimit,
    String? maxAmountLimit,
    int? allowMinQty,
    int? allowMaxQty,
    int? stepUpValue,
    String? allowMOQ,
    int? isDODProduct,
    int? retailerSchemePreference,
    int? retailerSchemePriority,
    int? salesmanSchemePreference,
    int? salesmanSchemePriority,
    String? displayHalfScheme,
    String? displayHalfSchemeOn,
    String? roundOffDisplayHalfScheme,
    int? rStockVisibility,
    int? halfSchemeValueToRetailer,
    int? halfSchemeValueToSalesman,
    int? isShowNonMappedOrderStock,
    int? isGroupWisePTRRetailer,
    int? isGroupWisePTR,
    int? orderDeliveryModeStatus,
    String? stock,
    String? loose,
    int? productLock,
    String? dProductLock,
    int? rShowPtr,
    int? rShowPtrForAllCompanies,
    String? isPartyLocked,
    int? doNotShowToRetailer,
    int? enabledNonMappedOrder,
    dynamic expiryDate,
  }) {
    return InvoicedItems(
      orderDetailId: orderDetailId ?? this.orderDetailId,
      orderId: orderId ?? this.orderId,
      orderNo: orderNo ?? this.orderNo,
      partyCode: partyCode ?? this.partyCode,
      orderDate: orderDate ?? this.orderDate,
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      orderAmount: orderAmount ?? this.orderAmount,
      createdBy: createdBy ?? this.createdBy,
      createdDate: createdDate ?? this.createdDate,
      isUploaded: isUploaded ?? this.isUploaded,
      uploadDate: uploadDate ?? this.uploadDate,
      isProcessed: isProcessed ?? this.isProcessed,
      processedDate: processedDate ?? this.processedDate,
      deliveryMode: deliveryMode ?? this.deliveryMode,
      remarks: remarks ?? this.remarks,
      orderSource: orderSource ?? this.orderSource,
      createdByName: createdByName ?? this.createdByName,
      productCode: productCode ?? this.productCode,
      displayProductCode: displayProductCode ?? this.displayProductCode,
      productFullName: productFullName ?? this.productFullName,
      productName: productName ?? this.productName,
      companyCode: companyCode ?? this.companyCode,
      company: company ?? this.company,
      quantity: quantity ?? this.quantity,
      mrp: mrp ?? this.mrp,
      ptr: ptr ?? this.ptr,
      storeProductPTR: storeProductPTR ?? this.storeProductPTR,
      netRate: netRate ?? this.netRate,
      productWiseAmount: productWiseAmount ?? this.productWiseAmount,
      free: free ?? this.free,
      hiddenPTR: hiddenPTR ?? this.hiddenPTR,
      gst: gst ?? this.gst,
      margin: margin ?? this.margin,
      schemeold: schemeold ?? this.schemeold,
      scheme: scheme ?? this.scheme,
      dateFormat: dateFormat ?? this.dateFormat,
      schemeFrom: schemeFrom ?? this.schemeFrom,
      schemeTo: schemeTo ?? this.schemeTo,
      schemeType: schemeType ?? this.schemeType,
      packing: packing ?? this.packing,
      boxPacking: boxPacking ?? this.boxPacking,
      casePacking: casePacking ?? this.casePacking,
      actualQuantityReceived:
          actualQuantityReceived ?? this.actualQuantityReceived,
      actualFreeReceived: actualFreeReceived ?? this.actualFreeReceived,
      minItemLimit: minItemLimit ?? this.minItemLimit,
      maxItemLimit: maxItemLimit ?? this.maxItemLimit,
      minAmountLimit: minAmountLimit ?? this.minAmountLimit,
      maxAmountLimit: maxAmountLimit ?? this.maxAmountLimit,
      allowMinQty: allowMinQty ?? this.allowMinQty,
      allowMaxQty: allowMaxQty ?? this.allowMaxQty,
      stepUpValue: stepUpValue ?? this.stepUpValue,
      allowMOQ: allowMOQ ?? this.allowMOQ,
      isDODProduct: isDODProduct ?? this.isDODProduct,
      retailerSchemePreference:
          retailerSchemePreference ?? this.retailerSchemePreference,
      retailerSchemePriority:
          retailerSchemePriority ?? this.retailerSchemePriority,
      salesmanSchemePreference:
          salesmanSchemePreference ?? this.salesmanSchemePreference,
      salesmanSchemePriority:
          salesmanSchemePriority ?? this.salesmanSchemePriority,
      displayHalfScheme: displayHalfScheme ?? this.displayHalfScheme,
      displayHalfSchemeOn: displayHalfSchemeOn ?? this.displayHalfSchemeOn,
      roundOffDisplayHalfScheme:
          roundOffDisplayHalfScheme ?? this.roundOffDisplayHalfScheme,
      rStockVisibility: rStockVisibility ?? this.rStockVisibility,
      halfSchemeValueToRetailer:
          halfSchemeValueToRetailer ?? this.halfSchemeValueToRetailer,
      halfSchemeValueToSalesman:
          halfSchemeValueToSalesman ?? this.halfSchemeValueToSalesman,
      isShowNonMappedOrderStock:
          isShowNonMappedOrderStock ?? this.isShowNonMappedOrderStock,
      isGroupWisePTRRetailer:
          isGroupWisePTRRetailer ?? this.isGroupWisePTRRetailer,
      isGroupWisePTR: isGroupWisePTR ?? this.isGroupWisePTR,
      orderDeliveryModeStatus:
          orderDeliveryModeStatus ?? this.orderDeliveryModeStatus,
      stock: stock ?? this.stock,
      loose: loose ?? this.loose,
      productLock: productLock ?? this.productLock,
      dProductLock: dProductLock ?? this.dProductLock,
      rShowPtr: rShowPtr ?? this.rShowPtr,
      rShowPtrForAllCompanies:
          rShowPtrForAllCompanies ?? this.rShowPtrForAllCompanies,
      isPartyLocked: isPartyLocked ?? this.isPartyLocked,
      doNotShowToRetailer: doNotShowToRetailer ?? this.doNotShowToRetailer,
      enabledNonMappedOrder:
          enabledNonMappedOrder ?? this.enabledNonMappedOrder,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }
}

@JsonSerializable()
class BouncedItems {
  @JsonKey(name: 'OrderNo')
  String? orderNo;
  @JsonKey(name: 'storeid')
  int? storeid;
  @JsonKey(name: 'OrderId')
  int? orderId;
  @JsonKey(name: 'MasterProductId')
  int? masterProductId;
  @JsonKey(name: 'MasterProductName')
  String? masterProductName;
  @JsonKey(name: 'ProductCode')
  String? productCode;
  @JsonKey(name: 'DisplayProductCode')
  String? displayProductCode;
  @JsonKey(name: 'StoreProductName')
  String? storeProductName;
  @JsonKey(name: 'PartyName')
  String? partyName;
  @JsonKey(name: 'OrderedQuantity')
  int? orderedQuantity;
  @JsonKey(name: 'PTR')
  String? ptr;
  @JsonKey(name: 'Free')
  int? free;
  @JsonKey(name: 'Scheme')
  dynamic scheme;
  @JsonKey(name: 'ReceivedQuantity')
  int? receivedQuantity;
  @JsonKey(name: 'BouncedQuantity')
  int? bouncedQuantity;
  @JsonKey(name: 'OrderDate')
  String? orderDate;
  @JsonKey(name: 'StoreName')
  String? storeName;
  @JsonKey(name: 'ProcessedDate')
  String? processedDate;
  @JsonKey(name: 'UploadDate')
  dynamic uploadDate;
  @JsonKey(name: 'CreatedBy')
  int? createdBy;
  @JsonKey(name: 'CreatedByName')
  String? createdByName;
  @JsonKey(name: 'Packing')
  String? packing;
  @JsonKey(name: 'MRP')
  String? mrp;
  @JsonKey(name: 'MobileNumber')
  String? mobileNumber;
  @JsonKey(name: 'DeliveryOption')
  String? deliveryOption;
  @JsonKey(name: 'Remarks')
  String? remarks;
  @JsonKey(name: 'expirydate')
  dynamic expirydate;
  @JsonKey(name: 'DeliveryPriority')
  String? deliveryPriority;
  @JsonKey(name: 'Store_Cnt')
  int? storeCnt;
  @JsonKey(name: 'OrderAmount')
  int? orderAmount;
  @JsonKey(name: 'ProductWiseAmount')
  String? productWiseAmount;
  @JsonKey(name: "Company")
  String? companyName;

  BouncedItems({
    this.orderNo,
    this.storeid,
    this.orderId,
    this.masterProductId,
    this.masterProductName,
    this.productCode,
    this.displayProductCode,
    this.storeProductName,
    this.partyName,
    this.orderedQuantity,
    this.ptr,
    this.free,
    this.scheme,
    this.receivedQuantity,
    this.bouncedQuantity,
    this.orderDate,
    this.storeName,
    this.processedDate,
    this.uploadDate,
    this.createdBy,
    this.createdByName,
    this.packing,
    this.mrp,
    this.mobileNumber,
    this.deliveryOption,
    this.remarks,
    this.expirydate,
    this.deliveryPriority,
    this.storeCnt,
    this.orderAmount,
    this.productWiseAmount,
    this.companyName,
  });

  factory BouncedItems.fromJson(Map<String, dynamic> json) =>
      _$BouncedItemsFromJson(json);

  Map<String, dynamic> toJson() => _$BouncedItemsToJson(this);

  BouncedItems copyWith({
    String? orderNo,
    int? storeid,
    int? orderId,
    int? masterProductId,
    String? masterProductName,
    String? productCode,
    String? displayProductCode,
    String? storeProductName,
    String? partyName,
    int? orderedQuantity,
    String? ptr,
    int? free,
    dynamic scheme,
    int? receivedQuantity,
    int? bouncedQuantity,
    String? orderDate,
    String? storeName,
    String? processedDate,
    dynamic uploadDate,
    int? createdBy,
    String? createdByName,
    String? packing,
    String? mrp,
    String? mobileNumber,
    String? deliveryOption,
    String? remarks,
    dynamic expirydate,
    String? deliveryPriority,
    int? storeCnt,
    int? orderAmount,
    String? productWiseAmount,
    String? companyName,
  }) {
    return BouncedItems(
      orderNo: orderNo ?? this.orderNo,
      storeid: storeid ?? this.storeid,
      orderId: orderId ?? this.orderId,
      masterProductId: masterProductId ?? this.masterProductId,
      masterProductName: masterProductName ?? this.masterProductName,
      productCode: productCode ?? this.productCode,
      displayProductCode: displayProductCode ?? this.displayProductCode,
      storeProductName: storeProductName ?? this.storeProductName,
      partyName: partyName ?? this.partyName,
      orderedQuantity: orderedQuantity ?? this.orderedQuantity,
      ptr: ptr ?? this.ptr,
      free: free ?? this.free,
      scheme: scheme ?? this.scheme,
      receivedQuantity: receivedQuantity ?? this.receivedQuantity,
      bouncedQuantity: bouncedQuantity ?? this.bouncedQuantity,
      orderDate: orderDate ?? this.orderDate,
      storeName: storeName ?? this.storeName,
      processedDate: processedDate ?? this.processedDate,
      uploadDate: uploadDate ?? this.uploadDate,
      createdBy: createdBy ?? this.createdBy,
      createdByName: createdByName ?? this.createdByName,
      packing: packing ?? this.packing,
      mrp: mrp ?? this.mrp,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      deliveryOption: deliveryOption ?? this.deliveryOption,
      remarks: remarks ?? this.remarks,
      expirydate: expirydate ?? this.expirydate,
      deliveryPriority: deliveryPriority ?? this.deliveryPriority,
      storeCnt: storeCnt ?? this.storeCnt,
      orderAmount: orderAmount ?? this.orderAmount,
      productWiseAmount: productWiseAmount ?? this.productWiseAmount,
      companyName: companyName ?? this.companyName,
    );
  }
}
