
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/title_and_value_row_item.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.imageUrl,
    required this.isRoundCorner,
    this.title,
    this.subTitle1Name,
    this.subTitle1Value,
    this.subTitle2Name,
    this.subTitle2Value,
  });
  final String? imageUrl;
  final bool isRoundCorner;
  final String? title;
  final String? subTitle1Name;
  final String? subTitle1Value;
  final String? subTitle2Name;
  final String? subTitle2Value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        surfaceTintColor: AppColors.white,
        child: ClipRRect(
          borderRadius: isRoundCorner
              ? const BorderRadius.all(Radius.circular(8))
              : const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
          child: Column(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: imageUrl ?? '',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.fill),
                    ),
                  ),
                  placeholder: (context, url) => const SizedBox(
                    width: 42,
                    height: 42,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              if (title != null ||
                  subTitle1Value != null ||
                  subTitle2Value != null)
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title != null
                          ? Text(
                              title ?? '',
                              style: kIsWeb
                                  ? AppTextStyles.dialogTitleTextStyle20W700
                                  : AppTextStyles.style14NormalBlack(
                                      color: context.colors.textPrimary,
                                    ),
                            )
                          : Container(),
                      const SizedBox(height: 10),
                      if (subTitle1Value != null || subTitle2Value != null)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            subTitle1Value != null
                                ? TitleAndAmountRowItem(
                                    value: subTitle1Value ?? '',
                                    title: subTitle1Name ?? '',
                                    textType: ValueTextType.currency)
                                : Container(),
                            const SizedBox(width: 12.0),
                            subTitle2Value != null
                                ? TitleAndAmountRowItem(
                                    value: subTitle2Value ?? '',
                                    title: subTitle2Name ?? '',
                                    textType: ValueTextType.currency)
                                : Container(),
                          ],
                        ),
                      const SizedBox(height: 10),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
