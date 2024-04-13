import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';

import '../../dls/color/app_colors.dart';

class CustomSearchBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchState();
  }

  final Function(String) onSearchTextChange;
  final String hintText;
  final double width;

  const CustomSearchBar(
      {super.key,
      required this.width,
      required this.onSearchTextChange,
      required this.hintText});
}

class SearchState extends State<CustomSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  String changedText = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 40,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        textAlign: TextAlign.left,
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "  ${widget.hintText}",
          contentPadding:
              const EdgeInsets.only(left: 40, right: 10, top: 10, bottom: 10),
          hintStyle: AppTextStyles.searchHintTextStyle15W400Black(),
          prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AppAssets.svg.icSearchCustom.svg()),
          prefixIconConstraints:
              const BoxConstraints(minHeight: 30, minWidth: 30),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.dividerColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(color: AppColors.dividerColor)),
        ),
        onChanged: (text) {
          widget.onSearchTextChange(text);
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
