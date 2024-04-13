import 'package:flutter/material.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/mapped_settings_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/utils/common_progress_dialog.dart';
import 'package:pharmarack/packages/fulfilment_partner/utils/custom_dropdown/custom_text_field_list_item.dart';

import 'custom_drop_down.dart';

class OverlayWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final TextEditingController controller;
  final List<MappedSettingPartners> list;
  final SearchResult searchResult;
  final Function onTap;

  const OverlayWidget({
    super.key,
    this.width,
    this.height,
    required this.controller,
    required this.list,
    required this.searchResult,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width ?? 200,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color(0xFFD8D8D8),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0xFFEFEFEF),
            blurRadius: 32,
            offset: Offset(0, 20),
            spreadRadius: -8,
          ),
        ],
      ),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 8.0, bottom: 4.0),
            child: TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
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
                // Added this
                contentPadding: const EdgeInsets.all(9),
              ),
            ),
          ),
          SizedBox(
            width: width,
            height: height,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: list.length,
              itemBuilder: (ctx, index) {
                return CustomTextFieldListItem(
                  item: list[index].fulfillmentPartnerName ?? "",
                  isSelected: list[index].isSelected,
                  isLast: index == (list.length - 1),
                  searchQuery: searchResult.searchQuery,
                  id: list[index].fulfillmentPartnerId ?? -1,
                  onTap: () {
                    onTap();
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
