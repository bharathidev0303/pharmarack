import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BusinessType {
  @JsonKey(name: 'BusinessTypeId')
  int? businessTypeId;
  @JsonKey(name: 'BusinessTypeName')
  String? businessTypeName;
  @JsonKey(name: 'IsActive')
  int? isActive;
  @JsonKey(name: 'CreatedDate')
  String? createdDate;

  BusinessType(
      {this.businessTypeId,
      this.businessTypeName,
      this.isActive,
      this.createdDate});

  BusinessType.fromJson(Map<String, dynamic> json) {
    businessTypeId = json['BusinessTypeId'];
    businessTypeName = json['BusinessTypeName'];
    isActive = json['IsActive'];
    createdDate = json['CreatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BusinessTypeId'] = businessTypeId;
    data['BusinessTypeName'] = businessTypeName;
    data['IsActive'] = isActive;
    data['CreatedDate'] = createdDate;
    return data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessType &&
          runtimeType == other.runtimeType &&
          businessTypeId == other.businessTypeId &&
          businessTypeName == other.businessTypeName &&
          isActive == other.isActive &&
          createdDate == other.createdDate;

  @override
  int get hashCode =>
      businessTypeId.hashCode ^
      businessTypeName.hashCode ^
      isActive.hashCode ^
      createdDate.hashCode;
}
