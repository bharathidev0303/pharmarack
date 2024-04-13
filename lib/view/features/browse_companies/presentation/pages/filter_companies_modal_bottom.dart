import 'package:flutter/material.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_buttons/secondary_button.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/primary_button.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

class FilterCompaniesModalBottom extends StatefulWidget {
  final List<String> therapies;

  const FilterCompaniesModalBottom({
    super.key,
    required this.therapies,
  });

  @override
  State<FilterCompaniesModalBottom> createState() =>
      _FilterCompaniesModalBottomState();
}

class _FilterCompaniesModalBottomState
    extends State<FilterCompaniesModalBottom> {
  late List<String> therapies;
  List<String> selectedTherapies = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    therapies = [
      context.localizedString.painRelief,
      context.localizedString.cardio,
      context.localizedString.vitamins,
      context.localizedString.personalCare,
    ];
    selectedTherapies.clear();
    selectedTherapies.addAll(widget.therapies);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
      decoration: const ShapeDecoration(
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
      ),
      child: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                key: const Key("companiesDropdownArrow"),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: AppAssets.svg.downBroadArrow.svg(),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                context.localizedString.filter,
                style: context.textStyles.header4Medium?.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(
                  context.localizedString.therapy,
                  style: context.textStyles.header8Medium?.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 11),
              Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        BorderSide(width: 1, color: context.colors.inputField!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _TherapyRow(
                        icon: selectedTherapies.isEmpty
                            ? AppAssets.svg.tickSelected
                            : AppAssets.svg.tickUnselected,
                        label: context.localizedString.all,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: therapies.length,
                        itemBuilder: (ctx, index) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 1000),
                            child: selectedTherapies.contains(therapies[index])
                                ? _TherapyRow(
                                    icon: AppAssets.svg.tickSelected,
                                    label: therapies[index],
                                    onClick: () {
                                      updateTherapy(therapies[index], true);
                                    },
                                  )
                                : _TherapyRow(
                                    icon: AppAssets.svg.tickUnselected,
                                    label: therapies[index],
                                    onClick: () {
                                      updateTherapy(therapies[index], false);
                                    },
                                  ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      text: context.localizedString.clearFilters,
                      onClick: () {
                        selectedTherapies.clear();
                        Navigator.pop(context, selectedTherapies);
                      },
                    ),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: PrimaryButton(
                      text: context.localizedString.apply,
                      onPressed: () {
                        Navigator.pop(context, selectedTherapies);
                      },
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  void updateTherapy(String therapy, bool shouldDelete) {
    setState(() {
      if (shouldDelete) {
        selectedTherapies.remove(therapy);
      } else {
        selectedTherapies.add(therapy);
      }
    });
  }
}

class _TherapyRow extends StatelessWidget {
  final SvgGenImage icon;
  final String label;
  final Function? onClick;

  const _TherapyRow({
    required this.icon,
    required this.label,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key("browseCompanyItem$label"),
      onTap: () {
        onClick?.call();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            icon.svg(
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                label,
                style: context.textStyles.paragraph2Regular?.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
