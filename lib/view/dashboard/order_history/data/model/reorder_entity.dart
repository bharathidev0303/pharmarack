import 'package:json_annotation/json_annotation.dart';

part 'reorder_entity.g.dart';

@JsonSerializable()
class ReorderEntity {
  @JsonKey(name: 'StatusCode')
  String? statusCode;
  @JsonKey(name: 'Message')
  String? message;
  @JsonKey(name: 'HideProductMSG')
  dynamic hideProductMSG;
  @JsonKey(name: 'IList')
  dynamic iList;

  ReorderEntity({
    this.statusCode,
    this.message,
    this.hideProductMSG,
    this.iList,
  });

  factory ReorderEntity.fromJson(Map<String, dynamic> json) =>
      _$ReorderEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReorderEntityToJson(this);

  ReorderEntity copyWith({
    String? statusCode,
    String? message,
    dynamic hideProductMSG,
    dynamic iList,
  }) {
    return ReorderEntity(
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      hideProductMSG: hideProductMSG ?? this.hideProductMSG,
      iList: iList ?? this.iList,
    );
  }
}
