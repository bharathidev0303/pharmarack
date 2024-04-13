import 'package:flutter/material.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/endpoints_constants/fulfilment_partner_options.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/request_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/search_cubit.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/pages/mapping_page/request_tab/request_item.dart';
import 'package:pharmarack/packages/fulfilment_partner/utils/common_progress_dialog.dart';

class DataFoundAndFilterState extends StatefulWidget {
  final List<Request> requests;
  final bool isAnyRequestChecked;
  final bool shouldDisplaySearchBox;

  const DataFoundAndFilterState({
    super.key,
    required this.requests,
    required this.isAnyRequestChecked,
    this.shouldDisplaySearchBox = false,
  });

  @override
  State<StatefulWidget> createState() => _DataFoundAndFilterState();
}

class _DataFoundAndFilterState extends State<DataFoundAndFilterState> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          Visibility(
            visible: !widget.shouldDisplaySearchBox,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                constraints: const BoxConstraints(maxHeight: 42, minHeight: 42),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.clear();
                    _searchRequests("");
                  },
                  icon: const Icon(Icons.close),
                ),
                enabledBorder: searchBorder(
                  color: Colors.grey,
                ),
                focusedBorder: searchBorder(
                  color: Colors.blueAccent,
                ),
                border: searchBorder(
                  color: Colors.grey,
                ),
                hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.6), fontSize: 16),
                hintText: context.localizedString.search,
                isDense: true,
                // Added this
              ),
              onChanged: _searchRequests,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.requests.length,
              itemBuilder: (BuildContext context, int index) {
                return RequestItem(
                  request: widget.requests[index],
                );
              },
            ),
          ),
          AnimatedOpacity(
            opacity: widget.isAnyRequestChecked ? 1.0 : 0,
            duration: const Duration(milliseconds: 300),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.clear();
                      getIt<SearchCubit>().updateSearchQuery("");
                      getIt<RequestCubit>().checkApproveRejectMapping(
                        widget.requests,
                        false,
                        getIt<String>(
                            instanceName: FulfilmentPartnerOptions.moduleName),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      elevation: 0,
                      surfaceTintColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(color: Colors.orange),
                      ),
                    ),
                    child: Text(context.localizedString.reject),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.clear();
                      getIt<SearchCubit>().updateSearchQuery("");
                      getIt<RequestCubit>().checkApproveRejectMapping(
                        widget.requests,
                        true,
                        getIt<String>(
                            instanceName: FulfilmentPartnerOptions.moduleName),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(context.localizedString.map),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _searchRequests(String searchQuery) {
    getIt<SearchCubit>().updateSearchQuery(searchQuery);
    getIt<RequestCubit>().searchRequests();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
