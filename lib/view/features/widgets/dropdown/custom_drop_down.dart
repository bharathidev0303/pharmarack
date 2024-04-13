import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final Widget child;
  final Offset position;

  const CustomDropDown(
      {super.key, required this.child, required this.position});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          child: Material(child: child)),
    );
  }
}
