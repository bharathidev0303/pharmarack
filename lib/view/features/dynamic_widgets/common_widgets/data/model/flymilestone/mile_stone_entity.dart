import 'package:json_annotation/json_annotation.dart';

part 'mile_stone_entity.g.dart';

@JsonSerializable()
class MileStoneEntity {
  @JsonKey(name: 'success')
  final bool? success;
  @JsonKey(name: 'milestone_offers')
  final List<MileStoneOffers>? milestoneOffers;

  MileStoneEntity({this.success, this.milestoneOffers});

  factory MileStoneEntity.fromJson(Map<String, dynamic> json) =>
      _$MileStoneEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MileStoneEntityToJson(this);

  MileStoneEntity copyWith(
      {bool? success, List<MileStoneOffers>? milestoneOffers}) {
    return MileStoneEntity(
      success: success ?? this.success,
      milestoneOffers: milestoneOffers ?? this.milestoneOffers,
    );
  }
}

@JsonSerializable()
class MileStoneOffers {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'total_milestones')
  int? totalMilestones;
  @JsonKey(name: 'milestones_completed')
  int? milestonesCompleted;
  @JsonKey(name: 'ends_on')
  DateTime? endsOn;
  @JsonKey(name: 'total_user_score')
  int? totalUserScore;
  @JsonKey(name: 'total_score')
  int? totalScore;
  @JsonKey(name: 'completion_score')
  int? completionScore;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'rules')
  String? rules;
  @JsonKey(name: 'label')
  String? label;
  @JsonKey(name: 'milestone_events')
  List<MilestoneEvents>? milestoneEvents;
  @JsonKey(name: 'show_history_icon')
  bool? showHistoryIcon;
  @JsonKey(name: 'milestones')
  List<MileStones>? milestones;
  @JsonKey(name: 'isTCVisible')
  bool? isTCVisible;

  MileStoneOffers({
    this.id,
    this.totalMilestones,
    this.milestonesCompleted,
    this.endsOn,
    this.totalUserScore,
    this.totalScore,
    this.completionScore,
    this.title,
    this.description,
    this.rules,
    this.label,
    this.milestoneEvents,
    this.showHistoryIcon,
    this.milestones,
    this.isTCVisible = false,
  });

  factory MileStoneOffers.fromJson(Map<String, dynamic> json) =>
      _$MileStoneOffersFromJson(json);

  Map<String, dynamic> toJson() => _$MileStoneOffersToJson(this);

  MileStoneOffers copyWith({
    int? id,
    int? totalMilestones,
    int? milestonesCompleted,
    DateTime? endsOn,
    int? totalUserScore,
    int? totalScore,
    int? completionScore,
    String? title,
    String? description,
    String? rules,
    String? label,
    List<MilestoneEvents>? milestoneEvents,
    bool? showHistoryIcon,
    List<MileStones>? milestones,
    bool? isTCVisible = false,
  }) {
    return MileStoneOffers(
      id: id ?? this.id,
      totalMilestones: totalMilestones ?? this.totalMilestones,
      milestonesCompleted: milestonesCompleted ?? this.milestonesCompleted,
      endsOn: endsOn ?? this.endsOn,
      totalUserScore: totalUserScore ?? this.totalUserScore,
      totalScore: totalScore ?? this.totalScore,
      completionScore: completionScore ?? this.completionScore,
      title: title ?? this.title,
      description: description ?? this.description,
      rules: rules ?? this.rules,
      label: label ?? this.label,
      milestoneEvents: milestoneEvents ?? this.milestoneEvents,
      showHistoryIcon: showHistoryIcon ?? this.showHistoryIcon,
      milestones: milestones ?? this.milestones,
      isTCVisible: isTCVisible ?? this.isTCVisible,
    );
  }
}

@JsonSerializable()
class MilestoneEvents {
  @JsonKey(name: 'key')
  String? key;
  @JsonKey(name: 'label')
  String? label;

  MilestoneEvents({this.key, this.label});

  factory MilestoneEvents.fromJson(Map<String, dynamic> json) =>
      _$MilestoneEventsFromJson(json);

  Map<String, dynamic> toJson() => _$MilestoneEventsToJson(this);

  MilestoneEvents copyWith({
    String? key,
    String? label,
  }) {
    return MilestoneEvents(
      key: key ?? this.key,
      label: label ?? this.label,
    );
  }
}

@JsonSerializable()
class MileStones {
  @JsonKey(name: 's_no')
  int? sNo;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'sub_title')
  String? subTitle;
  @JsonKey(name: 'score')
  int? score;
  @JsonKey(name: 'remaining_score')
  int? remainingScore;
  @JsonKey(name: 'completed')
  bool? completed;
  @JsonKey(name: 'details')
  MileStonesDetails? details;

  MileStones({
    this.sNo,
    this.imageUrl,
    this.title,
    this.subTitle,
    this.score,
    this.remainingScore,
    this.completed,
    this.details,
  });

  factory MileStones.fromJson(Map<String, dynamic> json) =>
      _$MileStonesFromJson(json);

  Map<String, dynamic> toJson() => _$MileStonesToJson(this);

  MileStones copyWith({
    int? sNo,
    String? imageUrl,
    String? title,
    String? subTitle,
    int? score,
    int? remainingScore,
    bool? completed,
    MileStonesDetails? details,
  }) {
    return MileStones(
      sNo: sNo ?? this.sNo,
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      score: score ?? this.score,
      remainingScore: remainingScore ?? this.remainingScore,
      completed: completed ?? this.completed,
      details: details ?? this.details,
    );
  }
}

@JsonSerializable()
class MileStonesDetails {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'image_url')
  String? imageUrl;
  @JsonKey(name: 'score')
  int? score;
  @JsonKey(name: 'description')
  String? description;

  MileStonesDetails({this.title, this.imageUrl, this.score, this.description});

  factory MileStonesDetails.fromJson(Map<String, dynamic> json) =>
      _$MileStonesDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MileStonesDetailsToJson(this);

  MileStonesDetails copyWith({
    String? title,
    String? imageUrl,
    int? score,
    String? description,
  }) {
    return MileStonesDetails(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      score: score ?? this.score,
      description: description ?? this.description,
    );
  }
}
