
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';

class ProductModel {
  String? statusCode;
  String? message;
  Data? data;

  ProductModel({this.statusCode, this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? headline;
  String? viewAllLink;
  List<SearchProductListModel>? product;

  Data({this.headline, this.viewAllLink, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    headline = json['headline'];
    viewAllLink = json['viewAllLink'];
    if (json['product'] != null) {
      product = <SearchProductListModel>[];
      json['product'].forEach((v) {
        product!.add(SearchProductListModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['headline'] = headline;
    data['viewAllLink'] = viewAllLink;
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
