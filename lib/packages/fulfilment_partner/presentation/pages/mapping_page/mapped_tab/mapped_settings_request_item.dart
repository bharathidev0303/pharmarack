import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/utils/url_launcher_utils.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/mapped_settings_model.dart';

class MappedSettingsRequestItem extends StatelessWidget {
  final MappedSettingPartners mappedSettingPartner;

  const MappedSettingsRequestItem({
    super.key,
    required this.mappedSettingPartner,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                mappedSettingPartner.fulfillmentPartnerName ?? "",
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 14),
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () =>
                    launchMobileNumber(mappedSettingPartner.mobileNumber ?? ""),
                child: Text(
                  mappedSettingPartner.mobileNumber ?? "",
                  textAlign: TextAlign.end,
                  style:
                      const TextStyle(color: Colors.blueAccent, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
