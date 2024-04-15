import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';

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
class DialogCardTwoButton extends StatelessWidget {
  static const keyDialogCardSaveActionButton =
      Key('dialogCardSaveActionButton');
  static const keyDialogCardCancelActionButton =
      Key('dialogCardCancelActionButton');
  final String? title;
  final FontWeight? titleWeight;
  final VoidCallback? onClose;
  final Widget body;
  final double width;
  final String? cancelActionText;
  final String? saveActionText;
  final Function()? onClickSaveAction;
  final Function()? onClickCancelAction;
  final bool showProgress;

  const DialogCardTwoButton({
    super.key,
    required this.body,
    this.title,
    this.titleWeight = FontWeight.normal,
    this.width = double.infinity,
    this.showProgress = false,
    this.onClickSaveAction,
    this.onClose,
    this.cancelActionText,
    this.saveActionText,
    this.onClickCancelAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              body,
              Visibility(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilledButton(
                      key: keyDialogCardCancelActionButton,
                      onPressed: showProgress ? null : onClickCancelAction,
                      style: FilledButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor:
                            AppColors.dialogActionDisabledBackground,
                        foregroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        cancelActionText?.toUpperCase() ?? '',
                        style: AppTextStyles.dialogActionStyle12W500,
                      ),
                    ),
                    FilledButton(
                      key: keyDialogCardSaveActionButton,
                      onPressed: showProgress ? null : onClickSaveAction,
                      style: FilledButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor:
                            AppColors.dialogActionEnabledBackground,
                        foregroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        saveActionText?.toUpperCase() ?? '',
                        style: AppTextStyles.dialogActionStyle12W500,
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: showProgress,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SpinKitFadingCircle(
                    color: AppColors.blueButtonColor,
                    size: 50.0,
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
