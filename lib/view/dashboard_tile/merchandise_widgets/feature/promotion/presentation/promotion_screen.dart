import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/di/core_flutter_provider.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/feature/promotion/domain/promotion_card_model.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/feature/promotion/presentation/cubit/promotion_card_cubit.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/widget/pr_custom_card.dart';

class PromotionWidget extends StatelessWidget {
  const PromotionWidget({super.key});

  Future<PromotionCardListModel> _loadPromotionCardData() async {
    try {
      const String jsonPath = 'assets/mockData/promotion_card.json';
      String jsonString = await rootBundle.loadString(jsonPath);

      Map<String, dynamic> jsonData = json.decode(jsonString);
      return PromotionCardListModel.fromJson(jsonData);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadPromotionCardData(),
      builder: (context, AsyncSnapshot<PromotionCardListModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          PromotionCardListModel promotionCardModel = snapshot.requireData;

          return BlocProvider<PromotionCardCubit>(
            create: (context) => coreFlutterDI<PromotionCardCubit>(),
            child: PRCustomCard(
              image: promotionCardModel.promotionCards[0].image,
              customText: promotionCardModel.promotionCards[0].hashtagText,
              buttonText: promotionCardModel.promotionCards[0].buttonText,
              onItemTap: () {},
              buttonPressed: () {},
              customTextPressed: () {},
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
