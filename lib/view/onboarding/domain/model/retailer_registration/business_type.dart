
import 'package:pharmarack/view/onboarding/data/entities/retailer_registration/business_type.dart';

class BusinessTypeModel {
  int? businessTypeId;
  String? businessTypeName;
  int? isActive;
  String? createdDate;

  BusinessTypeModel(
      {this.businessTypeId,
      this.businessTypeName,
      this.isActive,
      this.createdDate});

  BusinessTypeModel.from(BusinessType businessType) {
    businessTypeId = businessType.businessTypeId;
    businessTypeName = businessType.businessTypeName;
    isActive = businessType.isActive;
    createdDate = businessType.createdDate;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessTypeModel &&
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
