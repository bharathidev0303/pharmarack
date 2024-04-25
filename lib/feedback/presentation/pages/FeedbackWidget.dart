import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/feedback/di/feedback_provider.dart';
import 'package:pharmarack/feedback/presentation/cubit/feedback_screen_cubit.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/primary_button.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/dashboard/order_history/di/order_history_provider.dart';

final distributorStores = GetIt.instance<RetailerInfoEntity>().stores ?? [];

class FeedbackOption {
  final String name;
  final List<String> options;

  FeedbackOption(this.name, this.options);
}

class FeedBackWidget extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedBackWidget> {
  final List<LoginResponseStores> mappedDistributors =
      distributorStores.where((store) => store.ismapped == 1).toList();

  late FeedbackScreenCubit feedbackCubit;
  String? selectedFeedbackType;
  String? selectedFeedbackOption;
  String? selectedStore = null;
  String? suggestionNote = ''; // Variable to store the remarks/feedback

  List<FeedbackOption> feedbackOptions = [
    FeedbackOption('Login/Activation', ['Pharmarack']),
    FeedbackOption('Mapping', ['Pharmarack']),
    FeedbackOption('Order',
        ['Pharmarack', 'Distributor', 'Both (Pharmarack / Distributor)']),
    FeedbackOption('Scheme/Quantity',
        ['Pharmarack', 'Distributor', 'Both (Pharmarack / Distributor)']),
    FeedbackOption('Query/Complaint', ['Pharmarack']),
    FeedbackOption('Stock/Product',
        ['Pharmarack', 'Distributor', 'Both (Pharmarack / Distributor)']),
    FeedbackOption('Suggestion',
        ['Pharmarack', 'Distributor', 'Both (Pharmarack / Distributor)']),
  ];

  @override
  void initState() {
    unregisterFeedbackDI();
    initFeedbackDependency();
    feedbackCubit = getIt<FeedbackScreenCubit>();
    super.initState();
  }

  @override
  void dispose() {
    unregisterFeedbackDI();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.appBarColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: AppColors
                    .blueButtonColor, // Set the color of the back button to blue
              ),
              title: Text(
                context.localizedString.feedback,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.cardTitleColor),
                            'We value your feedback. Please share your feedback below.'),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: AppColors
                                .searchBarBackGroundColor, // Set the background color for the selected value
                            borderRadius: BorderRadius.circular(
                                10), // Optionally, set border radius
                          ),
                          child: DropdownButton<String>(
                            underline:
                                const SizedBox(), // Set underline to SizedBox to remove it
                            isExpanded: true,
                            hint: const Text(
                              'Select Feedback Type',
                              style: TextStyle(
                                  color: AppColors.searchHintColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            icon: const Icon(
                              Icons.expand_more,
                              color: AppColors.blueButtonColor,
                              size: 24,
                            ),
                            value: selectedFeedbackType,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedFeedbackType = newValue;
                                selectedFeedbackOption = null;
                                selectedStore = null;
                                suggestionNote = '';
                              });
                            },
                            items: feedbackOptions
                                .map<DropdownMenuItem<String>>(
                                    (FeedbackOption option) {
                              return DropdownMenuItem<String>(
                                value: option.name,
                                child: Text(
                                  option.name,
                                  style: const TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.0,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (selectedFeedbackType != null)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors
                                  .searchBarBackGroundColor, // Set the background color for the selected value
                              borderRadius: BorderRadius.circular(
                                  10), // Optionally, set border radius
                            ),
                            child: DropdownButton<String>(
                              underline: const SizedBox(),
                              isExpanded: true,
                              hint: const Text(
                                'Select Feedback Option',
                                style: TextStyle(
                                    color: AppColors.searchHintColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              icon: const Icon(
                                Icons.expand_more,
                                color: AppColors.blueButtonColor,
                                size: 24,
                              ),
                              value: selectedFeedbackOption,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedFeedbackOption = newValue;
                                  selectedStore = null;
                                  suggestionNote = '';
                                });
                              },
                              items: feedbackOptions
                                  .firstWhere((option) =>
                                      option.name == selectedFeedbackType)
                                  .options
                                  .map<DropdownMenuItem<String>>(
                                      (String option) {
                                return DropdownMenuItem<String>(
                                  value: option,
                                  child: Text(
                                    option,
                                    style: const TextStyle(
                                      color: AppColors.primaryTextColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        const SizedBox(height: 20),
                        if (selectedFeedbackOption != null &&
                            selectedFeedbackOption != 'Pharmarack')
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors
                                  .searchBarBackGroundColor, // Set the background color for the selected value
                              borderRadius: BorderRadius.circular(
                                  10), // Optionally, set border radius
                            ),
                            child: DropdownButton<String>(
                              underline: const SizedBox(),
                              isExpanded: true,
                              hint: const Text(
                                'Select Store',
                                style: TextStyle(
                                    color: AppColors.searchHintColor,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              icon: const Icon(
                                Icons.expand_more,
                                color: AppColors.blueButtonColor,
                                size: 24,
                              ),
                              value: selectedStore,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedStore = newValue;
                                  suggestionNote = '';
                                });
                              },
                              items: mappedDistributors
                                  .map<DropdownMenuItem<String>>(
                                      (LoginResponseStores store) {
                                return DropdownMenuItem<String>(
                                  value: store.storeId.toString(),
                                  child: Text(
                                    store.storeName ?? '',
                                    style: const TextStyle(
                                      color: AppColors.primaryTextColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        const SizedBox(height: 20),
                        selectedStore != null ||
                                selectedFeedbackOption == 'Pharmarack'
                            ? TextField(
                                style: const TextStyle(
                                    color: AppColors.primaryTextColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: 'Tell us your concern',
                                  hintStyle: TextStyle(
                                      color: AppColors.searchHintColor,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight
                                          .w500), // Set the hint color
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors
                                            .searchBarBackGroundColor), // Remove the border when not focused
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors
                                            .searchBarBackGroundColor), // Remove the border when not focused
                                  ),
                                  fillColor: AppColors.searchBarBackGroundColor,
                                ),
                                maxLines: 3, // Allow unlimited lines
                                onChanged: (String value) {
                                  setState(() {
                                    suggestionNote = value;
                                    // Store the note text
                                  });
                                },
                              )
                            : const Text(''),
                      ],
                    ),
                  ),
                ),
                //const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      suggestionNote != ''
                          ? Expanded(
                              child: PrimaryButton(
                                text: context.localizedString
                                    .feedbackRequestDialogButtonTitle
                                    .toUpperCase(),
                                width: MediaQuery.of(context).size.width * 0.31,
                                onPressed: () {
                                  String feedbackTo = '';
                                  if (selectedFeedbackOption == 'Pharmarack') {
                                    feedbackTo = 'P';
                                  } else if (selectedFeedbackOption ==
                                      'Distributor') {
                                    feedbackTo = 'D';
                                  } else if (selectedFeedbackOption ==
                                      'Both (Pharmarack / Distributor)') {
                                    feedbackTo = 'B';
                                  }

                                  feedbackCubit.saveFeedback(
                                    feedbackType: selectedFeedbackType,
                                    remarks: suggestionNote,
                                    storeId: selectedStore,
                                    feedbackTo: feedbackTo,
                                  );

                                  Navigator.of(context).pop();
                                  showSuccessDialog(
                                    context,
                                    title: context.localizedString
                                        .feedbackDialogSuccessHeader,
                                    subtitle: context.localizedString
                                        .feedbackDialogSuccessBody,
                                  );
                                },
                              ),
                            )
                          //
                          : const SizedBox.shrink(),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
