import 'package:json_annotation/json_annotation.dart';

part 'feedback_api_request_entity.g.dart';

@JsonSerializable()
class FeedbackApiRequestEntity {
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "feedbackto")
  final String? feedbackTo;
  @JsonKey(name: "remarks")
  final String? remarks;
  @JsonKey(name: "rating")
  final String? rating;
  @JsonKey(name: "storeid")
  final String? storeId;
  @JsonKey(name: "appversion")
  final String? appVersion;
  @JsonKey(name: "platform")
  final String? platform;

  const FeedbackApiRequestEntity({
    this.type,
    this.feedbackTo,
    this.remarks,
    this.rating,
    this.platform,
    this.appVersion,
    this.storeId,
  });

  factory FeedbackApiRequestEntity.fromJson(Map<String, dynamic> json) {
    return _$FeedbackApiRequestEntityFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FeedbackApiRequestEntityToJson(this);
  }
}
