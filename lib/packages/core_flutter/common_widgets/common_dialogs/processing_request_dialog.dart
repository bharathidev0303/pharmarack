import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/device_detector_widget.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

class ProcessingRequestDialog extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const ProcessingRequestDialog({
    super.key,
    this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: AppColors.dialogBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: DeviceDetectorWidget(
        phoneView: () => ProcessingRequestWidget(
          title: title,
          subTitle: subTitle,
        ),
        webSiteView: () => ProcessingRequestWidget(
          title: title,
          subTitle: subTitle,
          dialogWidth: 360,
        ),
      ),
    );
  }
}

class ProcessingRequestWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final double? dialogWidth;

  const ProcessingRequestWidget({
    super.key,
    this.title,
    this.subTitle,
    this.dialogWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dialogWidth ?? MediaQuery.of(context).size.width,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 45),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: AppAssets.png.close.image(
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 14),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 42,
                    height: 42,
                    child: CircularProgressIndicator(),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title ?? context.localizedString.processingRequest,
                    style: AppTextStyles.dialogTitleTextStyle20W700,
                  ),
                  const SizedBox(height: 10),
                  Visibility(
                    visible: (subTitle ?? "").isNotEmpty,
                    child: Text(
                      subTitle ?? "",
                      style: AppTextStyles.dialogSubTitleTextStyle12W400,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
