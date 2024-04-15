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

@JsonSerializable()
class ElasticSearchCompanyApiRequest {
  @JsonKey(name: "SearchKeyword")
  String searchKeyword;
  @JsonKey(name: "Company")
  List<String> company;
  @JsonKey(name: "StoreName")
  List<String> storeName;
  @JsonKey(name: "Count")
  int count;
  @JsonKey(name: "SkipCount")
  int skipCount;

  ElasticSearchCompanyApiRequest({
    required this.searchKeyword,
    required this.company,
    required this.storeName,
    required this.count,
    required this.skipCount,
  });

  factory ElasticSearchCompanyApiRequest.fromJson(Map<String, dynamic> json) =>
      _$ElasticSearchCompanyApiRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ElasticSearchCompanyApiRequestToJson(this);
}

@JsonSerializable()
class ElasticSearchTheropyApiRequest {
  @JsonKey(name: "TherapyName")
  String therapyName;
  @JsonKey(name: "Company")
  List<String> company;
  @JsonKey(name: "StoreName")
  List<String> storeName;
  @JsonKey(name: "Count")
  int count;
  @JsonKey(name: "SkipCount")
  int skipCount;

  ElasticSearchTheropyApiRequest({
    required this.therapyName,
    required this.company,
    required this.storeName,
    required this.count,
    required this.skipCount,
  });

  factory ElasticSearchTheropyApiRequest.fromJson(Map<String, dynamic> json) =>
      _$ElasticSearchTheropyApiRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ElasticSearchTheropyApiRequestToJson(this);
}
