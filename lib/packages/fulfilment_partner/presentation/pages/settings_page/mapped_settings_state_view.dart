import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation/widget/bottom_nav_bar.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/mapped_settings_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/settings_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/utils/custom_dropdown/custom_drop_down.dart';

class MappedSettingsStateView extends StatefulWidget {
  final List<MappedSettingPartners> mappedSettingPartners;
  final SearchResult searchResult;
  final MappedSettingPartners? selectedMappedSettingPartner;

  const MappedSettingsStateView({
    super.key,
    required this.mappedSettingPartners,
    required this.searchResult,
    required this.selectedMappedSettingPartner,
  });

  @override
  State<MappedSettingsStateView> createState() =>
      _MappedSettingsStateViewState();
}

class _MappedSettingsStateViewState extends State<MappedSettingsStateView> {
  final OverlayPortalController tooltipController = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hideOverlay,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFE4E4E4),
                        ),
                      ),
                      child: CustomDropDown(
                        items: widget.mappedSettingPartners,
                        searchResult: widget.searchResult,
                        selectedPartner: widget.selectedMappedSettingPartner,
                        tooltipController: tooltipController,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AnimatedOpacity(
                      opacity:
                          widget.selectedMappedSettingPartner != null ? 1.0 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: _MappedWithCheckBoxUi(
                          title: context.localizedString.allowViewOrderTitle,
                          content:
                              context.localizedString.allowViewOrderContent,
                          isChecked: widget.selectedMappedSettingPartner
                                  ?.isShowViewOrder ??
                              false,
                          id: widget.selectedMappedSettingPartner
                                  ?.fulfillmentPartnerId ??
                              -1,
                          isFromViewOrder: true),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    AnimatedOpacity(
                      opacity:
                          widget.selectedMappedSettingPartner != null ? 1.0 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: _MappedWithCheckBoxUi(
                        title: context.localizedString.createOrderTitle,
                        content: context.localizedString.createOrderContent,
                        isChecked: widget.selectedMappedSettingPartner
                                ?.isShowPlaceOrder ??
                            false,
                        id: widget.selectedMappedSettingPartner
                                ?.fulfillmentPartnerId ??
                            -1,
                        isFromViewOrder: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: AnimatedOpacity(
              opacity: widget.selectedMappedSettingPartner != null ? 1.0 : 0,
              duration: const Duration(milliseconds: 300),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  onPressed: () {
                    if (widget.selectedMappedSettingPartner != null) {
                      getIt<SettingsCubit>().savedMappedSettingsUseCase(
                          widget.selectedMappedSettingPartner!);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(context.localizedString.save),
                ),
              ),
            ),
          ),
          const BottomNavBar()
        ],
      ),
    );
  }

  void hideOverlay() {
    try {
      tooltipController.hide();
    } finally {}
  }
}

class _MappedWithCheckBoxUi extends StatelessWidget {
  final String title;
  final String content;
  final bool isChecked;
  final int id;
  final bool isFromViewOrder;

  const _MappedWithCheckBoxUi({
    required this.title,
    required this.content,
    required this.isChecked,
    required this.id,
    required this.isFromViewOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFD8EDF6)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 4, bottom: 8, right: 8),
            color: const Color(0xFFD8EDF6),
            child: Row(
              children: [
                Checkbox(
                  side: const BorderSide(color: Colors.orange, width: 2.0),
                  activeColor: Colors.orange,
                  checkColor: Colors.white,
                  value: isChecked,
                  onChanged: (isChange) {
                    getIt<SettingsCubit>()
                        .checkedAndUncheckedOrder(id, isFromViewOrder);
                  },
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(color: Color(0xFF568092)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(content),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
