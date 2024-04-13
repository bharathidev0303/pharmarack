import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';

class DropDownListItem extends StatelessWidget {
  final String? title;
  const DropDownListItem({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          title != null
              ? Expanded(
                  flex: 10,
                  child: Text(
                    title?.trim() ?? '',
                    style: AppTextStyles.style12W700Black(),
                    maxLines: 1,
                  ),
                )
              : const SizedBox.shrink(),
          Expanded(
            flex: 1,
            child: AppAssets.svg.blueArrowUpRight.svg(height: 20, width: 20),
          ),
        ],
      ),
    );
  }
}
