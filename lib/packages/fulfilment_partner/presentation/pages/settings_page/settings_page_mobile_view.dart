import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation/widget/bottom_nav_bar.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/assset_constants.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/endpoints_constants/fulfilment_partner_options.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/mapped_settings_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/settings_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/settings_state.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/pages/settings_page/mapped_settings_state_view.dart';
import 'package:pharmarack/packages/fulfilment_partner/utils/common_progress_dialog.dart';
import 'package:pharmarack/packages/fulfilment_partner/utils/custom_dropdown/custom_drop_down.dart';

class SettingsPageMobileView extends StatelessWidget {
  const SettingsPageMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    getIt<SettingsCubit>().getMappedSettingsFromSettingsPage(
        context.localizedString.selectFulfillmentPartner);
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (ctx, state) {
        if (state is SettingsLoadingState) {
          showProgressDialog(context);
        }

        if (state is SettingsSuccessState && state.isLoadingDone) {
          Navigator.of(context).pop();
          if (state.saveSettingSuccessMessage.isNotEmpty) {
            showResponseTextDialog(
              context,
              state.saveSettingSuccessMessage,
              onOkButtonClick: () => Navigator.of(context).pop(),
            );
          }
        }

        if (state is SettingsNoDataState) {
          Navigator.of(context).pop();
        }

        if (state is SettingsErrorState) {
          Navigator.of(context).pop();
          showResponseTextDialog(
            context,
            state.error.getFriendlyMessage(),
            onOkButtonClick: () => Navigator.of(context).pop(),
          );
        }
      },
      builder: (ctx, state) {
        if (state is SettingsSuccessState) {
          return _DataAndNoDataStateHolder(
            mappedSettingPartners: state.partners,
            searchResult: state.searchResult,
            selectedMappedSettingPartner: state.mappedSettingPartners,
          );
        } else if (state is SettingsLoadingState) {
          return _DataAndNoDataStateHolder(
            mappedSettingPartners: state.partners,
            searchResult: const SearchResult(searchQuery: ""),
            selectedMappedSettingPartner: state.mappedSettingPartners,
          );
        } else if (state is SettingsErrorState) {
          return _DataAndNoDataStateHolder(
            mappedSettingPartners: state.partners,
            searchResult: const SearchResult(searchQuery: ""),
            selectedMappedSettingPartner: state.mappedSettingPartners,
          );
        } else if (state is SettingsLoadingState) {
          return _DataAndNoDataStateHolder(
            mappedSettingPartners: state.partners,
            searchResult: const SearchResult(searchQuery: ""),
            selectedMappedSettingPartner: state.mappedSettingPartners,
          );
        } else if (state is SettingsNoDataState) {
          return _DataAndNoDataStateHolder(
            mappedSettingPartners: state.partners,
            searchResult: const SearchResult(searchQuery: ""),
            selectedMappedSettingPartner: state.mappedSettingPartners,
          );
        }

        return Container();
      },
    );
  }
}

class _DataAndNoDataStateHolder extends StatelessWidget {
  final List<MappedSettingPartners> mappedSettingPartners;
  final SearchResult searchResult;
  final MappedSettingPartners? selectedMappedSettingPartner;

  const _DataAndNoDataStateHolder({
    required this.mappedSettingPartners,
    required this.searchResult,
    this.selectedMappedSettingPartner,
  });

  @override
  Widget build(BuildContext context) {
    if (mappedSettingPartners.isEmpty) {
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BottomNavBar(),
          )
        ],
      );
    } else {
      return MappedSettingsStateView(
        mappedSettingPartners: mappedSettingPartners,
        searchResult: searchResult,
        selectedMappedSettingPartner: selectedMappedSettingPartner,
      );
    }
  }
}
