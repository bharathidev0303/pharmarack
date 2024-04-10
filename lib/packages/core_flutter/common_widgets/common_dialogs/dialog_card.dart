import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';

import '../../dls/color/app_colors.dart';
import '../../dls/text_utils/app_text_style.dart';

/// Dialog card with title, close button, body and action button.
///
/// It has 16px padding by default.
/// it wraps give [body] to its height and occupies maximum width available while leaving 24px margins towards the screen.
///
///
/// [title] is the title of the dialog, displayed at top along with close button
/// [body] is a Widget that is displayed below the title
/// [actionText] is used in filled-button at the bottom of the dialog
/// Optional [onClickAction] is the callback when the action button is clicked
/// Optional [onClose] which closes dialog by default, but can be overridden to do something else.
///
/// Example:
/// ```dart
/// showDialog(
///  context: context,
///  builder: (context) {
///   return DialogCard(
///     title: 'Change Password',
///     actionText: 'Save changes',
///     onClickAction: null, // disables the action button
///     body: Text('Body'),
///   );
///  },
/// );
class DialogCard extends StatelessWidget {
  static const keyDialogCardActionButton = Key('dialogCardActionButton');
  final String? title;
  final FontWeight? titleWeight;
  final VoidCallback? onClose;
  final String? type;
  final Widget body;
  final double width;
  final String? actionText;
  final Function()? onClickAction;
  final bool showProgress;

  const DialogCard({
    super.key,
    required this.body,
    this.title,
    this.titleWeight = FontWeight.normal,
    this.width = double.infinity,
    this.actionText,
    this.type,
    this.showProgress = false,
    this.onClickAction,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: AppColors.dialogBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                CrossAxisAlignment.center, // to wrap the height of dialog
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title ?? '',
                      style: context.textStyles.header5Regular?.copyWith(
                          color: context.colors.textPrimary,
                          fontWeight: titleWeight),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                  type == 'no_distributor'
                      ? const SizedBox.shrink()
                      : InkWell(
                          child: AppAssets.svg.icClose.svg(
                            package: 'core_flutter',
                            semanticsLabel: 'Close',
                          ),
                          onTap: () {
                            if (onClose != null) {
                              onClose!();
                            } else {
                              Navigator.pop(context);
                            }
                          },
                        )
                ],
              ),
              type == 'no_distributor'
                  ? Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: 1,
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      color: Color.fromRGBO(144, 144, 144, 1))
                  : const SizedBox.shrink(),
              body,
              Visibility(
                visible: actionText != null,
                child: FilledButton(
                  key: keyDialogCardActionButton,
                  onPressed: showProgress ? null : onClickAction,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: AppColors.dialogActionEnabledBackground,
                    disabledBackgroundColor:
                        AppColors.dialogActionDisabledBackground,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    actionText?.toUpperCase() ?? '',
                    style: AppTextStyles.dialogActionStyle12W500,
                  ),
                ),
              ),
              Visibility(
                visible: showProgress,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
