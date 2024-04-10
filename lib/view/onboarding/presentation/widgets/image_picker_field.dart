import 'dart:io';


import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/image_picker_dialog.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/utils/image_picker_util.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

class CustomImageFormField extends StatelessWidget {
  const CustomImageFormField({
    super.key,
    required this.validator,
    required this.onChanged,
    required this.labelText,
    this.widgetKey,
    this.selectedFile,
  });
  final FormFieldValidator<File?> validator;
  final Function(File?) onChanged;
  final String labelText;
  final Key? widgetKey;
  final File? selectedFile;

  @override
  Widget build(BuildContext context) {
    return FormField<File>(
        key: widgetKey,
        validator: validator,
        initialValue: selectedFile,
        builder: (formFieldState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                labelText,
                style: context.textStyles.header11Medium?.copyWith(
                    color: AppColors.mediumGreyText,
                    overflow: TextOverflow.ellipsis),
              ),
              const SizedBox(
                height: 2,
              ),
              GestureDetector(
                onTap: formFieldState.value == null
                    ? () async {
                        final selection = await showImagePickerDialog(context,
                            closeClick: () {});
                        File? selectedFile = await handleMediaSelection(
                            selection, formFieldState);
                        if (selectedFile != null) {
                          formFieldState.didChange(selectedFile);
                          onChanged.call(formFieldState.value);
                        }
                      }
                    : null,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.lightGreyTextField,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: formFieldState.hasError
                            ? AppColors.redErrorColor
                            : AppColors.lightGreyTextField),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            getFilename(formFieldState.value),
                            maxLines: 1,
                            style: context.textStyles.header7Medium?.copyWith(
                                color: AppColors.primaryColor,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        if (formFieldState.value == null)
                          AppAssets.svg.uploadIcon.svg(
                              height: 24, width: 24, package: 'core_flutter'),
                        if (formFieldState.value != null)
                          InkWell(
                            onTap: () {
                              /// nullifying the reference
                              formFieldState.didChange(null);
                              onChanged.call(null);
                            },
                            child: AppAssets.svg.icClose.svg(
                                key: const Key(
                                    OnboardingConstants.removeFileButton),
                                height: 24,
                                width: 24,
                                package: 'core_flutter'),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              if (formFieldState.hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 2, right: 2),
                        child: Icon(
                          Icons.info_outline,
                          size: 12,
                          color: AppColors.redErrorColor,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          formFieldState.errorText ?? '',
                          style: context.textStyles.header11Medium?.copyWith(
                              color: AppColors.redErrorColor,
                              overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                )
            ],
          );
        });
  }

  Future<File?> handleMediaSelection(
      selection, FormFieldState<File> formFieldState) async {
    if (selection == null) return null;

    final file = selection == MediaSelection.gallery
        ? await ImagePickerUtil.pickImageFromGallery()
        : await ImagePickerUtil.pickImageFromCamera();

    if (file != null) {
      return File(file.path);
    }

    return null;
  }

  String getFilename(File? file) {
    return file?.path.split('/').last ?? '';
  }
}
