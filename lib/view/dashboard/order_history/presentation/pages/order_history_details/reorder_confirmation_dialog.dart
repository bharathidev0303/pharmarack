import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core/common_utils/device_ifo/device_info_manager.dart';
import 'package:pharmarack/packages/core/common_utils/ip_address_manager.dart';
import 'package:pharmarack/packages/core/common_utils/location_manager/location_manager.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_buttons/secondary_button.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/processing_request_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/request_failed_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/success_widget.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/primary_button.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/dashboard/order_history/data/model/display_order_detail.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_orders_model.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/reorder_cubit.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/reorder_state.dart';

class ReorderConfirmationDialog extends StatelessWidget {
  final DisplayOrder order;
  final List<InvoicedItems> orders;

  const ReorderConfirmationDialog({
    super.key,
    required this.order,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReorderCubit, ReorderState>(
      bloc: getIt<ReorderCubit>(),
      builder: (context, state) {
        return Dialog(
          surfaceTintColor: AppColors.dialogBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          child: _ReorderDialogState(
            order: order,
            orders: orders,
            state: state,
          ),
        );
      },
    );
  }
}

class _ReorderDialogState extends StatelessWidget {
  final DisplayOrder order;
  final List<InvoicedItems> orders;
  final ReorderState state;

  const _ReorderDialogState({
    required this.order,
    required this.orders,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    if (state.reorderMessage is ReorderLoading) {
      return const ProcessingRequestWidget();
    }
    if (state.reorderMessage is ReorderFail) {
      return RequestFailedWidget(
        subTitle: (state.reorderMessage as ReorderFail).errorMsg,
        onCloseClick: () {
          getIt<ReorderCubit>().clearState();
        },
      );
    }
    if (state.reorderMessage is ReorderSuccess) {
      return SuccessWidget(
        title: context.localizedString.ordered,
        subTitle: state.reorderModel.message,
        onCloseClick: () {
          Navigator.pop(context);
          getIt<ReorderCubit>().clearState();
        },
      );
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: AppAssets.svg.icClose.svg(
                  width: 24,
                  height: 24,
                  package: "core_flutter",
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 0),
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        context.localizedString.reOrderItemTitle,
                        style: AppTextStyles.dialogTitleTextStyle20W700,
                        textAlign: TextAlign.center,
                      ),
                      Spacer(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        context.localizedString.reorder_confirmation,
                        style: AppTextStyles.dialogSubTitleTextStyle14W700,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: PrimaryButton(
                          text: context.localizedString.cancel.toUpperCase(),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: SecondaryButton(
                          text: context.localizedString.confirm.toUpperCase(),
                          onClick: () {
                            getIt<ReorderCubit>().reorder(
                              order.orderId.toInt().toString(),
                              orders,
                              order.isMapStore,
                              IpAddressManager.getIpAddress(),
                              DeviceInfoManager.getDeviceInfo(),
                              LocationManager.getCurrentPosition(),
                            );
                          },
                        ),
                      ),
                    ],
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
