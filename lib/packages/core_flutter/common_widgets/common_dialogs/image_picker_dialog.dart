
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

import '../../dls/color/app_colors.dart';

class ImagePickerDialog extends StatelessWidget {
  final VoidCallback? onCloseClick;

  const ImagePickerDialog({
    super.key,
    this.onCloseClick,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        surfaceTintColor: AppColors.transparent,
        backgroundColor: AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColors.imagePickerBackgroundColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context, MediaSelection.gallery);
                      },
                      child: SizedBox(
                        height: 61,
                        child: Center(
                          child: Text(
                            context.localizedString.photoGallery,
                            style: context.textStyles.header5Regular?.copyWith(
                              color: AppColors.imagePickerTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.imagePickerDividerColor,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context, MediaSelection.camera);
                      },
                      child: SizedBox(
                        height: 61,
                        child: Center(
                          child: Text(
                            context.localizedString.camera,
                            style: context.textStyles.header5Regular?.copyWith(
                                color: AppColors.imagePickerTextColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.imagePickerBackgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: 61,
                    child: Center(
                      child: Text(
                        context.localizedString.cancel,
                        style: context.textStyles.header4Medium?.copyWith(
                          color: AppColors.imagePickerTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

enum MediaSelection { gallery, camera }
