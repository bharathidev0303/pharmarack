import 'package:json_annotation/json_annotation.dart';

part 'add_product_to_cart_entity.g.dart';

@JsonSerializable()
class AddProductToCartEntity {
  @JsonKey(name: 'StatusCode')
  final int? statusCode;

  @JsonKey(name: 'Message')
  final String? message;

  AddProductToCartEntity({
    this.statusCode,
    this.message,
  });

  factory AddProductToCartEntity.fromJson(Map<String, dynamic> json) =>
      _$AddProductToCartEntityFromJson(json);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'StatusCode': statusCode,
        'Message': message,
      };
}
