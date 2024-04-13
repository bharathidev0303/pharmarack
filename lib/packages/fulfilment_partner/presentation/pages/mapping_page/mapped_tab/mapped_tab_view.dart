import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/fulfilment_partner/assset_constants.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/endpoints_constants/fulfilment_partner_options.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/mapped_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/mapped_state.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/pages/mapping_page/mapped_tab/mapped_settings_data_view.dart';
import 'package:pharmarack/packages/fulfilment_partner/utils/common_progress_dialog.dart';

class MappedTabView extends StatelessWidget {
  const MappedTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MappedCubit, MappedSettingState>(
      listener: (ctx, state) {
        if (state is MappedSettingsLoadingState) {
          showProgressDialog(context);
        } else if (state is! MappedSettingsSearchState) {
          navigateToMappingScreen(context);
        }

        if (state is MappedSettingsErrorState) {
          showResponseTextDialog(
            context,
            state.error.getFriendlyMessage(),
            onOkButtonClick: () => navigateToMappingScreen(context),
          );
        }
      },
      builder: (ctx, state) {
        if (state is MappedSettingsNoDataState) {
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
        } else if (state is MappedSettingsLoadingState) {
          return MappedSettingDataView(
            partners: state.partners,
          );
        } else if (state is MappedSettingsSuccessState) {
          return MappedSettingDataView(
            partners: state.partners,
          );
        } else if (state is MappedSettingsErrorState) {
          return MappedSettingDataView(
            partners: state.partners,
          );
        } else if (state is MappedSettingsSearchState) {
          return MappedSettingDataView(
            partners: state.partners,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
