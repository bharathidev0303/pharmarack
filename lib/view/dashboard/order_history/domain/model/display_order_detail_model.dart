import 'package:pharmarack/view/dashboard/order_history/data/model/display_order_detail.dart';

class DisplayOrderDetailModel {
  String invoiceTotal;
  String invoiceTax;
  String invoiceDiscount;
  String bouncedTaxTotal;
  String bouncedTotal;
  String bouncedDiscountTotal;
  List<InvoicedItems> invoicedItems;
  List<BouncedItems> bouncedItems;

  DisplayOrderDetailModel(
    this.invoiceTotal,
    this.invoiceTax,
    this.invoiceDiscount,
    this.bouncedTaxTotal,
    this.bouncedTotal,
    this.bouncedDiscountTotal,
    this.invoicedItems,
    this.bouncedItems,
  );

  factory DisplayOrderDetailModel.fromDisplayOrderDetail(
      DisplayOrderDetail displayOrderDetail) {
    return DisplayOrderDetailModel(
      displayOrderDetail.data?.invoiceTotal ?? '',
      displayOrderDetail.data?.invoiceTax ?? '',
      displayOrderDetail.data?.invoiceDiscount ?? '',
      displayOrderDetail.data?.bouncedTaxTotal ?? '',
      displayOrderDetail.data?.bouncedTotal ?? '',
      displayOrderDetail.data?.bouncedDiscountTotal ?? '',
      displayOrderDetail.data?.invoicedItems ?? [],
      displayOrderDetail.data?.bouncedItems ?? [],
    );
  }
}
