import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/main/navigation/route_paths.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/dashboard/secondary_app_bar.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/no_records_found.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/core_flutter/utils/extensions.dart';
import 'package:pharmarack/view/dashboard/cart/di/cart_provider.dart';
import 'package:pharmarack/view/dashboard/cart/presentation/cubit/cart_screen_cubit.dart';
import 'package:pharmarack/view/features/common/cubit/bottom_navigation_cubit.dart';
import '../cubit/cart_screen_state.dart';
import '../widgets/cart_widgets.dart';

class CartDetailPage extends StatefulWidget {
  const CartDetailPage({super.key});

  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cartScreenCubit.getCartDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(
        titleText: context.localizedString.cart,
        onPressBackButton: () {
          getIt<BottomNavigationCubit>().updateBottomNavigationIndex(0);
        },
      ),
      backgroundColor: AppColors.appBackgroundColor,
      body: BlocConsumer<CartScreenCubit, CartScreenState>(
          bloc: cartScreenCubit,
          listener: (BuildContext context, CartScreenState state) {
            if (state is CartScreenLoadingState) {
              showProcessingRequestDialog(context, userRootNavigator: false);
            } else if (state is CartScreenErrorState) {
              CommonDialogs.closeCommonDialog(context: context);
              showFailedRequestDialog(
                context,
                title: context.localizedString.attention,
                subtitle: formatHtmlString(state.errorMessage ??
                    context.localizedString.somethingWentWrong),
              );
              cartScreenCubit.getCartDetails(showLoader: false);
            } else if (state is CartScreenDataState) {
              CommonDialogs.closeCommonDialog(context: context);
            } else if (state is PlaceOrderSuccess) {
              CommonDialogs.closeCommonDialog(context: context);
              Navigator.pushNamed(context, RoutePaths.placeOrderSuccessFulPage)
                  .then((value) {
                cartScreenCubit.getCartDetails();
              });
            }
          },
          builder: (BuildContext context, CartScreenState state) {
            if (state is CartScreenDataState) {
              return CartWidget(state.cartDetails);
            } else if (state is CartScreenNoDataState) {
              CommonDialogs.closeCommonDialog(context: context);
              return Container(
                  color: AppColors.white,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: NoRecordsFound(
                        icons: AppAssets.svg.emptyCart.svg(),
                        buttonTitle: context.localizedString.addNow,
                        message: context.localizedString.emptyCartStr,
                        buttonCallBack: () async {
                          await Navigator.pushNamed(
                              context, RoutePaths.searchProduct);
                          cartScreenCubit.getCartDetails();
                        },
                      )));
            }
            return Container();
          }),
    );
  }
}
