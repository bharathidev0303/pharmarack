import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/mapped_settings_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/utils/custom_dropdown/anchor_widget.dart';
import 'package:pharmarack/packages/fulfilment_partner/utils/custom_dropdown/overlay_widget.dart';
import 'package:pharmarack/packages/fulfilment_partner/utils/custom_dropdown/select_fulfillment_partner_holder.dart';

const double itemHeight = 41.0;
const double bottomSpacer = 0;

class CustomDropDown extends StatefulWidget {
  final List<MappedSettingPartners> items;
  final SearchResult searchResult;
  final MappedSettingPartners? selectedPartner;
  final OverlayPortalController tooltipController;

  const CustomDropDown({
    super.key,
    required this.items,
    required this.searchResult,
    this.selectedPartner,
    required this.tooltipController,
  });

  @override
  State<StatefulWidget> createState() => CustomDropDownState();
}

class CustomDropDownState extends State<CustomDropDown> {
  final TextEditingController controller = TextEditingController(text: "");
  final _link = LayerLink();
  final List<MappedSettingPartners> results = [];
  double? _width;
  double? _height;
  bool isShowing = false;

  @override
  void initState() {
    super.initState();
    _updateList();
    _listenTextField();
  }

  @override
  Widget build(BuildContext context) {
    isShowing = widget.tooltipController.isShowing;
    _updateResults();
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: widget.tooltipController,
        overlayChildBuilder: (BuildContext context) {
          return CompositedTransformFollower(
            link: _link,
            targetAnchor: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.only(top: 4),
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: OverlayWidget(
                  width: _width,
                  height: _height,
                  controller: controller,
                  list: results,
                  searchResult: widget.searchResult,
                  onTap: () {
                    controller.clear();
                    _hideOverlay();
                  },
                ),
              ),
            ),
          );
        },
        child: AnchorWidget(
          overlayPortalController: widget.tooltipController,
          onTap: () {
            _onTap();
          },
          child: SelectFulfillmentPartnerHolder(
            selectedPartner: widget.selectedPartner,
          ),
        ),
      ),
    );
  }

  void _listenTextField() {
    controller.addListener(() {
      _searchSettings(controller.text);
    });
  }

  void _searchSettings(String s) {
    final res = widget.items
        .where((element) =>
            element.fulfillmentPartnerName
                ?.toLowerCase()
                .contains(s.toLowerCase()) ??
            false)
        .toList();
    results.clear();
    results.addAll(s.isEmpty
        ? widget.items
        : (res.isEmpty
            ? [
                MappedSettingPartners(
                  fulfillmentPartnerName:
                      context.localizedString.noResultMatched(s),
                  isSelected: false,
                ),
              ]
            : res));
    _update();
  }

  void _updateResults() {
    if (widget.searchResult.shouldUpdateResults) {
      _updateList();
    }
  }

  void _updateList() {
    results.clear();
    results.addAll(widget.items);
  }

  void _hideOverlay() {
    try {
      widget.tooltipController.hide();
    } finally {}
  }

  void _update() {
    final calculatedHeight = (itemHeight * results.length) + bottomSpacer;
    final expected = ((MediaQuery.of(context).size.height -
            (context.size?.height ?? 0) -
            (Scaffold.of(context).appBarMaxHeight ?? 0)) /
        1.3);
    _width = context.size?.width;
    _height = calculatedHeight > expected ? expected : calculatedHeight;
    widget.tooltipController.show();
  }

  void _onTap() {
    final calculatedHeight = (itemHeight * results.length) + bottomSpacer;
    final expected = ((MediaQuery.of(context).size.height -
            (context.size?.height ?? 0) -
            (Scaffold.of(context).appBarMaxHeight ?? 0)) /
        1.3);
    _width = context.size?.width;
    _height = calculatedHeight > expected ? expected : calculatedHeight;

    widget.tooltipController.toggle();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class SearchResult extends Equatable {
  final String searchQuery;
  final bool shouldUpdateResults;

  const SearchResult({
    required this.searchQuery,
    this.shouldUpdateResults = false,
  });

  @override
  List<Object?> get props => [
        searchQuery,
        shouldUpdateResults,
      ];
}
