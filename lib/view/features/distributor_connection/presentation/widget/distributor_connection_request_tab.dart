import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core/log_util/log_util.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/processing_request_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/request_failed_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/success_custom_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/snackbar_view/snack_bar.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/content_card.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/text_input_field.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/features/distributor_connection/presentation/cubit/request_distributor_connection_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/presentation/cubit/request_distributor_connection_state.dart';
import 'package:pharmarack/view/features/distributor_connection/presentation/widget/non_mapped_distributor_list_item.dart';
import 'package:pharmarack/view/features/distributor_connection/presentation/widget/send_store_mapping_request_dialog_card.dart';

class DistributorConnectionRequestTab extends StatefulWidget {
  const DistributorConnectionRequestTab({super.key});

  @override
  State<DistributorConnectionRequestTab> createState() =>
      _DistributorConnectionRequestTabState();
}

class _DistributorConnectionRequestTabState
    extends State<DistributorConnectionRequestTab> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<RequestDistributorConnectionCubit>()
        ..fetchNonMappedStores(),
      child: BlocConsumer<RequestDistributorConnectionCubit,
          RequestDistributorConnectionState>(
        listener: (context, state) async {
          LogUtil.info('Bloc listener $state');

          if (state.message == null) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
          } else {
            _showUserMessage(context, state.message!);
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<RequestDistributorConnectionCubit>(
            context,
          );
          return DistributorConnectionRequestTabContent(
            cubit: cubit,
            state: state,
          );
        },
      ),
    );
  }

  Future<void> _showUserMessage(
    BuildContext context,
    UserMessage message,
  ) async {
    final cubit = BlocProvider.of<RequestDistributorConnectionCubit>(context);
    String? snackBarMessage;

    if (message is ErrorFetchingNonMappedStores) {
      snackBarMessage = context.localizedString.somethingWentWrong;
    }

    if (snackBarMessage != null) {
      final controller = CommonSnackBar.showSnackBar(
        title: snackBarMessage,
        actionLabelTitle: context.localizedString.ok,
        context: context,
      );
      await controller.closed.then((_) => cubit.removeMessage());
    }
  }
}

class DistributorConnectionRequestTabContent extends StatelessWidget {
  final RequestDistributorConnectionState state;
  final RequestDistributorConnectionCubit cubit;

  const DistributorConnectionRequestTabContent({
    super.key,
    required this.cubit,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final Widget content;
    if (state.isLoading) {
      content = const Center(
        child: SpinKitFadingCircle(
          color: AppColors.blueButtonColor,
          size: 50.0,
        ),
      );
    } else if (state.storeItems.isEmpty) {
      content = _BlankSlate(
        action: TextButton(
          onPressed: () async => await cubit.fetchNonMappedStores(),
          child: Text(context.localizedString.retry),
        ),
      );
    } else {
      final listItems = state.searchResult ?? state.storeItems;
      if (listItems.isEmpty) {
        content = const _BlankSlate();
      } else {
        content = ListView.separated(
          itemCount: listItems.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final item = listItems[index];
            return NonMappedDistributorListItem(
              storeName: item.storeName,
              address: item.storeAddress,
              isMappingRequestSent: item.mappingRequestSent,
              onClickAction: () async {
                cubit.showMappingRequest(item.id);
                await _showMappingRequestDialog(context);
              },
            );
          },
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextInputField(
            onChanged: cubit.searchDistributor,
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
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(width: 5),
              Text(
                context.localizedString.mapNewDistributors,
                style: AppTextStyles.style12W400,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ContentCard(child: content),
          )
        ],
      ),
    );
  }

  Future _showMappingRequestDialog(BuildContext context) async {
    final cubit = BlocProvider.of<RequestDistributorConnectionCubit>(context);
    await showDialog(
      context: context,
      builder: (_) {
        // showDialog.builder context is hidden because it doesn't pass on the BlocProvider
        return BlocProvider.value(
          value: BlocProvider.of<RequestDistributorConnectionCubit>(context),
          child: BlocBuilder<RequestDistributorConnectionCubit,
              RequestDistributorConnectionState>(
            bloc: BlocProvider.of(context),
            builder: (context, state) {
              switch (state.mappingRequest.runtimeType) {
                case const (MappingRequestSent):
                  return SuccessDialog(
                    title: context.localizedString.requestSent,
                  );
                case const (MappingRequestFailed):
                  return RequestFailedDialog(
                    title: context.localizedString.requestFailed,
                  );
                case const (MappingRequestLimitExceeded):
                  return RequestFailedDialog(
                    title: context.localizedString.requestFailed,
                    subTitle: context.localizedString.mappingRequestExceeded,
                  );
                case const (SendingMappingRequest):
                  return const ProcessingRequestDialog();
                case const (MappingRequestDetails):
                  final request = state.mappingRequest as MappingRequestDetails;
                  return SendStoreMappingRequestDialogCard(
                    storeName: request.storeName,
                    address: request.address ?? '',
                    onSendRequest: (partyCode) async {
                      await cubit.sendStoreMappingRequest(
                        storeId: request.storeId,
                        storeName: request.storeName,
                        partyCode: partyCode,
                      );
                    },
                  );
                default:
                  return const Center(child: Text('mappingRequest is null'));
              }
            },
          ),
        );
      },
    );
    cubit.removeMappingRequest();
    await cubit.fetchNonMappedStores();
  }
}

class _BlankSlate extends StatelessWidget {
  final Widget action;

  const _BlankSlate({
    this.action = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(context.localizedString.noDistributorsFound),
          action,
        ],
      ),
    );
  }
}
