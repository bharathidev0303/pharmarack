import 'package:flutter/cupertino.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/retailer_registration/step_one_page/step_one_mobile_screen.dart';

class RetailerRegistrationStepOneScreen extends BasePage<StepOneScreenState> {
  const RetailerRegistrationStepOneScreen({super.key});

  @override
  createState() {
    return StepOneScreenState();
  }
}

class StepOneScreenState extends BaseStatefulPage {
  @override
  void initState() {
    initRetailerRegistrationDI();
    super.initState();
  }

  @override
  void dispose() {
    unregisterAllRegistrationDI();
    super.dispose();
  }

  @override
  Widget buildView(BuildContext context) {
    return const StepOneMobileScreen();
  }
}
