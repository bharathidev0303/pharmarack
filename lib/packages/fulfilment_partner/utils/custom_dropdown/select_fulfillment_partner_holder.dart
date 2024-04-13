import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/mapped_settings_model.dart';

class SelectFulfillmentPartnerHolder extends StatelessWidget {
  final MappedSettingPartners? selectedPartner;

  const SelectFulfillmentPartnerHolder({super.key, this.selectedPartner});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.only(left: 16.0, right: 8.0, top: 8.0, bottom: 8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFCBCBCB),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              selectedPartner != null
                  ? (selectedPartner?.fulfillmentPartnerName ?? "")
                  : context.localizedString.selectFulfillmentPartner,
            ),
          ),
          const Icon(Icons.arrow_drop_down_sharp)
        ],
      ),
    );
  }
}
