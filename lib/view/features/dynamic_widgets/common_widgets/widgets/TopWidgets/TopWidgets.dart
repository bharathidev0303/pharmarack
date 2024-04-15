import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CommonModule.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/topWidgetModels/TopWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/TopWidgets/BrandsWidget.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/TopWidgets/DistributorsWidget.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/TopWidgets/ProductsWidget.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/pages/top_widget_view_more_page/top_widgets_view_more_page.dart';

Future<TopWidgetModel> _loadTopWidgetData(jsonData) async {
  try {
    return TopWidgetModel.fromJson(jsonData);
  } catch (error) {
    rethrow;
  }
}

Widget buildTopWidget(children) {
  return FutureBuilder(
    future: _loadTopWidgetData(children),
    builder: (context, AsyncSnapshot<TopWidgetModel> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        TopWidgetModel topWidgetModel = snapshot.requireData;
        switch (topWidgetModel.type) {
          case 'products':
            return (ProductsWidget(productsWidgetData: topWidgetModel));
          case 'distributors':
            return (DistributorsWidget(distributorsWidgetData: topWidgetModel));
          case 'brands':
            return BrandsWidget(brandsWidgetModel: topWidgetModel);
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

Widget topTitleWidget(TopWidgetModel topWidgetData, context) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        topWidgetData.title != "" || topWidgetData.title!.isNotEmpty
            ? Expanded(
                flex: topWidgetData.showAddDistributorsBtn == false ? 9 : 6,
                child: Text(
                  topWidgetData.title!,
                  style: TextStyle(
                      color: Color(
                        hexStringToHexInt(
                            topWidgetData.titleColor ?? "#000000"),
                      ),
                      fontSize: double.parse(topWidgetData.titleSize ?? "16.0"),
                      fontWeight: FontWeight.w500),
                  textAlign:
                      getTextAlignPosition(topWidgetData.titleAlignment!),
                ),
              )
            : Container(),
        topWidgetData.showViewMoreBtn! == true
            ? Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TopWidgetsViewMoreListPage(
                                topWidgetModel: topWidgetData,
                              )),
                    ),
                  },
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      topWidgetData.viewMoreBtnLabel ?? "",
                      style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.blueLinkTextColor,
                          fontWeight: FontWeight.w500),
                    ),
                    topWidgetData.viewMoreBtnLabel != ""
                        ? const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              size: 14,
                              color: AppColors.blueLinkTextColor,
                            ),
                          )
                        : Container(),
                  ]),
                ),
              )
            : Container(),
      ],
    ),
  );
}
