import 'package:json_annotation/json_annotation.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/endpoints_constants/fulfilment_partner_options.dart';

part 'approve_reject_entity.g.dart';

@JsonSerializable()
class ApproveRejectEntity {
  @JsonKey(name: FulfilmentPartnerOptions.responseText)
  String? responseText;

  ApproveRejectEntity({
    this.responseText,
  });

  factory ApproveRejectEntity.fromJson(Map<String, dynamic> json) =>
      _$ApproveRejectEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ApproveRejectEntityToJson(this);

  ApproveRejectEntity copyWith({
    String? responseText,
  }) {
    return ApproveRejectEntity(
      responseText: responseText ?? this.responseText,
    );
  }
}
