import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

class RequestFailedDialog extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const RequestFailedDialog({
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
      child: RequestFailedWidget(
        title: title,
        subTitle: subTitle,
      ),
    );
  }
}

class RequestFailedWidget extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Function? onCloseClick;

  const RequestFailedWidget({
    super.key,
    this.title,
    this.subTitle,
    this.onCloseClick,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
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
                  onCloseClick?.call();
                },
                child: AppAssets.svg.icClose.svg(
                  semanticsLabel: "Close",
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
                  AppAssets.svg.close.svg(
                    width: 42,
                    height: 42,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title ?? context.localizedString.requestFailed,
                    style: AppTextStyles.dialogTitleTextStyle20W700,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Visibility(
                    visible: (subTitle ?? "").isNotEmpty,
                    child: Text(
                      subTitle ?? "",
                      style: AppTextStyles.dialogSubTitleTextStyle12W400,
                      textAlign: TextAlign.center,
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
