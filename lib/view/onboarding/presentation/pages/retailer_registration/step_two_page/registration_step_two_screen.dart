import 'package:flutter/cupertino.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/retailer_registration/step_two_page/step_two_mobile_screen.dart';

class RetailerRegistrationStepTwoScreen extends BasePage<StepTwoScreenState> {
  const RetailerRegistrationStepTwoScreen({super.key});

  @override
  createState() {
    return StepTwoScreenState();
  }
}

class StepTwoScreenState extends BaseStatefulPage {
  @override
  void initState() {
    super.initState();
    initRetailerRegistrationStepTwoDI();
  }

  @override
  Widget buildView(BuildContext context) {
    return const StepTwoMobileScreen();
  }
}
