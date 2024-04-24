import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dashboard/secondary_app_bar.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/dashboard/order_history/di/order_history_provider.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/display_orders_model.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/order_history_detail_cubit.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/pages/order_history_details/order_details_mobile_view.dart';

class OrderDetailsPage extends BasePage<OrderDetailPageState> {
  const OrderDetailsPage({super.key});

  @override
  OrderDetailPageState createState() => OrderDetailPageState();
}

class OrderDetailPageState extends BaseStatefulPage {
  late DisplayOrder _order;

  @override
  Color scaffoldBackgroundColor() {
    return AppColors.appBackgroundColor;
  }

  @override
  void initState() {
    clearOrderDetailsDI();
    clearOrderHistoryDI();
    initOrderHistoryDI();
    _order = getIt<DisplayOrder>();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final value = ModalRoute.of(context)?.settings.arguments;
  //   if (value is DisplayOrder) {
  //     _order = value;
  //   }
  // }

  @override
  Widget buildView(BuildContext context) {
    return BlocProvider<OrderHistoryDetailCubit>(
      create: (context) => getIt<OrderHistoryDetailCubit>(),
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: AppColors.appBarColor,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: OrderDetailsMobileView(
          order: _order,
        ),
      ),
    );
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return SecondaryAppBar(
      titleText: context.localizedString.orderDetails,
      actions: const [
        // TextButton(
        //   onPressed: () {},
        //   child: Row(
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       Text(
        //         context.localizedString.downloadInvoice,
        //         style: context.textStyles.header10Medium?.copyWith(
        //           color: context.colors.primary,
        //         ),
        //       ),
        //       const SizedBox(width: 5),
        //       AppAssets.svg.download.svg(
        //
        //         width: 14,
        //         height: 14,
        //       )
        //     ],
        //   ),
        // )
      ],
    );
  }

  @override
  void dispose() {
    clearOrderDetailsDI();
    super.dispose();
  }
}
