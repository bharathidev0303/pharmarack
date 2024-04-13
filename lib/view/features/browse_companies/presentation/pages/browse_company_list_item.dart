import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/features/browse_companies/domain/model/browse_companies/companies_model.dart';
import '../../../dynamic_widgets/presentation/pages/company_page/company_screen_page.dart';

class BrowseCompanyListItem extends StatelessWidget {
  final CompaniesModel companiesModel;

  const BrowseCompanyListItem({
    super.key,
    required this.companiesModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: context.colors.inputField!),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: companiesModel.companyLogo ?? "",
            fit: BoxFit.cover,
            width: 40,
            height: 40,
            errorWidget: (context, url, error) => Image.asset(
              "assets/Empty_company_logo.png",
              fit: BoxFit.cover,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  companiesModel.companyName ?? "",
                  style: context.textStyles.header6Regular?.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            style: context.textStyles.header10Medium?.copyWith(
                              color: context.colors.textSecondary,
                            ),
                            text: "${context.localizedString.sku}:",
                          ),
                          TextSpan(
                            style: context.textStyles.header10Medium?.copyWith(
                              color: context.colors.textPrimary,
                            ),
                            text: companiesModel.skuCount?.toString() ?? "0",
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            style: context.textStyles.header10Medium?.copyWith(
                              color: context.colors.textSecondary,
                            ),
                            text: "${context.localizedString.brands}:",
                          ),
                          TextSpan(
                            style: context.textStyles.header10Medium?.copyWith(
                              color: context.colors.textPrimary,
                            ),
                            text: companiesModel.brandCount?.toString() ?? "0",
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () => {
              if (getIt.isRegistered<CompaniesModel>())
                {
                  getIt.unregister<CompaniesModel>(),
                  getIt.registerLazySingleton<CompaniesModel>(
                      () => companiesModel),
                }
              else
                {
                  getIt.registerLazySingleton<CompaniesModel>(
                      () => companiesModel),
                },
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CompanyScreenPage()),
              )
            },
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: context.colors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: AppAssets.svg.arrowRight.svg(
                width: 16,
                height: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
