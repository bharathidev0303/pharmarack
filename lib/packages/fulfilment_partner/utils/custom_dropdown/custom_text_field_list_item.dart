import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/settings_cubit.dart';

import 'custom_drop_down.dart';

class CustomTextFieldListItem extends StatelessWidget {
  final String item;
  final String searchQuery;
  final bool isSelected;
  final bool isLast;
  final int id;
  final Function onTap;

  const CustomTextFieldListItem({
    super.key,
    required this.item,
    required this.isSelected,
    required this.isLast,
    required this.searchQuery,
    required this.id,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF347bb7) : null,
        border: Border(
          bottom: BorderSide(
              color: !isLast ? const Color(0xFFF0F0F0) : Colors.transparent),
        ),
      ),
      height: itemHeight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              getIt<SettingsCubit>().selectSearchSettings(
                  id, context.localizedString.selectFulfillmentPartner);
              onTap();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      item,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black),
                    ),
                  ),
                  Icon(
                    isSelected ? Icons.check : null,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
