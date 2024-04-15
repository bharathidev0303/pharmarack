import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/snackbar_view/snack_bar.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/text_input_field.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/no_records_found.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/search_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/distributor_mapped_tab_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/save_priority_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/send_request_mapping_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/states/save_priority_state.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/states/send_request_mapping_state.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/states/stockiest_priority_state.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/pages/distributor_mapped_tab_state.dart';

/// This class [StockiestPriorityPageMobileView] which specifically used to render Mobile UI
class StockiestPriorityPageMobileView extends StatelessWidget {
  const StockiestPriorityPageMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    getIt<DistributorMappedTabCubit>().requestStockiestResponse('search');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 15),
          child: TextInputField(
            onChanged: (query) {
              getIt<SearchCubit>().updateSearchQuery(query);
              getIt<DistributorMappedTabCubit>().performSearch();
            },
            hint: Row(
              children: [
                AppAssets.svg.icSearch.svg(
                  width: 16,
                  height: 16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.secondaryTextColor,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  context.localizedString.searchDistributor,
                  style: AppTextStyles.style14W400.copyWith(
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),
            textInputAction: TextInputAction.search,
          ),
        ),
        Expanded(
          child: MultiBlocListener(
            listeners: [
              BlocListener<SavePriorityCubit, SavePriorityState>(
                bloc: getIt<SavePriorityCubit>(),
                listener: (ctx, state) {
                  if (state is SuccessSavePriorityState &&
                      state.priorityState.isPriorityChanged) {
                    CommonSnackBar.showFloatingSnackBar(
                      context,
                      context.localizedString.prioritiesOrderedSuccessMessage,
                    );
                  } else if (state is FailureSavePriorityState) {
                    CommonSnackBar.showFloatingSnackBar(
                      context,
                      context.localizedString.prioritiesOrderedFailureMessage,
                    );
                  }
                },
              ),
              BlocListener<SendRequestMappingCubit, SendRequestMappingState>(
                bloc: getIt<SendRequestMappingCubit>(),
                listener: (ctx, state) {
                  if (state is SuccessSendRequestStoreMappings) {
                    CommonDialogs.closeCommonDialog(context: context);
                    showSuccessDialog(
                      context,
                      title: context.localizedString.requestSent,
                      subtitle: "",
                      userRootNavigator: false,
                    );
                  } else if (state is LoadingSendRequestStoreMappings) {
                    showProcessingRequestDialog(
                      context,
                      userRootNavigator: false,
                    );
                  } else if (state is FailureSendRequestStoreMappings) {
                    CommonDialogs.closeCommonDialog(context: context);
                    showFailedRequestDialog(
                      context,
                      title: context.localizedString.requestFailed,
                      userRootNavigator: false,
                    );
                  } else if (state is MaximumLimitReachedState) {
                    CommonDialogs.closeCommonDialog(context: context);
                    showFailedRequestDialog(
                      context,
                      title: context.localizedString.requestFailed,
                      subtitle: state.errorMessage,
                      userRootNavigator: false,
                    );
                  }
                },
              ),
            ],
            child:
                BlocConsumer<DistributorMappedTabCubit, StockiestPriorityState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is StockiestSuccessState) {
                  return DistributorMappedTabState(
                    stockiestList: state.stockiestResponses,
                    distributorsList: state.distributorResponses,
                  );
                } else if (state is StockiestSearchState) {
                  return DistributorMappedTabState(
                    stockiestList: state.stockiestResponses,
                    distributorsList: state.distributorResponses,
                  );
                } else if (state is StockiestNoDataState) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const NoRecordsFound(),
                  );
                }

                return const Center(
                  child: SpinKitFadingCircle(
                    color: AppColors.blueButtonColor,
                    size: 50.0,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
