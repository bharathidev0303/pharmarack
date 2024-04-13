import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dashboard/secondary_app_bar.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import '../../di/cart_provider.dart';
import '../cubit/cart_screen_cubit.dart';
import '../cubit/cart_screen_state.dart';
import '../cubit/draggable_cart/cubit/draggable_cart_cubit.dart';
import '../widgets/cancel_order_popup.dart';

class PlaceOrderSuccessfulPage extends StatefulWidget {
  const PlaceOrderSuccessfulPage({super.key});

  @override
  PlaceOrderSuccessfulPageState createState() =>
      PlaceOrderSuccessfulPageState();
}

class PlaceOrderSuccessfulPageState extends State<PlaceOrderSuccessfulPage> {
  final CountDownController _controller = CountDownController();

  @override
  void initState() {
    super.initState();
    getIt<DraggableCartScreenCubit>().getCartDetails(isUpdate: false);
    cartScreenCubit.isCancelEnable = true;
    // Future.delayed(const Duration(microseconds: 150)).then((value) {
    //   _controller.start();
    //   cartScreenCubit.saveCurrentTimeStamp();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(
        titleText: context.localizedString.cart,
        actions: [
          InkWell(onTap: () {}, child: AppAssets.svg.icHelpCircle.svg()),
        ],
      ),
      backgroundColor: AppColors.appBackgroundColor,
      body: BlocConsumer<CartScreenCubit, CartScreenState>(
          bloc: cartScreenCubit,
          listener: (BuildContext context, CartScreenState state) {
            if (state is CartScreenLoadingState) {
              showProcessingRequestDialog(context, userRootNavigator: false);
            } else if (state is CartScreenErrorState) {
              CommonDialogs.closeCommonDialog(context: context);
              CommonDialogs.showSimpleDialog(
                  parentContext: context,
                  title: context.localizedString.attention,
                  subTitle: context.localizedString.somethingWentWrong,
                  buttonTitle: context.localizedString.ok,
                  barrierDismissible: true);
            } else if (state is CartScreenDataState) {
              CommonDialogs.closeCommonDialog(context: context);
            } else if (state is CancelOrderSuccessState) {
              CommonDialogs.closeCommonDialog(context: context);
              Navigator.of(context).pop(true);
            }
          },
          builder: (BuildContext context, CartScreenState state) {
            if (state is CancelOrderEnableState) {
              return buildSingleChildScrollView(
                  context: context,
                  isCancelEnable: cartScreenCubit.isCancelEnable);
            }
            return buildSingleChildScrollView(
                context: context,
                isCancelEnable: cartScreenCubit.isCancelEnable);
          }),
    );
  }

  SingleChildScrollView buildSingleChildScrollView(
      {required BuildContext context, bool isCancelEnable = false}) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
        child: Column(
          children: [
            buildPlaceOrderCard(isCancelEnable, context),
            const SizedBox(
              height: 20,
            ),
            // ProductItem(
            //   title: context.localizedString.popularProduct,
            // )
          ],
        ),
      ),
    );
  }

  Container buildPlaceOrderCard(bool isCancelEnable, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: AppColors.white,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: AppColors.dividerColor)),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(onTap: () {}, child: AppAssets.svg.icShare.svg()),
          ),
          AppAssets.svg.icSuccess.svg(),
          Text(
            context.localizedString.placedOrders.replaceAll('#', ''),
            style: AppTextStyles.dialogTitleTextStyle20W700,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            context.localizedString.placeOrderDescription,
            // context.localizedString.expandAll,
            style: AppTextStyles.style10W500Black(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              // Expanded(
              //   child: buildCancelOrderButton(
              //       context: context,
              //       buttonTitle: context.localizedString.cancelOrder,
              //       isCancelEnable: isCancelEnable),
              // ),
              // const SizedBox(
              //   width: 8,
              // ),
              Expanded(
                child: buildViewOrderButton(
                    context: context,
                    buttonTitle: context.localizedString.viewOrder,
                    isCancelEnable: isCancelEnable),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCancelOrderButton(
      {required BuildContext context,
      required String buttonTitle,
      required bool isCancelEnable}) {
    return GestureDetector(
      onTap: () {
        // if (isCancelEnable) {
        doOpenCancelPopup();
        // cartScreenCubit.updateCancelOrderState(false);
        // Navigator.of(context).pop(false);
        // }
      },
      child: Container(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        decoration: BoxDecoration(
            color: isCancelEnable == false
                ? AppColors.disableColor
                : AppColors.cardRectangleColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonTitle,
              style: AppTextStyles.blueLinkTextStyle,
              textAlign: TextAlign.center,
            ),
            isCancelEnable == true
                ? const SizedBox(
                    width: 10,
                  )
                : Container(),
            isCancelEnable == true ? buildCircularProgressBar() : Container()
          ],
        ),
      ),
    );
  }

  Widget buildViewOrderButton(
      {required BuildContext context,
      required String buttonTitle,
      required bool isCancelEnable}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutePaths.orderHistory);
      },
      child: Container(
        padding: EdgeInsets.only(
            top: isCancelEnable == false ? 15.0 : 22.0,
            bottom: isCancelEnable == false ? 15.0 : 22.0),
        decoration: BoxDecoration(
            color: isCancelEnable == true
                ? AppColors.disableColor
                : AppColors.cardRectangleColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Text(
          buttonTitle,
          style: AppTextStyles.blueLinkTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  CircularCountDownTimer buildCircularProgressBar() {
    return CircularCountDownTimer(
      duration: AppConstants.countDownTime,
      initialDuration: 0,
      controller: _controller,
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
    );
  }

  void doOpenCancelPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CancelOrderPopup(
          cancelOrderCallBack: () {
            cartScreenCubit.cancelOrder();
          },
        );
      },
    );
  }
}
