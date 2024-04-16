// To parse this JSON data, do
//
//     final allFilter = allFilterFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/dashboard/order_history/data/model/all_filter.dart';


class AllFilterModel with EquatableMixin {
  bool? success;
  int? statusCode;
  List<Datum>? data;
  String? message;

  AllFilterModel({
    this.success,
    this.statusCode,
    this.data,
    this.message,
  });
  AllFilterModel copyWith({
    bool? success,
    int? statusCode,
    dynamic data,
    String? message,
  }) {
    return AllFilterModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        success: success ?? this.success,
        data: data ?? this.data);
  }

  factory AllFilterModel.fromAllFilter(AllFilter entity) {
    return AllFilterModel(
        statusCode: entity.statusCode,
        message: entity.message,
        success: entity.success,
        data: entity.data);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [success, statusCode, data, message];
}
