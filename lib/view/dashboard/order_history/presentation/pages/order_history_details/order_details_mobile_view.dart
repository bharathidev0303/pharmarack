import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_orders_model.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/order_history_detail_cubit.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/order_history_detail_state.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/pages/order_history_details/order_detail_mobile_content.dart';

class OrderDetailsMobileView extends StatelessWidget {
  final DisplayOrder order;

  const OrderDetailsMobileView({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    getIt<OrderHistoryDetailCubit>().displayOrderDetail(order.orderId);
    return BlocConsumer<OrderHistoryDetailCubit, OrderHistoryDetailState>(
      listener: _onBlocListener,
      builder: (context, state) {
        if (state.orderDetailMessage is OrderDetailLoading) {
          // return const Center(
          //   child: CircularProgressIndicator(),
          // );
        }

        return OrderDetailMobileContent(
          order: order,
          displayOrderDetailModel: state.displayOrderDetailModel,
        );
      },
    );
  }

  void _onBlocListener(
      BuildContext context, OrderHistoryDetailState state) async {
    if (state.orderDetailMessage is OrderDetailFailure) {
      showFailedRequestDialog(
        context,
        subtitle: (state.orderDetailMessage as OrderDetailFailure).errorMsg,
      );
    }
  }
}
