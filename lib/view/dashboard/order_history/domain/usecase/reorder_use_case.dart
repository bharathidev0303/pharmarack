
import 'package:fpdart/fpdart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/reorder_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/repository/order_history_repository.dart';


part 'reorder_use_case.g.dart'; // For json_serializable

class ReorderUseCase {
  final OrderHistoryRepository _repository;

  ReorderUseCase(this._repository);

  Future<Either<BaseError, ReorderModel>> execute(
      {required List<ReorderParam> params}) {
    return _repository.reorder(params);
  }
}

@JsonSerializable()
class ReorderParam {
  @JsonKey(name: "OrderId")
  final String orderId;
  @JsonKey(name: "OrderGuId")
  final String orderGuId;
  @JsonKey(name: "IpAddress")
  final String ipAddress;
  @JsonKey(name: "Version")
  final String version;
  @JsonKey(name: "Latitude")
  final String latitude;
  @JsonKey(name: "Longitude")
  final String longitude;
  @JsonKey(name: "DeviceName")
  final String deviceName;
  @JsonKey(name: "DeviceId")
  final String deviceId;
  @JsonKey(name: "OS")
  final String os;
  @JsonKey(name: "AndroidVersion")
  final String androidVersion;
  @JsonKey(name: "IsStoreMapped")
  final int isStoreMapped;

  ReorderParam({
    required this.orderId,
    required this.orderGuId,
    required this.ipAddress,
    required this.version,
    required this.latitude,
    required this.longitude,
    required this.deviceName,
    required this.deviceId,
    required this.os,
    required this.androidVersion,
    required this.isStoreMapped,
  });

  Map<String, dynamic> toJson() => _$ReorderParamToJson(this);
}
