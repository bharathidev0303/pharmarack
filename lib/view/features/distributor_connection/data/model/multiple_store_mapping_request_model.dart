import 'dart:convert';

import 'package:pharmarack/view/features/distributor_connection/data/model/store_status_mapping_request_model.dart';

class MultipleStoreMappingRequestModel {
  int rid;
  List<StoreStatusMappingRequestModel> maprequests;

  MultipleStoreMappingRequestModel({
    required this.rid,
    required this.maprequests,
  });

  factory MultipleStoreMappingRequestModel.fromRawJson(String str) =>
      MultipleStoreMappingRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MultipleStoreMappingRequestModel.fromJson(
          Map<String, dynamic> json) =>
      MultipleStoreMappingRequestModel(
        rid: json["rid"],
        maprequests: List<StoreStatusMappingRequestModel>.from(
            json["maprequests"]
                .map((x) => StoreStatusMappingRequestModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rid": rid,
        "maprequests": List<dynamic>.from(maprequests.map((x) => x.toJson())),
      };
}
