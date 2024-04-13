import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/mapped_settings_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/mapped_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/search_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/pages/mapping_page/mapped_tab/mapped_settings_request_item.dart';
import 'package:pharmarack/packages/fulfilment_partner/utils/common_progress_dialog.dart';

class MappedSettingDataView extends StatefulWidget {
  final List<MappedSettingPartners> partners;

  const MappedSettingDataView({super.key, required this.partners});

  @override
  State<MappedSettingDataView> createState() => _MappedSettingDataViewState();
}

class _MappedSettingDataViewState extends State<MappedSettingDataView> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16, top: 8.0, bottom: 16.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              constraints: const BoxConstraints(maxHeight: 42, minHeight: 42),
              hintStyle:
                  TextStyle(color: Colors.grey.withOpacity(0.6), fontSize: 16),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.clear();
                  getIt<SearchCubit>().clear();
                  getIt<MappedCubit>().searchMappedSettingsRequest();
                },
                icon: const Icon(Icons.close),
              ),
              hintText: context.localizedString.search,
              enabledBorder: searchBorder(
                color: Colors.grey,
              ),
              focusedBorder: searchBorder(
                color: Colors.blue,
              ),
              border: searchBorder(
                color: Colors.grey,
              ),
              isDense: true,
            ),
            onChanged: (str) {
              getIt<SearchCubit>().updateSearchQuery(str);
              getIt<MappedCubit>().searchMappedSettingsRequest();
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.withOpacity(0.2),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  context.localizedString.fulfillmentPartnerName,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Text(
                  context.localizedString.contactNo,
                  textAlign: TextAlign.end,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.partners.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemBuilder: (ctx, index) => MappedSettingsRequestItem(
              mappedSettingPartner: widget.partners[index],
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
