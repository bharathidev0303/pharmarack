import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/request_cubit.dart';

class RequestItem extends StatelessWidget {
  final Request request;

  const RequestItem({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 5,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFFD1E5E9), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.lightBlue.withOpacity(0.2),
              border: Border.all(color: Colors.lightBlue.withOpacity(0.2)),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Checkbox(
                  value: request.isSelected,
                  onChanged: (value) {
                    getIt
                        .get<RequestCubit>()
                        .markRequestCheck(request.copyWith(isSelected: value));
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    request.fulfillmentPartnerName ?? "",
                    style: const TextStyle(color: Color(0xFF456a7b)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "${context.localizedString.mobileNo}: ${request.mobileNumber ?? ""}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: Text(
                            "${context.localizedString.address}: ${request.address ?? ""}",
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                CachedNetworkImage(
                  imageUrl: request.profileImagePath ?? "",
                  fit: BoxFit.cover,
                  width: 90,
                  height: 120,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
