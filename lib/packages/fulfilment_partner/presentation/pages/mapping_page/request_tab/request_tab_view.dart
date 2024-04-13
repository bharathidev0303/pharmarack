import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/fulfilment_partner/assset_constants.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/endpoints_constants/fulfilment_partner_options.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/request_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/request_state.dart';
import 'package:pharmarack/packages/fulfilment_partner/utils/common_progress_dialog.dart';

import 'data_found_and_filter_state.dart';

class RequestTabView extends StatelessWidget {
  const RequestTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestCubit, RequestCubitState>(
      listener: (ctx, state) {
        if (state is RejectRequestState) {
          if (state.approveRejectMappingModel.isLoading) {
            showProgressDialog(context);
          }
          if (state.approveRejectMappingModel.responseText.isNotEmpty) {
            getIt<RequestCubit>().getRequestedFulfillmentPartner(
              getIt<String>(instanceName: FulfilmentPartnerOptions.moduleName),
              isLoad: false,
            );
            showResponseTextDialog(
              context,
              state.approveRejectMappingModel.responseText,
              onOkButtonClick: () => navigateToMappingScreen(context),
            );
          }
        } else if (state is RequestCubitLoadingState) {
          getIt<RequestCubit>().progressFlag = true;
          showProgressDialog(context);
        } else if (state is RequestCubitErrorState) {
          showResponseTextDialog(
            context,
            state.errorMessage,
            onOkButtonClick: () => navigateToMappingScreen(context),
          );
        } else {
          if (getIt<RequestCubit>().progressFlag) {
            getIt<RequestCubit>().progressFlag = false;
            navigateToMappingScreen(context);
          }
        }
      },
      builder: (ctx, state) {
        if (state is RequestCubitNoDataState) {
          return const Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image(
                  image: AssetImage(
                    AssetConstants.noRecordFoundImage,
                    package: FulfilmentPartnerOptions.currentPackageName,
                  ),
                  width: 400,
                  height: 200,
                ),
              )
            ],
          );
        } else if (state is RequestCubitErrorState) {
          return DataFoundAndFilterState(
            requests: state.requests,
            isAnyRequestChecked: state.isAnyRequestChecked(),
            shouldDisplaySearchBox: state.requests.isEmpty,
          );
        } else if (state is RequestCubitDataState) {
          return DataFoundAndFilterState(
            requests: state.model.data!,
            isAnyRequestChecked: state.isAnyRequestChecked(),
          );
        } else if (state is RequestSearchState) {
          return DataFoundAndFilterState(
            requests: state.requests,
            isAnyRequestChecked: state.isAnyRequestChecked(),
          );
        } else if (state is RequestCheckedState) {
          return DataFoundAndFilterState(
            requests: state.requests,
            isAnyRequestChecked: state.isAnyRequestChecked(),
          );
        } else if (state is RejectRequestState) {
          return DataFoundAndFilterState(
            requests: state.requests,
            isAnyRequestChecked: state.isAnyRequestChecked(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
