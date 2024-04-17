import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';

class OfferText extends StatelessWidget {
  final String name;
  final String value;
  final int offersCount;

  const OfferText({
    super.key,
    required this.name,
    required this.value,
    required this.offersCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: context.textStyles.paragraph2Regular?.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        const SizedBox(width: 4),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: context.colors.offers,
          ),
          height: 18,
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Center(
            child: Text(
              value,
              style: context.textStyles.header12Medium?.copyWith(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        offersCount > 1
            ? Text(
                " +${offersCount - 1} offers",
                style: context.textStyles.header12Medium?.copyWith(
                    color: context.colors.offers,
                    overflow: TextOverflow.ellipsis),
              )
            : Container()
      ],
    );
  }
}
