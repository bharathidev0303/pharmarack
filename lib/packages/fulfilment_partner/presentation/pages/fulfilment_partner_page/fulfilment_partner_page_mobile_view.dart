import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/side_navigation/widget/bottom_nav_bar.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/assset_constants.dart';

/// This class [FulfilmentPartnerPageMobileView] which specifically used to render Mobile UI
class FulfilmentPartnerPageMobileView extends StatelessWidget {
  const FulfilmentPartnerPageMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _FulfilmentIconButton(
                  buttonName: context.localizedString.mapping,
                  assetImagePath: AssetConstants.mappingImage,
                  onIconClick: () => Navigator.pushNamed(context, "/mapping"),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: _FulfilmentIconButton(
                  buttonName: context.localizedString.settings,
                  assetImagePath: AssetConstants.settingsImage,
                  onIconClick: () => Navigator.pushNamed(context, "/settings"),
                ),
              )
            ],
          ),
        ),
        const BottomNavBar()
      ],
    );
  }
}

class _FulfilmentIconButton extends StatelessWidget {
  final String buttonName;
  final String assetImagePath;
  final void Function() onIconClick;

  const _FulfilmentIconButton({
    required this.buttonName,
    required this.assetImagePath,
    required this.onIconClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: onIconClick,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage(assetImagePath,
                    package: AssetConstants.assetPackageName),
                width: 40,
                height: 40,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 26.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Text(
                  textAlign: TextAlign.center,
                  buttonName,
                  style: const TextStyle(color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
