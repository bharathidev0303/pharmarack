import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';

class PhoneNumberRichText extends StatelessWidget {
  final String phoneNumber;
  final Color textColor;
  final void Function()? onViewTap;

  const PhoneNumberRichText(
      {super.key,
      required this.phoneNumber,
      required this.textColor,
      this.onViewTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        key: const Key('phone number tap'),
        child: Row(
          children: [
            AppAssets.svg.icCallBlue.svg(),
            const SizedBox(width: 2),
            Text(phoneNumber,
                style: AppTextStyles.textStyleBlack15w400(textColor))
          ],
        ),
        onTap: () {
          onViewTap!();
        });
  }
}
