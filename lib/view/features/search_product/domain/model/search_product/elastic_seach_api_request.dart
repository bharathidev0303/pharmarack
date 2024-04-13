import 'package:json_annotation/json_annotation.dart';
part 'elastic_seach_api_request.g.dart';

@JsonSerializable()
class ElasticSearchApiRequest {
  @JsonKey(name: "SearchKeyword")
  String searchKeyword;
  @JsonKey(name: "CartSource")
  String cartSource;
  @JsonKey(name: "StoreName")
  List<String> storeName;
  @JsonKey(name: "Count")
  int count;
  @JsonKey(name: "SkipCount")
  int skipCount;

  ElasticSearchApiRequest({
    required this.searchKeyword,
    required this.cartSource,
    required this.storeName,
    required this.count,
    required this.skipCount,
  });

  factory ElasticSearchApiRequest.fromJson(Map<String, dynamic> json) =>
      _$ElasticSearchApiRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ElasticSearchApiRequestToJson(this);
}
