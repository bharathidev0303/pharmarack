import 'package:circular_countdown_timer/circular_countdown_timer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CommonModule.dart';
import '../../di/cart_provider.dart';
import '../cubit/cart_screen_state.dart';

/// Popup that provides "Change Distributor" and "Delete Item" options to the Cart items.
class CancelOrderPopup extends StatefulWidget {
  final Function cancelOrderCallBack;

  const CancelOrderPopup({super.key, required this.cancelOrderCallBack});

  @override
  State<CancelOrderPopup> createState() => _CancelOrderPopupPopupState();
}

class _CancelOrderPopupPopupState extends State<CancelOrderPopup> {
  final controller = OverlayPortalController();
  final CountDownController countController = CountDownController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(microseconds: 150))
        .then((value) => countController.start());
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      surfaceTintColor: AppColors.dialogBackground,
      child: BlocBuilder(
          bloc: cartScreenCubit,
          builder: (context, state) {
            if (state is CancelOrderEnableState) {
              return buildDialogBoxView(
                  context: context,
                  isCancelEnable: cartScreenCubit.isCancelEnable);
            }
            return buildDialogBoxView(
                context: context,
                isCancelEnable: cartScreenCubit.isCancelEnable);
          }),
    );
  }

  Widget buildDialogBoxView(
      {required BuildContext context, required bool isCancelEnable}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildTitleAndCountdownWidget(isCancelEnable),
              const SizedBox(
                height: 16,
              ),
              Text(
                context.localizedString.cancelOrderMsg,
                style: AppTextStyles.style12W700Black(
                    color: AppColors.secondaryTextColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              buildDialogButtonsWidget(isCancelEnable, context)
            ]),
      ),
    );
  }

  Row buildDialogButtonsWidget(bool isCancelEnable, BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (isCancelEnable) {
                Navigator.pop(context);
                widget.cancelOrderCallBack();
              }
            },
            child: Container(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              decoration: BoxDecoration(
                  color: isCancelEnable == false
                      ? AppColors.disableColor
                      : AppColors.cardRectangleColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Text(
                context.localizedString.dialogActionYesText.toUpperCase(),
                style: AppTextStyles.blueLinkTextStyle
                    .copyWith(fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
              decoration: const BoxDecoration(
                  color: AppColors.secondaryButtonTextColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Text(
                context.localizedString.dialogActionNoText.toUpperCase(),
                style: AppTextStyles.blueLinkTextStyle
                    .copyWith(fontWeight: FontWeight.w300, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildTitleAndCountdownWidget(bool isCancelEnable) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.localizedString.cancelOrder.toTitleCase(),
          style: AppTextStyles.style16W700Black(
              color: AppColors.blackTextFieldText),
          textAlign: TextAlign.center,
        ),
        isCancelEnable == true
            ? CircularCountDownTimer(
                duration: AppConstants.countDownTime,
                initialDuration: AppConstants.countDownTime -
                    cartScreenCubit.remainingCountdown,
                controller: countController,
                width: 30,
                height: 30,
                ringColor: AppColors.progressBarBgColor,
                ringGradient: null,
                fillColor: AppColors.secondaryButtonTextColor,
                fillGradient: null,
                backgroundColor: AppColors.progressBarBgColor,
                backgroundGradient: null,
                strokeWidth: 5.0,
                strokeCap: StrokeCap.round,
                textStyle: AppTextStyles.blueLinkTextStyle
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 11),
                textFormat: CountdownTextFormat.S,
                isReverse: true,
                isReverseAnimation: false,
                isTimerTextShown: true,
                autoStart: false,
                onStart: () {},
                onComplete: () {
                  cartScreenCubit.updateCancelOrderState(false);
                },
                onChange: (String timeStamp) {},
                timeFormatterFunction: (defaultFormatterFunction, duration) {
                  cartScreenCubit.remainingCountdown = duration.inSeconds;
                  if (duration.inSeconds == 0) {
                    return '';
                  } else {
                    // other durations by it's default format
                    return Function.apply(defaultFormatterFunction, [duration]);
                  }
                },
              )
            : Container()
      ],
    );
  }
}
