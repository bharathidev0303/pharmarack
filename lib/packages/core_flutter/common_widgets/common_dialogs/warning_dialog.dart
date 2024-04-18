import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_buttons/common_dialog_button.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/device_detector_widget.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';

class WarningWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  final VoidCallback? onCloseClick;
  final bool? hideCloseIcon;
  final String? buttonTitle;
  final VoidCallback? onButtonClick;

  const WarningWidget({
    super.key,
    required this.title,
    this.subTitle,
    this.onCloseClick,
    this.buttonTitle,
    this.onButtonClick,
    this.hideCloseIcon,
  });

  @override
  Widget build(BuildContext context) {
    return DeviceDetectorWidget(
        webSiteView: () => _commonWidget(context, 360),
        phoneView: () =>
            _commonWidget(context, MediaQuery.of(context).size.width * 0.9));
  }

  Widget _commonWidget(BuildContext context, double maxWidth) {
    return SizedBox(
      width: maxWidth,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                hideCloseIcon == null
                    ? Positioned(
                        top: 0,
                        right: 0,
                        child: InkWell(
                          key: const Key('closeIcon'),
                          onTap: onCloseClick ?? () => Navigator.pop(context),
                          child: AppAssets.svg.icClose.svg(
                            width: 24,
                            height: 24,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                _content(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 14),
          AppAssets.svg.notAllowed.svg(
            width: 40,
            height: 40,
          ),
          const SizedBox(height: 10),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              title,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              textAlign: TextAlign.center,
              style: AppTextStyles.style20W700
                  .copyWith(color: AppColors.cardTitleColor),
            ),
          ),
          Visibility(
            visible: subTitle != null,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                subTitle ?? '',
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                softWrap: true,
                style: AppTextStyles.style12W400
                    .copyWith(color: AppColors.secondaryTextColor),
              ),
            ),
          ),
          const SizedBox(height: 16),
          buttonTitle != null || buttonTitle != ""
              ? SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (onButtonClick != null) {
                        onButtonClick?.call();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(top: 13, bottom: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      backgroundColor: AppColors.blueButtonColor,
                    ),
                    child: Text(
                      buttonTitle!,
                      style: AppTextStyles.style12W500Black(
                          color: AppColors.white),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
