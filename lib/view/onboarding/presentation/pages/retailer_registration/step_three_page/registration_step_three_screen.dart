import 'package:flutter/cupertino.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/retailer_registration/step_three_page/step_three_mobile_screen.dart';

class RetailerRegistrationStepThreeScreen
    extends BasePage<StepThreeScreenState> {
  const RetailerRegistrationStepThreeScreen({super.key});

  @override
  createState() {
    return StepThreeScreenState();
  }
}

class StepThreeScreenState extends BaseStatefulPage {
  @override
  void initState() {
    super.initState();
    initRetailerRegistrationStepThreeDI();
    initReferralTAndC();
    // initUpdateRetailerProfile();
  }

  @override
  Widget buildView(BuildContext context) {
    return const StepThreeMobileScreen();
  }
}
