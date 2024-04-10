
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/view/onboarding/domain/model/retailer_registration/pincode_data.dart';

class RegionSelectionDialog {
  static showRegionDialog(
      {required BuildContext parentContext,
      required List<RegistrationDataModel> regionSuggestions,
      required String title,
      required Function(RegistrationDataModel) onValueSelected,
      bool barrierDismissible = true}) {
    /// Following condition check if any pop-up is shown on current screen
    /// and avoids showing dialog
    if (ModalRoute.of(parentContext)?.isCurrent == true) {
      showDialog(
          context: parentContext,
          builder: (buildContext) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Material(
                child: Container(
                  width: MediaQuery.of(parentContext).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AppTextStyles.style14W500Black(),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ListView.builder(
                              itemCount: regionSuggestions.length,
                              shrinkWrap: true,
                              itemBuilder: (buildContext, index) {
                                return InkWell(
                                  onTap: () {
                                    onValueSelected(regionSuggestions[index]);
                                    Navigator.pop(parentContext);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Text(
                                        regionSuggestions[index].regionName ??
                                            ''),
                                  ),
                                );
                              })
                        ],
                      ),
                    ),
                  ),
                  // child: ,
                ),
              ),
            ));
          });
    }
  }
}
