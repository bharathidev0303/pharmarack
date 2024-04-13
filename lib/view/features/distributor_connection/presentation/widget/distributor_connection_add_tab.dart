import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/common_dialongs.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/content_card.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/widgets/text_input_field.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/primary_button.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/view/features/distributor_connection/presentation/cubit/distributor_connection_add_tab_cubit.dart';
import 'package:pharmarack/view/features/distributor_connection/presentation/cubit/distributor_connection_add_tab_state.dart';

class DistributorConnectionAddTab extends StatelessWidget {
  final nameController = TextEditingController();
  final contactNumberController = TextEditingController();

  DistributorConnectionAddTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DistributorConnectionAddTabCubit>(
      create: (context) =>
          GetIt.instance.get<DistributorConnectionAddTabCubit>(),
      child: BlocConsumer<DistributorConnectionAddTabCubit,
          DistributorConnectionAddTabState>(
        listener: (context, state) async {
          await _onBlocListener(context, state);
        },
        builder: (context, state) => _onBlocBuilder(context, state),
      ),
    );
  }

  Future<void> _onBlocListener(
    BuildContext context,
    DistributorConnectionAddTabState state,
  ) async {
    switch (state.userMessage.runtimeType) {
      case const (InvalidDistributorName):
        _showSnackBar(
          context,
          context.localizedString.pleaseEnterDistributorName,
        );
        break;
      case const (InvalidContactNumber):
        _showSnackBar(
          context,
          context.localizedString.pleaseEnterValidContactNumber,
        );
        break;
      case const (AddDistributorFailure):
        _showSnackBar(context, context.localizedString.somethingWentWrong);
        break;
      case const (AddDistributorSuccess):
        await _showSuccessDialog(context);
        break;
      default:
        break;
    }
  }

  Widget _onBlocBuilder(
    BuildContext context,
    DistributorConnectionAddTabState state,
  ) {
    final cubit = context.read<DistributorConnectionAddTabCubit>();
    return DistributorConnectionAddTabContent(
      cubit: cubit,
      state: state,
      nameController: nameController,
      contactNumberController: contactNumberController,
    );
  }

  void _showSnackBar(BuildContext context, String submit) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(submit)),
    );
  }

  Future<void> _showSuccessDialog(BuildContext context) async {
    if (ModalRoute.of(context)?.isCurrent != true) {
      Navigator.pop(context); // Close existing dialog
    }
    await showSuccessDialog(
      context,
      title: context.localizedString.requestSent,
      subtitle: context.localizedString.addDistributorSuccessMessage,
      barrierDismissible: false,
      userRootNavigator: false,
      closeClick: () {
        nameController.clear();
        contactNumberController.clear();
        Navigator.pop(context);
      },
    );
  }
}

class DistributorConnectionAddTabContent extends StatefulWidget {
  final DistributorConnectionAddTabCubit cubit;
  final DistributorConnectionAddTabState state;
  final TextEditingController nameController;
  final TextEditingController contactNumberController;

  const DistributorConnectionAddTabContent({
    super.key,
    required this.cubit,
    required this.state,
    required this.nameController,
    required this.contactNumberController,
  });

  @override
  State<DistributorConnectionAddTabContent> createState() =>
      _DistributorConnectionAddTabContentState();
}

class _DistributorConnectionAddTabContentState
    extends State<DistributorConnectionAddTabContent> {
  @override
  Widget build(BuildContext context) {
    if (widget.state.isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
          backgroundColor: AppColors.secondaryTextColor,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              context.localizedString.youCanReferANewDistributorHere,
              style: AppTextStyles.style12W400.copyWith(
                color: AppColors.secondaryTextColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // card with 1px
          ContentCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextInputField(
                  key: const Key('distributorName'),
                  controller: widget.nameController,
                  title: context.localizedString.distributorName,
                ),
                const SizedBox(height: 10),
                TextInputField(
                  key: const Key('contactNumber'),
                  controller: widget.contactNumberController,
                  title: context.localizedString.mobileNo,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 15),
                PrimaryButton(
                  text: context.localizedString.submitReferral.toUpperCase(),
                  onPressed: () {
                    widget.cubit.submit(
                      name: widget.nameController.text,
                      contactNumber: widget.contactNumberController.text,
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
