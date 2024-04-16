import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_buttons/secondary_button.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/primary_button.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_utils.dart';
import 'package:pharmarack/view/dashboard/order_history/di/order_history_provider.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/status_item.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/order_history_filter_cubit.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/order_history_list_state.dart';

class OrderHistoryFilter extends StatefulWidget {
  const OrderHistoryFilter({super.key});

  @override
  State<OrderHistoryFilter> createState() => _OrderHistoryFilterState();
}

class _OrderHistoryFilterState extends State<OrderHistoryFilter> {
  DateTime selectedDate = DateTime.now();
  late DateTime fromDate;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await orderHistoryFilterCubit.getListOfStatus();

      String fromDate = orderHistoryFilterCubit.from;
      orderHistoryFilterCubit.updateFomDate(fromDate);

      String toDate = orderHistoryFilterCubit.to;
      orderHistoryFilterCubit.updateToDate(toDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 25,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: AppAssets.svg.downBroadArrow.svg(
                  package: 'core_flutter',
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            context.localizedString.filter,
            style: AppTextStyles.style18W500Grey(
                color: AppColors.secondaryTextColor),
          ),
          const SizedBox(
            height: 19,
          ),
          Text(
            context.localizedString.date,
            style: AppTextStyles.style12W500Black(
                weight: FontWeight.w300, color: AppColors.secondaryTextColor),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocBuilder(
                bloc: orderHistoryFilterCubit,
                buildWhen: (previous, current) {
                  return current is FromChangeDateState;
                },
                builder: (context, state) {
                  if (state is FromChangeDateState) {
                    final date = state.dateTime;
                    return Expanded(
                        child: _getTitleAndDatePicker(
                            context.localizedString.from, context, date));
                  }

                  return const SizedBox.shrink();
                },
              ),
              BlocBuilder(
                bloc: orderHistoryFilterCubit,
                buildWhen: (previous, current) {
                  return current is ToChangeDateState;
                },
                builder: (context, state) {
                  if (state is ToChangeDateState) {
                    final date = state.dateTime;
                    return Expanded(
                        child: _getTitleAndDatePicker(
                            context.localizedString.to, context, date));
                  }

                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          _buildStatusView(context),
          _buildFilterButtons(context),
        ],
      ),
    );
  }

  _buildStatusView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localizedString.status.toUpperCase(),
          style: AppTextStyles.style12W500Black(
              weight: FontWeight.w300, color: AppColors.secondaryTextColor),
        ),
        const SizedBox(
          height: 11,
        ),
        Container(
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                  width: 1, color: AppColors.searchBackgroundColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: BlocBuilder<OrderHistoryFilterCubit, OrderHistoryFilterState>(
            bloc: orderHistoryFilterCubit,
            buildWhen: (previous, current) {
              return (current is OrderHistoryFilterDataState) ||
                  (current is OrderHistoryFilterUpdatedDataState);
            },
            builder: (context, state) {
              List<StatusItem> statusItem = [];
              if (state is OrderHistoryFilterDataState) {
                statusItem = state.list;
              }
              if (state is OrderHistoryInitialState) {
                return const CircularProgressIndicator();
              }
              if (state is OrderHistoryFilterUpdatedDataState) {
                statusItem = state.list;
              }
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: statusItem.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          final bool isSelected = statusItem[index].isSelected;
                          final String status = statusItem[index].name;
                          orderHistoryFilterCubit.updateStatusList(
                              index, isSelected, status);
                        },
                        child: _buildStatusItems(
                            title: statusItem[index].name,
                            isSelected: statusItem[index].isSelected));
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  _buildFilterButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 21),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: SecondaryButton(
              text: context.localizedString.resetFilter,
              onClick: () {
                var value = orderHistoryFilterCubit.resetCallWithFilters();
                Navigator.pop(context, value);
              },
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 5,
            child: PrimaryButton(
              text: context.localizedString.apply,
              onPressed: () {
                var value = orderHistoryFilterCubit.apiCallWithFilters();
                Navigator.pop(context, value);
              },
            ),
          )
        ],
      ),
    );
  }

  _getTitleAndDatePicker(String title, BuildContext context, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.style12W500Black(
              weight: FontWeight.w300, color: AppColors.secondaryTextColor),
        ),
        const SizedBox(
          height: 8,
        ),
        GestureDetector(
          onTap: () {
            title.toUpperCase() == 'TO DATE'
                ? _selectDate(context, title, fromDate)
                : _selectDate(context, title, DateTime(2000));
          },
          child: Container(
            width: 165,
            height: 38,
            padding:
                const EdgeInsets.only(top: 7, left: 8, right: 11, bottom: 7),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFE2E4E9)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    color: Color(0xFF030303),
                    fontSize: 12,
                    fontFamily: 'Helvetica Neue',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                SizedBox(
                  width: 24,
                  height: 24,
                  child: AppAssets.svg.icCalendar
                      .svg(package: 'core_flutter', height: 24, width: 24),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(
      BuildContext context, String title, DateTime initialDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: initialDate,
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      const sDateFormat = "dd/MM/yy";
      final date = AppUtils.getFormat(sDateFormat, picked);
      if (title.toUpperCase() == 'FROM DATE') {
        setState(() {
          fromDate = picked;
        });
        orderHistoryFilterCubit.updateFomDate(date);
      } else {
        orderHistoryFilterCubit.updateToDate(date);
      }
    }
  }

  _buildStatusItems({required bool isSelected, required String title}) {
    final SvgGenImage imageStatus =
        isSelected ? AppAssets.svg.icChecked : AppAssets.svg.icUnchecked;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        imageStatus.svg(
          package: 'core_flutter',
        ),
        Text(title)
      ],
    );
  }
}
