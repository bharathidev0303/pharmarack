import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/text_input_field.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/primary_button.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/search_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/distributor_store_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/send_request_mapping_cubit.dart';

void showStockiestNonMappedDialog(
    BuildContext context, DistributorStoreModel model) {
  showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        iconPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        buttonPadding: EdgeInsets.zero,
        content: NonMappedRequestSendDialog(
          distributorStoreModel: model,
        ),
      );
    },
  );
}

class NonMappedRequestSendDialog extends StatelessWidget {
  final DistributorStoreModel distributorStoreModel;
  final isRequestSent = [false];

  NonMappedRequestSendDialog({
    super.key,
    required this.distributorStoreModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    distributorStoreModel.storeName ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: AppTextStyles.searchHintTextStyleW400().copyWith(
                      fontSize: 16,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: AppAssets.png.close.image(
                    width: 24,
                    height: 24,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Visibility(
              visible: (distributorStoreModel.address ?? "").isNotEmpty,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppAssets.png.mapPin.image(
                    width: 12,
                    height: 12,
                  ),
                  Expanded(
                    child: Text(
                      (distributorStoreModel.address ?? ""),
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.searchHintTextStyleW400().copyWith(
                        fontSize: 11,
                        color: AppColors.searchHintColor,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextInputField(
              title: context.localizedString.enterPartyCode,
              informationText:
                  context.localizedString.sendRequestWithoutPartyCode,
              onChanged: (text) {
                getIt<SearchCubit>(instanceName: "partyCode")
                    .updateSearchQuery(text);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            PrimaryButton(
              text: context.localizedString.sendRequest,
              onPressed: () {
                if (!isRequestSent.first) {
                  isRequestSent[0] = true;
                  getIt<SendRequestMappingCubit>().sendStoreRequestMapping(
                    getIt<RetailerInfoEntity>(),
                    distributorStoreModel,
                    getIt<SearchCubit>(instanceName: "partyCode").state,
                  );
                  Navigator.pop(context);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
