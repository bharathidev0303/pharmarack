// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mile_stone_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MileStoneEntity _$MileStoneEntityFromJson(Map<String, dynamic> json) =>
    MileStoneEntity(
      success: json['success'] as bool?,
      milestoneOffers: (json['milestone_offers'] as List<dynamic>?)
          ?.map((e) => MileStoneOffers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MileStoneEntityToJson(MileStoneEntity instance) =>
    <String, dynamic>{
      'success': instance.success,
      'milestone_offers': instance.milestoneOffers,
    };

MileStoneOffers _$MileStoneOffersFromJson(Map<String, dynamic> json) =>
    MileStoneOffers(
      id: json['id'] as int?,
      totalMilestones: json['total_milestones'] as int?,
      milestonesCompleted: json['milestones_completed'] as int?,
      endsOn: json['ends_on'] == null
          ? null
          : DateTime.parse(json['ends_on'] as String),
      totalUserScore: json['total_user_score'] as int?,
      totalScore: json['total_score'] as int?,
      completionScore: json['completion_score'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      rules: json['rules'] as String?,
      label: json['label'] as String?,
      milestoneEvents: (json['milestone_events'] as List<dynamic>?)
          ?.map((e) => MilestoneEvents.fromJson(e as Map<String, dynamic>))
          .toList(),
      showHistoryIcon: json['show_history_icon'] as bool?,
      milestones: (json['milestones'] as List<dynamic>?)
          ?.map((e) => MileStones.fromJson(e as Map<String, dynamic>))
          .toList(),
      isTCVisible: json['isTCVisible'] as bool? ?? false,
    );

Map<String, dynamic> _$MileStoneOffersToJson(MileStoneOffers instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total_milestones': instance.totalMilestones,
      'milestones_completed': instance.milestonesCompleted,
      'ends_on': instance.endsOn?.toIso8601String(),
      'total_user_score': instance.totalUserScore,
      'total_score': instance.totalScore,
      'completion_score': instance.completionScore,
      'title': instance.title,
      'description': instance.description,
      'rules': instance.rules,
      'label': instance.label,
      'milestone_events': instance.milestoneEvents,
      'show_history_icon': instance.showHistoryIcon,
      'milestones': instance.milestones,
      'isTCVisible': instance.isTCVisible,
    };

MilestoneEvents _$MilestoneEventsFromJson(Map<String, dynamic> json) =>
    MilestoneEvents(
      key: json['key'] as String?,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$MilestoneEventsToJson(MilestoneEvents instance) =>
    <String, dynamic>{
      'key': instance.key,
      'label': instance.label,
    };

MileStones _$MileStonesFromJson(Map<String, dynamic> json) => MileStones(
      sNo: json['s_no'] as int?,
      imageUrl: json['image_url'] as String?,
      title: json['title'] as String?,
      subTitle: json['sub_title'] as String?,
      score: json['score'] as int?,
      remainingScore: json['remaining_score'] as int?,
      completed: json['completed'] as bool?,
      details: json['details'] == null
          ? null
          : MileStonesDetails.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MileStonesToJson(MileStones instance) =>
    <String, dynamic>{
      's_no': instance.sNo,
      'image_url': instance.imageUrl,
      'title': instance.title,
      'sub_title': instance.subTitle,
      'score': instance.score,
      'remaining_score': instance.remainingScore,
      'completed': instance.completed,
      'details': instance.details,
    };

MileStonesDetails _$MileStonesDetailsFromJson(Map<String, dynamic> json) =>
    MileStonesDetails(
      title: json['title'] as String?,
      imageUrl: json['image_url'] as String?,
      score: json['score'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$MileStonesDetailsToJson(MileStonesDetails instance) =>
    <String, dynamic>{
      'title': instance.title,
      'image_url': instance.imageUrl,
      'score': instance.score,
      'description': instance.description,
    };
