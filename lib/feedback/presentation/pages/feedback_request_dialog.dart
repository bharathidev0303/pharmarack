
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pharmarack/feedback/di/feedback_provider.dart';
import 'package:pharmarack/feedback/presentation/cubit/feedback_input_cubit.dart';
import 'package:pharmarack/feedback/presentation/cubit/feedback_input_state.dart';
import 'package:pharmarack/feedback/presentation/cubit/feedback_screen_cubit.dart';
import 'package:pharmarack/feedback/presentation/cubit/feedback_screen_state.dart';
import 'package:pharmarack/feedback/utils/feedback_constants.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/dialog_card.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/device_detector_widget.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

class FeedbackRequestDialogScreen extends StatefulWidget {
  const FeedbackRequestDialogScreen({super.key});

  @override
  State<FeedbackRequestDialogScreen> createState() =>
      _FeedbackRequestDialogScreenState();
}

class _FeedbackRequestDialogScreenState
    extends State<FeedbackRequestDialogScreen> {
  late FeedbackScreenCubit feedbackScreenCubit;

  @override
  void initState() {
    super.initState();
    unregisterDI();
    initDependency();
    feedbackScreenCubit = feedbackProvider<FeedbackScreenCubit>();
    Future(() => _showDialog(context));
  }

  @override
  void dispose() {
    unregisterDI();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }

  Future<void> _showDialog(BuildContext context) async {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) {
        return DeviceDetectorWidget(
          phoneView: () => FeedbackRequestDialog(
            feedbackScreenCubit: feedbackScreenCubit,
          ),
          webSiteView: () => FeedbackRequestDialog(
            feedbackScreenCubit: feedbackScreenCubit,
            width: 434,
          ),
        );
      },
    );
  }
}

class FeedbackRequestDialog extends StatelessWidget {
  final double width;
  final FeedbackScreenCubit feedbackScreenCubit;

  const FeedbackRequestDialog({
    super.key,
    required this.feedbackScreenCubit,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeedbackScreenCubit, FeedbackScreenState>(
      listener: (ctx, state) {
        if (state is FeedbackScreenDataState) {
          CommonDialogs.closeCommonDialog(context: context);
          Navigator.of(context).pop();
          showSuccessDialog(
            context,
            title: context.localizedString.feedbackDialogSuccessHeader,
            subtitle: context.localizedString.feedbackDialogSuccessBody,
          );
        }
        if (state is FeedbackScreenErrorState) {
          CommonDialogs.closeCommonDialog(context: context);
          Navigator.of(context).pop();
          showFailureDialog(
            context,
            title: context.localizedString.dialogFailureHeader,
            subtitle: context.localizedString.feedbackDialogFailureBody,
          );
        }
        if (state is FeedbackScreenLoadingState) {
          showProcessingRequestDialog(context);
        }
      },
      bloc: feedbackScreenCubit,
      builder: (ctx, state) =>
          BlocBuilder<FeedbackInputCubit, FeedbackInputState>(
        bloc: feedbackScreenCubit.feedbackInputCubit,
        builder: (ctx, state) => DialogCard(
          width: width,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 18,
              ),
              Text(
                context.localizedString.feedbackRequestDialogHelperText,
                style: AppTextStyles.style11W500MedGrey(),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                key: const Key(FeedbackConstants.feedbackRatingBarKey),
                child: RatingBar(
                  minRating: 0.5,
                  itemCount: 5,
                  itemSize: 35.0,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                  initialRating: 0,
                  allowHalfRating: true,
                  glow: false,
                  unratedColor: AppColors.ratingStarUnSelectedColor,
                  ratingWidget: RatingWidget(
                    half: AppAssets.svg.feedbackStarHalf
                        .svg(package: "core_flutter"),
                    full: AppAssets.svg.feedbackStarFull
                        .svg(package: "core_flutter"),
                    empty:
                        AppAssets.svg.feedbackStar.svg(package: "core_flutter"),
                  ),
                  onRatingUpdate: (rating) {
                    feedbackScreenCubit.feedbackInputCubit.updateRating(rating);
                    feedbackScreenCubit.feedbackInputCubit
                        .validateRatingAndRemarks();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.lightGreyTextField,
                    borderRadius: BorderRadius.circular(5)),
                height: 102,
                child: TextField(
                  key: const Key(FeedbackConstants.feedbackRemarksTextFieldKey),
                  maxLines: null,
                  expands: true,
                  controller: feedbackScreenCubit
                      .feedbackInputCubit.textEditingController,
                  textAlignVertical: TextAlignVertical.top,
                  onTap: () {
                    feedbackScreenCubit.feedbackInputCubit
                        .updateOnFocusForTxtField(true, context);
                  },
                  onChanged: (_) {
                    feedbackScreenCubit.feedbackInputCubit
                        .validateRatingAndRemarks();
                  },
                  style: AppTextStyles.style14W400
                      .copyWith(color: AppColors.mediumGreyText),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      hintText: feedbackScreenCubit.feedbackInputCubit.hintTxt,
                      filled: true,
                      contentPadding: const EdgeInsets.only(top: 12, left: 10)),
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
          title: context.localizedString.feedbackRequestDialogTitle,
          actionText: context.localizedString.feedbackRequestDialogButtonTitle,
          onClickAction: (state is FeedbackInputNotEmptyState)
              ? () {
                  feedbackScreenCubit.saveFeedback();
                }
              : null,
        ),
      ),
    );
  }
}
