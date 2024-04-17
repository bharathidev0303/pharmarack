import 'package:flutter/widgets.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String errorMessage;
  const ErrorMessageWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          AppAssets.svg.icInfoCircle.svg(
            height: 12,
            width: 12,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              errorMessage,
              style: AppTextStyles.style11W400Red(),
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
