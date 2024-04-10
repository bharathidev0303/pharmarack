
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmarack/gen/assets.gen.dart';

import '../../dls/color/app_colors.dart';

class PrimaryCheckBox extends StatefulWidget {
  final Text? checkBoxText;
  final Text? checkBoxUnselectedText;
  final bool isChecked;
  final Function(bool isChecked)? onChanged;

  const PrimaryCheckBox(
      {this.checkBoxText,
      this.checkBoxUnselectedText,
      required this.isChecked,
      this.onChanged,
      super.key});

  @override
  State<StatefulWidget> createState() => PrimaryCheckBoxState();
}

class PrimaryCheckBoxState extends State<PrimaryCheckBox> {
  bool _isChecked = false;

  PrimaryCheckBoxState();

  _onChanged(bool icChecked) {
    setState(() {
      _isChecked = icChecked;
    });
    widget.onChanged!(icChecked);
  }

  @override
  void initState() {
    _isChecked = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _isChecked = widget.isChecked;
    return InkWell(
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      onTap: () {
        _onChanged(!_isChecked);
      },
      child: Row(children: [
        _isChecked
            ? (widget.checkBoxText ?? const SizedBox.shrink())
            : (widget.checkBoxUnselectedText ??
                (widget.checkBoxText ?? const SizedBox.shrink())),
        const SizedBox(width: 5.0),
        SvgPicture.asset(
            _isChecked
                ? AppAssets.svg.checkBoxSelected.path
                : AppAssets.svg.checkBoxUnselected.path,
            width: 18,
            height: 18,
            package: 'core_flutter')
      ]),
    );
  }
}
