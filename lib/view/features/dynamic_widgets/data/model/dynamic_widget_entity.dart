import 'package:json_annotation/json_annotation.dart';

part 'dynamic_widget_entity.g.dart';

@JsonSerializable()
class DynamicWidgetEntity {
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'sequence')
  final List<String>? sequence;
  @JsonKey(name: 'components')
  final Map<String, dynamic>? components;

  DynamicWidgetEntity(
      {this.title, this.description, this.sequence, this.components});

  factory DynamicWidgetEntity.fromJson(Map<String, dynamic> json) =>
      _$DynamicWidgetEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DynamicWidgetEntityToJson(this);

  @override
  String toString() {
    return 'DynamicWidgetEntity{title: $title, description: $description, sequence: $sequence, components: $components}';
  }
}
