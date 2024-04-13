import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/dialog_card.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/text_input_field.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

class SendStoreMappingRequestDialogCard extends StatefulWidget {
  final String storeName;
  final String address;
  final Function(String partyCode) onSendRequest;

  const SendStoreMappingRequestDialogCard({
    super.key,
    required this.storeName,
    required this.address,
    required this.onSendRequest,
  });

  @override
  State<SendStoreMappingRequestDialogCard> createState() =>
      _SendStoreMappingRequestDialogCardState();
}

class _SendStoreMappingRequestDialogCardState
    extends State<SendStoreMappingRequestDialogCard> {
  final TextEditingController _partyCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DialogCard(
      title: widget.storeName,
      body: Column(
        children: [
          Visibility(
            visible: widget.address.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  AppAssets.png.mapPin.image(
                    width: 12,
                    height: 12,
                  ),
                  Expanded(
                    child: Text(
                      widget.address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.style11W400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextInputField(
            title: context.localizedString.enterPartyCode,
            informationText:
                context.localizedString.sendRequestWithoutPartyCode,
            controller: _partyCodeController,
          ),
          const SizedBox(height: 10)
        ],
      ),
      actionText: context.localizedString.sendRequest.toUpperCase(),
      onClickAction: () => widget.onSendRequest(_partyCodeController.text),
    );
  }
}
