
import 'package:flutter/cupertino.dart';

import 'package:pharmarack/packages/core_flutter/core/ui/base_view.dart';
import 'package:pharmarack/view/onboarding/presentation/pages/retailer_registration/landing_page/landing_screen_mobile_view.dart';

class RetailerRegistrationLandingScreen extends BasePage<LandingScreenState> {
  const RetailerRegistrationLandingScreen({super.key});

  @override
  createState() {
    return LandingScreenState();
  }
}

class LandingScreenState extends BaseStatefulPage {
  @override
  Widget buildView(BuildContext context) {
    return const LandingScreenMobileView();
  }
}
