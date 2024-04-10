
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';

class FailureCustomDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function? onCloseClick;
  final double? dialogWidth;

  const FailureCustomDialog({
    super.key,
    required this.title,
    required this.subTitle,
    this.onCloseClick,
    this.dialogWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dialogWidth ?? MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 45),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  onCloseClick?.call();
                },
                child: AppAssets.png.close.image(
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 14,
                ),
                AppAssets.png.close.image(
                  width: 65,
                  height: 64,
                  color: Colors.red,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.listItemStyle16W700Black(
                    color: AppColors.cardTitleColor,
                  ).copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                Visibility(
                  visible: subTitle.isNotEmpty,
                  child: Text(
                    subTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: AppTextStyles.searchHintTextStyleW400()
                        .copyWith(fontSize: 12),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
