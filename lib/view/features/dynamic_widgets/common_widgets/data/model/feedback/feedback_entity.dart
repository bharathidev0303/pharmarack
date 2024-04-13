import 'package:json_annotation/json_annotation.dart';

part 'feedback_entity.g.dart';

@JsonSerializable()
class FeedbackEntity {
  @JsonKey(name: 'success')
  final bool? success;
  @JsonKey(name: 'StatusCode')
  final int? statusCode;
  @JsonKey(name: 'data')
  final List<FeedbackItem>? feedback;

  FeedbackEntity({this.success, this.statusCode, this.feedback});

  factory FeedbackEntity.fromJson(Map<String, dynamic> json) =>
      _$FeedbackEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackEntityToJson(this);

  FeedbackEntity copyWith(
      {bool? success, int? statusCode, List<FeedbackItem>? feedback}) {
    return FeedbackEntity(
      success: success ?? this.success,
      statusCode: statusCode ?? this.statusCode,
      feedback: feedback ?? this.feedback,
    );
  }
}

@JsonSerializable()
class FeedbackItem {
  @JsonKey(name: 'FeedbackId')
  int? feedbackId;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'rating')
  String? rating;

  FeedbackItem({this.feedbackId, this.title, this.rating});

  factory FeedbackItem.fromJson(Map<String, dynamic> json) =>
      _$FeedbackItemFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackItemToJson(this);

  FeedbackItem copyWith({
    int? feedbackId,
    String? title,
    String? rating,
  }) {
    return FeedbackItem(
      feedbackId: feedbackId ?? this.feedbackId,
      title: title ?? this.title,
      rating: rating ?? this.rating,
    );
  }
}
