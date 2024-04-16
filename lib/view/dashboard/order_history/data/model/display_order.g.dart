// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisplayOrdersResponse _$DisplayOrdersResponseFromJson(
        Map<String, dynamic> json) =>
    DisplayOrdersResponse(
      json['success'] as bool?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => DisplayOrderEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DisplayOrdersResponseToJson(
        DisplayOrdersResponse instance) =>
    <String, dynamic>{
      'success': instance.isSuccess,
      'data': instance.orders,
    };

DisplayOrderEntity _$DisplayOrderEntityFromJson(Map<String, dynamic> json) =>
    DisplayOrderEntity(
      (json['OrderId'] as num?)?.toDouble(),
      json['storeId'] as int?,
      json['StoreName'] as String?,
      json['PartyCode'] as String?,
      json['PartyName'] as String?,
      json['OrderNo'] as String?,
      json['OrderDate'] as String?,
      json['OrderAmount'] as String?,
      json['DeliveryOption'] as String?,
      json['CreatedByName'] as String?,
      json['Remarks'] as String?,
      json['IsProcessed'] as String?,
      json['ProcessedDate'] as String?,
      json['DeliveryPersonName'] as String?,
      json['DeliveryPersonCode'] as String?,
      json['MobileNumber'] as String?,
      json['DisplayPartyCode'] as String?,
      json['PartyAddress'] as String?,
      json['Priority'] as String?,
      json['IsUploaded'] as String?,
      json['IsPlaced'] as String?,
      json['UploadDate'] as String?,
      json['CreatedBy'] as int?,
      json['CreatedDate'] as String?,
      json['OrderSource'] as String?,
      (json['productList'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['OrderedBy'] as String?,
      json['OrderFeatureType'] as int?,
      json['ApiId'] as String?,
      json['DistributorId'] as int?,
      json['DistributorName'] as String?,
      json['PseudoOrderId'] as int?,
      json['Areas'] as String?,
      json['Pincode'] as String?,
      json['PaymentType'] as String?,
      json['UPIPaymentTransactionId'] as String?,
      json['IsMapped'] as int?,
      json['RetailerId'] as int?,
      json['RejectOrderCount'] as int?,
      json['displayRetailers'] as String?,
      json['RejectOrderStatus'] as String?,
      json['Actions'] as int?,
      json['RejectOrderDate'] as String?,
      json['IsMapStore'] as int?,
      json['Scheme'] as String?,
      json['SchemeType'] as String?,
      json['PTR'] as String?,
      json['Total'] as String?,
      json['orderedQuantity'] as int?,
      json['deliveredQuantity'] as int?,
      json['rating'] as String?,
      json['orderStatus'] as String?,
      json['invoiceurl'] as String?,
      json['EncryptedOrderId'] as String?,
    );

Map<String, dynamic> _$DisplayOrderEntityToJson(DisplayOrderEntity instance) =>
    <String, dynamic>{
      'OrderId': instance.orderId,
      'storeId': instance.storeId,
      'StoreName': instance.storeName,
      'PartyCode': instance.partyCode,
      'PartyName': instance.partyName,
      'OrderNo': instance.orderNo,
      'OrderDate': instance.orderDate,
      'OrderAmount': instance.orderAmount,
      'DeliveryOption': instance.deliveryOption,
      'CreatedByName': instance.createdByName,
      'Remarks': instance.remarks,
      'IsProcessed': instance.isProcessed,
      'ProcessedDate': instance.processedDate,
      'DeliveryPersonName': instance.deliveryPersonName,
      'DeliveryPersonCode': instance.deliveryPersonCode,
      'MobileNumber': instance.mobileNumber,
      'DisplayPartyCode': instance.displayPartyCode,
      'PartyAddress': instance.partyAddress,
      'Priority': instance.priority,
      'IsUploaded': instance.isUploaded,
      'IsPlaced': instance.isPlaced,
      'UploadDate': instance.uploadDate,
      'CreatedBy': instance.createdBy,
      'CreatedDate': instance.createdDate,
      'OrderSource': instance.orderSource,
      'productList': instance.productList,
      'OrderedBy': instance.orderedBy,
      'OrderFeatureType': instance.orderFeatureType,
      'ApiId': instance.apiId,
      'DistributorId': instance.distributorId,
      'DistributorName': instance.distributorName,
      'PseudoOrderId': instance.pseudoOrderId,
      'Areas': instance.areas,
      'Pincode': instance.pincode,
      'PaymentType': instance.paymentType,
      'UPIPaymentTransactionId': instance.uPIPaymentTransactionId,
      'IsMapped': instance.isMapped,
      'RetailerId': instance.retailerId,
      'RejectOrderCount': instance.rejectOrderCount,
      'displayRetailers': instance.displayRetailers,
      'RejectOrderStatus': instance.rejectOrderStatus,
      'Actions': instance.actions,
      'RejectOrderDate': instance.rejectOrderDate,
      'IsMapStore': instance.isMapStore,
      'Scheme': instance.scheme,
      'SchemeType': instance.schemeType,
      'PTR': instance.ptr,
      'Total': instance.total,
      'orderedQuantity': instance.orderedQuantity,
      'deliveredQuantity': instance.deliveredQuantity,
      'rating': instance.rating,
      'orderStatus': instance.orderStatus,
      'invoiceurl': instance.invoiceurl,
      'EncryptedOrderId': instance.encryptedOrderId,
    };
