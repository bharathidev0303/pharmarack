import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:pharmarack/packages/core_flutter/common_model/common_success_dialog_info_model.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import 'package:pharmarack/view/onboarding/utils/constants.dart';

class OperationsPage extends StatefulWidget {
  const OperationsPage({super.key});

  @override
  State<OperationsPage> createState() => _OperationsPageState();
}

class _OperationsPageState extends State<OperationsPage> {
  int _current = 0;
  @override
  void initState() {
    super.initState();
    if (onboardingDI.isRegistered<CommonSuccessDialogInfoModel>(
        instanceName: OnboardingConstants.showDialogDiConstant)) {
      final successDialogInfo = onboardingDI<CommonSuccessDialogInfoModel>(
          instanceName: OnboardingConstants.showDialogDiConstant);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showSuccessDialog(
          context,
          title: successDialogInfo.title,
          subtitle: successDialogInfo.subtitle,
        );
      });
      onboardingDI.unregister<CommonSuccessDialogInfoModel>(
          instanceName: OnboardingConstants.showDialogDiConstant);
    }
  }

  @override
  void dispose() {
    super.dispose();
    CommonDialogs.closeCommonDialog(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        // if (didPop) {
        //   return;
        // }
        // showExitDialog(context);
      },
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned.fill(
                child:
                    AppAssets.png.onBoardBgImage.image(width: 160, height: 90),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child:
                          AppAssets.png.prNewLogo.image(width: 160, height: 90),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  Stack(
                    alignment: const Alignment(1.0, -0.3),
                    children: [
                      CarouselSlider(
                        items: const [
                          Expanded(child: BoxesWithContentOne()),
                          Expanded(child: BoxesWithContentTwo())
                        ],
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                          viewportFraction: 1,
                          aspectRatio: 1.2,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: ([1, 2]).asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _current = entry.key;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 7.0,
                                height: 7.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  color: _current == entry.key
                                      ? Colors.blue
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      bottom: 20.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.redErrorTextColor,
                          borderRadius: BorderRadius.circular(
                              5.0), // Adding border radius
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 16.0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: AppTextStyles.searchHintTextStyleW400(
                                color: AppColors.white,
                              ).copyWith(
                                height: 1.5,
                              ),
                              children: const [
                                TextSpan(
                                  text:
                                      'Your account will be activated within 24 working hours. Please call on ',
                                ),
                                TextSpan(
                                  text: '020-67660011',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // You can add more styles if needed
                                  ),
                                ),
                                TextSpan(
                                  text: ' from ',
                                ),
                                TextSpan(
                                  text: 'Mon-Sat',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // You can add more styles if needed
                                  ),
                                ),
                                TextSpan(
                                  text: ' between 9.30 am to 6.30 pm.',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BoxesWithContentOne extends StatelessWidget {
  const BoxesWithContentOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = const Color(0xFF1439BB); // Define the text color
    return Center(
      child: SizedBox(
        height: 400, // Set a fixed height for the content
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 45),
              child: Text(
                textAlign: TextAlign.center,
                'We are India`s \nlargest e-B2B commerce \nplatform',
                style: AppTextStyles.title24Black().copyWith(
                  height: 1.2,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBox(textColor, '20', 'States'),
                const SizedBox(width: 10),
                _buildBox(textColor, '110', 'Cities'),
                const SizedBox(width: 10),
                _buildBox(textColor, '12k', 'Stockists'),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildBox(textColor, '3L', 'SKU’s'),
                const SizedBox(width: 10),
                _buildBox(textColor, '2.5L', 'Chemists'),
                const SizedBox(width: 10),
                _buildBox(textColor, '6K', 'Corporates'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BoxesWithContentTwo extends StatelessWidget {
  const BoxesWithContentTwo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 45),
              child: Text(
                textAlign: TextAlign.center,
                'We are supported by the \nindustry to digitally enable \ntrade in India',
                style: AppTextStyles.title24Black(),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Align(
                alignment: Alignment.topCenter,
                child: AppAssets.png.brands.image(width: 330, height: 120),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildBox(Color textColor, String count, String label) {
  return Container(
    width: 99,
    height: 75,
    decoration: BoxDecoration(
      border: Border.all(
        color: AppColors.primaryColor, // Border color
        width: 0.2, // Border width
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$count+',
              style: AppTextStyles.style16W400Black(color: AppColors.blueDark)
                  .copyWith(height: 1.8)),
          Text(label, style: AppTextStyles.style14W400),
        ],
      ),
    ),
  );
}
