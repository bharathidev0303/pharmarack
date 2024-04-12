import 'package:json_annotation/json_annotation.dart';

part 'get_refresh_token_response_entity.g.dart';

@JsonSerializable()
class GetRefreshTokenResponseEntity {
  @JsonKey(name: "token")
  String? token;

  GetRefreshTokenResponseEntity({this.token});

  factory GetRefreshTokenResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$GetRefreshTokenResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$GetRefreshTokenResponseEntityToJson(this);
}
