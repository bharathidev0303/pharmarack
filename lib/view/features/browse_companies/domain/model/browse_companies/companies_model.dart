import 'package:pharmarack/view/features/browse_companies/data/model/company_entity.dart';

class CompaniesModel {
  int? companyId;
  String? companyName;
  String? companyLogo;
  int? skuCount;
  int? brandCount;
  String? link;
  List<String>? therapy;

  CompaniesModel({
    this.companyId,
    this.companyName,
    this.companyLogo,
    this.skuCount,
    this.brandCount,
    this.link,
    this.therapy,
  });

  factory CompaniesModel.fromCompanies(Companies company) {
    return CompaniesModel(
      companyId: company.companyId,
      companyName: company.companyName,
      companyLogo: company.companyLogo,
      skuCount: company.skuCount,
      brandCount: company.brandCount,
      link: company.link,
      therapy: company.therapy,
    );
  }
}
