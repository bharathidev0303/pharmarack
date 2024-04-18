import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CommonModule.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/RewordsWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/RewardWidgets/MileStone/mileStoneWidget.dart';

Future<RewordsWidgetModel> _loadRewordsWidgetData(jsonData) async {
  try {
    return RewordsWidgetModel.fromJson(jsonData);
  } catch (error) {
    rethrow;
  }
}

Widget buildRewordsWidget(children) {
  return FutureBuilder(
    future: _loadRewordsWidgetData(children),
    builder: (context, AsyncSnapshot<RewordsWidgetModel> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        RewordsWidgetModel rewordsWidgetModel = snapshot.requireData;
        switch (rewordsWidgetModel.rewardType) {
          case 'percent':
            return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    headerTittle(context, rewordsWidgetModel),
                    // const StellarDealsList(),
                  ],
                ));
          case 'milestone':
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: MileStoneWidget(rewordsWidgetModel: rewordsWidgetModel),
            );
          case 'offers':
            return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    headerTittle(context, rewordsWidgetModel),
                    // const CustomCardOffers(),
                  ],
                ));
          default:
            return Container();
        }
      } else {
        return const Center(
            // child: SpinKitFadingCircle(
            //   color: AppColors.blueButtonColor,
            //   size: 50.0,
            // ),
            );
      }
    },
  );
}

headerTittle(BuildContext context, RewordsWidgetModel rewordsWidgetModel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            rewordsWidgetModel.title,
            style: context.textStyles.header4Medium?.copyWith(
                color: Color(hexStringToHexInt(rewordsWidgetModel.titleColor)),
                fontSize: double.parse(rewordsWidgetModel.titleSize)),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    ),
  );
}
