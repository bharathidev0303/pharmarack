import 'package:json_annotation/json_annotation.dart';

part 'display_order.g.dart';

@JsonSerializable()
class DisplayOrdersResponse {
  @JsonKey(name: 'success')
  bool? isSuccess;

  @JsonKey(name: 'data')
  List<DisplayOrderEntity>? orders;

  DisplayOrdersResponse(this.isSuccess, this.orders);

  factory DisplayOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$DisplayOrdersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DisplayOrdersResponseToJson(this);
}

@JsonSerializable()
class DisplayOrderEntity {
  @JsonKey(name: 'OrderId')
  double? orderId;
  @JsonKey(name: 'storeId')
  int? storeId;
  @JsonKey(name: 'StoreName')
  String? storeName;
  @JsonKey(name: 'PartyCode')
  String? partyCode;
  @JsonKey(name: 'PartyName')
  String? partyName;
  @JsonKey(name: 'OrderNo')
  String? orderNo;
  @JsonKey(name: 'OrderDate')
  String? orderDate;
  @JsonKey(name: 'OrderAmount')
  String? orderAmount;
  @JsonKey(name: 'DeliveryOption')
  String? deliveryOption;
  @JsonKey(name: 'CreatedByName')
  String? createdByName;
  @JsonKey(name: 'Remarks')
  String? remarks;
  @JsonKey(name: 'IsProcessed')
  String? isProcessed;
  @JsonKey(name: 'ProcessedDate')
  String? processedDate;
  @JsonKey(name: 'DeliveryPersonName')
  String? deliveryPersonName;
  @JsonKey(name: 'DeliveryPersonCode')
  String? deliveryPersonCode;
  @JsonKey(name: 'MobileNumber')
  String? mobileNumber;
  @JsonKey(name: 'DisplayPartyCode')
  String? displayPartyCode;
  @JsonKey(name: 'PartyAddress')
  String? partyAddress;
  @JsonKey(name: 'Priority')
  String? priority;
  @JsonKey(name: 'IsUploaded')
  String? isUploaded;
  @JsonKey(name: 'IsPlaced')
  String? isPlaced;
  @JsonKey(name: 'UploadDate')
  String? uploadDate;
  @JsonKey(name: 'CreatedBy')
  int? createdBy;
  @JsonKey(name: 'CreatedDate')
  String? createdDate;
  @JsonKey(name: 'OrderSource')
  String? orderSource;
  @JsonKey(name: 'productList')
  List<String>? productList;
  @JsonKey(name: 'OrderedBy')
  String? orderedBy;
  @JsonKey(name: 'OrderFeatureType')
  int? orderFeatureType;
  @JsonKey(name: 'ApiId')
  String? apiId;
  @JsonKey(name: 'DistributorId')
  int? distributorId;
  @JsonKey(name: 'DistributorName')
  String? distributorName;
  @JsonKey(name: 'PseudoOrderId')
  int? pseudoOrderId;
  @JsonKey(name: 'Areas')
  String? areas;
  @JsonKey(name: 'Pincode')
  String? pincode;
  @JsonKey(name: 'PaymentType')
  String? paymentType;
  @JsonKey(name: 'UPIPaymentTransactionId')
  String? uPIPaymentTransactionId;
  @JsonKey(name: 'IsMapped')
  int? isMapped;
  @JsonKey(name: 'RetailerId')
  int? retailerId;
  @JsonKey(name: 'RejectOrderCount')
  int? rejectOrderCount;
  @JsonKey(name: 'displayRetailers')
  String? displayRetailers;
  @JsonKey(name: 'RejectOrderStatus')
  String? rejectOrderStatus;
  @JsonKey(name: 'Actions')
  int? actions;
  @JsonKey(name: 'RejectOrderDate')
  String? rejectOrderDate;
  @JsonKey(name: 'IsMapStore')
  int? isMapStore;
  @JsonKey(name: 'Scheme')
  String? scheme;
  @JsonKey(name: 'SchemeType')
  String? schemeType;
  @JsonKey(name: 'PTR')
  String? ptr;
  @JsonKey(name: 'Total')
  String? total;
  @JsonKey(name: 'orderedQuantity')
  int? orderedQuantity;
  @JsonKey(name: 'deliveredQuantity')
  int? deliveredQuantity;
  @JsonKey(name: 'rating')
  String? rating;
  @JsonKey(name: 'orderStatus')
  String? orderStatus;
  @JsonKey(name: 'invoiceurl')
  String? invoiceurl;

  @JsonKey(name: "EncryptedOrderId")
  String? encryptedOrderId;

  DisplayOrderEntity(
    this.orderId,
    this.storeId,
    this.storeName,
    this.partyCode,
    this.partyName,
    this.orderNo,
    this.orderDate,
    this.orderAmount,
    this.deliveryOption,
    this.createdByName,
    this.remarks,
    this.isProcessed,
    this.processedDate,
    this.deliveryPersonName,
    this.deliveryPersonCode,
    this.mobileNumber,
    this.displayPartyCode,
    this.partyAddress,
    this.priority,
    this.isUploaded,
    this.isPlaced,
    this.uploadDate,
    this.createdBy,
    this.createdDate,
    this.orderSource,
    this.productList,
    this.orderedBy,
    this.orderFeatureType,
    this.apiId,
    this.distributorId,
    this.distributorName,
    this.pseudoOrderId,
    this.areas,
    this.pincode,
    this.paymentType,
    this.uPIPaymentTransactionId,
    this.isMapped,
    this.retailerId,
    this.rejectOrderCount,
    this.displayRetailers,
    this.rejectOrderStatus,
    this.actions,
    this.rejectOrderDate,
    this.isMapStore,
    this.scheme,
    this.schemeType,
    this.ptr,
    this.total,
    this.orderedQuantity,
    this.deliveredQuantity,
    this.rating,
    this.orderStatus,
    this.invoiceurl,
    this.encryptedOrderId,
  );

  factory DisplayOrderEntity.fromJson(Map<String, dynamic> json) =>
      _$DisplayOrderEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DisplayOrderEntityToJson(this);
}
