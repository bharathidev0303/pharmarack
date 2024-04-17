import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmarack/gen/fonts.gen.dart';
import 'package:pharmarack/main/navigation/app_router.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CommonModule.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CrmBarWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/cms_page_navigator_model.dart';

Future<CrmBarWidgetModel> _loadCrmBarData(jsonData) async {
  try {
    return CrmBarWidgetModel.fromJson(jsonData);
  } catch (error) {
    rethrow;
  }
}

Widget buildCrmBarWidget(Map<String, dynamic> children) {
  return FutureBuilder(
    future: _loadCrmBarData(children),
    builder: (context, AsyncSnapshot<CrmBarWidgetModel> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        CrmBarWidgetModel crmBarModel = snapshot.requireData;
        debugPrint('LENGTH: ${crmBarModel.crmBars.length}');
        return SizedBox(
          height: 100,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: crmBarModel.crmBars.asMap().entries.map((entry) {
              int index = entry.key;
              CrmBar crmBarItem = entry.value;
              return InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  AppRouter.cmsWidgetPageNavigator(
                      cmsPageNavigatorModel: CmsPageNavigatorModel(
                    context: context,
                    title: crmBarItem.title,
                    linkType: crmBarItem.linkType,
                    linkTo: crmBarItem.linkTo,
                    linkToExtra: crmBarItem.linkToExtra,
                  ));
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 75,
                      height: 74,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: CachedNetworkImage(
                                imageUrl: crmBarItem.assetUrl ?? "",
                                fit: BoxFit.fill,
                                width: 75,
                                height: 74,
                                fadeInDuration:
                                    const Duration(microseconds: 100),
                                fadeOutDuration:
                                    const Duration(microseconds: 100),
                                errorWidget: (context, url, error) => Container(
                                  color: AppColors.appBackgroundColor,
                                  child: const Center(
                                    child: Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      crmBarItem.title,
                      style: TextStyle(
                        color: Color(
                          hexStringToHexInt(
                              crmBarItem.titleColor ?? "#0000000"),
                        ),
                        fontSize: double.parse(crmBarItem.titleSize ?? "12.0"),
                        fontFamily: AppFontFamily.helveticaNeueRegular,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      } else {
        return Container(
            // child: SpinKitFadingCircle(
            //   color: AppColors.blueButtonColor,
            //   size: 50.0,
            // ),
            );
      }
    },
  );
}
