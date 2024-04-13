import 'package:json_annotation/json_annotation.dart';

part 'distributors_entity.g.dart';

@JsonSerializable()
class DistributorsEntity {
  @JsonKey(name: 'success')
  final bool? success;
  @JsonKey(name: 'StatusCode')
  final int? statusCode;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'data')
  final List<DistributorsItem>? distributors;

  DistributorsEntity(
      {this.success, this.statusCode, this.message, this.distributors});

  factory DistributorsEntity.fromJson(Map<String, dynamic> json) =>
      _$DistributorsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DistributorsEntityToJson(this);

  DistributorsEntity copyWith(
      {bool? success,
      int? statusCode,
      String? message,
      List<DistributorsItem>? distributors}) {
    return DistributorsEntity(
      success: success ?? this.success,
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      distributors: distributors ?? this.distributors,
    );
  }
}

@JsonSerializable()
class DistributorsItem {
  @JsonKey(name: 'distributor_id')
  int? distributorId;
  @JsonKey(name: 'distributor_name')
  String? distributorName;
  @JsonKey(name: 'distributor_address1')
  String? distributorAddress1;
  @JsonKey(name: 'distributor_address2')
  String? distributorAddress2;
  @JsonKey(name: 'distributor_city')
  String? distributorCity;
  @JsonKey(name: 'distributor_state')
  String? distributorState;

  DistributorsItem({
    this.distributorId,
    this.distributorName,
    this.distributorAddress1,
    this.distributorAddress2,
    this.distributorCity,
    this.distributorState,
  });

  factory DistributorsItem.fromJson(Map<String, dynamic> json) =>
      _$DistributorsItemFromJson(json);

  Map<String, dynamic> toJson() => _$DistributorsItemToJson(this);

  DistributorsItem copyWith({
    int? distributorId,
    String? distributorName,
    String? distributorAddress1,
    String? distributorAddress2,
    String? distributorCity,
    String? distributorState,
  }) {
    return DistributorsItem(
      distributorId: distributorId ?? this.distributorId,
      distributorName: distributorName ?? this.distributorName,
      distributorAddress1: distributorAddress1 ?? this.distributorAddress1,
      distributorAddress2: distributorAddress2 ?? this.distributorAddress2,
      distributorCity: distributorCity ?? this.distributorCity,
      distributorState: distributorState ?? this.distributorState,
    );
  }
}
