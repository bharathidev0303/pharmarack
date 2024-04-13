import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

class NonMappedDistributorListItem extends StatelessWidget {
  final Function? onClickAction;
  final String storeName;
  final String address;
  final bool isMappingRequestSent;

  const NonMappedDistributorListItem({
    super.key,
    required this.storeName,
    required this.address,
    required this.isMappingRequestSent,
    this.onClickAction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: const BorderSide(color: AppColors.cardBorderColor),
      ),
      child: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          storeName,
                          style: AppTextStyles.searchHintTextStyleW400(
                            color: AppColors.cardTitleColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Visibility(
                      visible: address.isNotEmpty,
                      child: Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppAssets.png.mapPin.image(
                              width: 10,
                              height: 10,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                address,
                                style: AppTextStyles.searchHintTextStyleW400(
                                  color: AppColors.searchHintColor,
                                ).copyWith(fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: () => onClickAction?.call(),
                child: Container(
                  alignment: Alignment.center,
                  width: (isMappingRequestSent ? 64 : 40),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.cardBorderColor,
                  ),
                  child: Visibility(
                    visible: isMappingRequestSent,
                    replacement: AppAssets.svg.icPlus.svg(
                      width: 16,
                      height: 16,
                    ),
                    child: Text(
                      context.localizedString.remind,
                      style: AppTextStyles.style10W500Black().copyWith(
                        fontSize: 11,
                        color: AppColors.cardTitleNumberColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
