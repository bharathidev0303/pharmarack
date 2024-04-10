
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/app_drop_down/app_drop_down_cubit.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/gen/assets.gen.dart';

class AppDropDown extends StatefulWidget {
  final double dropDownHeight;
  final double dropDownWidth;
  final List<String> options;

  final Function(String)? onSelected;

  const AppDropDown(
      {super.key,
      required this.options,
      this.onSelected,
      this.dropDownHeight = 40,
      this.dropDownWidth = 100});

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  final GlobalKey _widgetKey = GlobalKey();

  late AppDropDownCubit appDropDownCubit;
  late String selectedValue;

  OverlayEntry? overlayEntry;

  @override
  void initState() {
    super.initState();
    initDI();
    selectedValue = widget.options.first;
    appDropDownCubit = GetIt.instance<AppDropDownCubit>();
  }

  initDI() {
    GetIt.instance.isRegistered<AppDropDownCubit>()
        ? GetIt.instance<AppDropDownCubit>()
        : GetIt.instance
            .registerFactory<AppDropDownCubit>(() => AppDropDownCubit());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildDropDownView(),
        if (overlayEntry != null) _buildOverlay(),
      ],
    );
  }

  _buildDropDownView() {
    return GestureDetector(
      key: _widgetKey,
      onTap: () {
        if (overlayEntry == null) {
          _showDropdown();
        } else {
          _removeOverlay();
        }
      },
      child: BlocBuilder<AppDropDownCubit, AppDropDownState>(
        bloc: appDropDownCubit,
        buildWhen: (previous, current) {
          return (current is AppDropDownOpenState) ||
              (current is AppDropDownSelectedState);
        },
        builder: (context, state) {
          bool isOpen = false;

          if (state is AppDropDownOpenState) {
            isOpen = state.isOpen;
          }
          if (state is AppDropDownSelectedState) {
            selectedValue = state.selectedDistributor;
          }

          return Container(
            height: widget.dropDownHeight,
            width: widget.dropDownWidth,
            decoration: BoxDecoration(
                borderRadius: isOpen
                    ? const BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      )
                    : BorderRadius.circular(5),
                color: Colors.white,
                border: Border.all(color: AppColors.borderColor)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedValue,
                    style: AppTextStyles.style12W700Black(),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                isOpen
                    ? AppAssets.svg.arrowUp.svg(package: 'core_flutter')
                    : AppAssets.svg.arrowDown.svg(package: 'core_flutter')
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildOverlay() {
    final RenderBox renderBox =
        _widgetKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final exactPosition = position + Offset(0, renderBox.size.height);
    final boxWidth = renderBox.size.width; //minus symmetric padding
    return GestureDetector(
      onTap: () {
        _removeOverlay();
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              left: exactPosition.dx,
              top: exactPosition.dy,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      bottomLeft: Radius.circular(5)),
                  border: Border.all(color: AppColors.borderColor),
                  color: Colors.white,
                ),
                width: boxWidth,
                child: SingleChildScrollView(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    shrinkWrap: true,
                    itemCount: widget.options.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          widget.onSelected?.call(widget.options[index]);
                          _removeOverlay();
                          appDropDownCubit
                              .dropDownItemSelected(widget.options[index]);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.options[index],
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.style12W700Black(),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height:
                                  index == widget.options.length - 1 ? 0 : 10,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDropdown() {
    overlayEntry = OverlayEntry(builder: (context) => _buildOverlay());
    Overlay.of(context).insert(overlayEntry!);
    appDropDownCubit.openDropDown(true);
  }

  void _removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
    appDropDownCubit.openDropDown(false);
  }
}
