import 'package:flutter/material.dart';
import 'package:pharmarack/main/navigation/app_router.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/cms_page_navigator_model.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/topWidgetModels/BrandsWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/topWidgetModels/TopWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/widgets/TopWidgets/TopWidgets.dart';

Future<BrandItemsItemList> _loadBrandsWidgetData(List<dynamic> children) async {
  try {
    if (children.isNotEmpty) {
      return BrandItemsItemList.fromJson(children);
    } else {
      return BrandItemsItemList(brands: []);
    }
  } catch (error) {
    rethrow;
  }
}

class BrandsWidget extends StatefulWidget {
  final TopWidgetModel brandsWidgetModel;
  const BrandsWidget({super.key, required this.brandsWidgetModel});

  @override
  State<BrandsWidget> createState() => _BrandsWidgetState();
}

class _BrandsWidgetState extends State<BrandsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadBrandsWidgetData(widget.brandsWidgetModel.data),
      builder: (context, AsyncSnapshot<BrandItemsItemList> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          BrandItemsItemList brandsItem = snapshot.requireData;
          print("shghshshs ${brandsItem.brands.length}");
          if (brandsItem.brands.isNotEmpty) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: Column(
                children: [
                  topTitleWidget(widget.brandsWidgetModel, context),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Wrap(
                        children: brandsItem.brands
                            .map(
                              (item) => IntrinsicWidth(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    item.companyName != ""
                                        ? InkWell(
                                            onTap: () {
                                              AppRouter.cmsWidgetPageNavigator(
                                                  cmsPageNavigatorModel:
                                                      CmsPageNavigatorModel(
                                                context: context,
                                                linkType: "internal",
                                                linkTo: "/BannerProductSearch",
                                                linkToExtra: item.companyName,
                                              ));
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                side: const BorderSide(
                                                    color: Color(0XFFE2E4E9),
                                                    width: 0.5),
                                              ),
                                              margin: const EdgeInsets.all(5.0),
                                              child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3.8,
                                                  height: 30,
                                                  child: Center(
                                                      child: Text(
                                                    item.companyName!,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ))),
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                ],
              ),
            );
          } else {
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
}
