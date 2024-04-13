import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';

class PlusButton extends StatelessWidget {
  final Function() onTap;
  const PlusButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () => onTap(),
        child: AppAssets.svg.plusBotton.svg(height: 32, width: 32),
      ),
    );
  }
}
