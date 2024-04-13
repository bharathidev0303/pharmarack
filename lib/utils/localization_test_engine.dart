import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/localization/app_localizations.dart';

class LocalizationTestEngine extends StatelessWidget {
  final Widget child;

  const LocalizationTestEngine({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
      ],
      home: child,
    );
  }
}
