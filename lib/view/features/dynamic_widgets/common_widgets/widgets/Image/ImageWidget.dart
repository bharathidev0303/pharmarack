import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pharmarack/main/navigation/app_router.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CommonModule.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/ImageWidgetModel.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/cms_page_navigator_model.dart';

Future<ImageWidgetModel> _loadImageWidgetData(jsonData) async {
  try {
    return ImageWidgetModel.fromJson(jsonData);
  } catch (error) {
    rethrow;
  }
}

Widget buildImageWidget(dynamic children) {
  return FutureBuilder(
    future: _loadImageWidgetData(children),
    builder: (context, AsyncSnapshot<ImageWidgetModel> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        ImageWidgetModel imageWidgetModel = snapshot.requireData;
        return imageWidgetModel.mobileAssetUrl.isNotEmpty != null ||
                imageWidgetModel.mobileAssetUrl != ""
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: InkWell(
                  onTap: () => {
                    AppRouter.cmsWidgetPageNavigator(
                        cmsPageNavigatorModel: CmsPageNavigatorModel(
                      context: context,
                      title: imageWidgetModel.title,
                      linkType: imageWidgetModel.linkType,
                      linkTo: imageWidgetModel.linkTo,
                      linkToExtra: imageWidgetModel.linkToExtra,
                    )),
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      imageUrl: imageWidgetModel.mobileAssetUrl ?? "",
                      width: double.infinity,
                      fadeInDuration: const Duration(microseconds: 100),
                      fadeOutDuration: const Duration(microseconds: 100),
                      errorWidget: (context, url, error) => Container(
                        color: AppColors.appBackgroundColor,
                        child: const Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : Container();
      } else {
        return Container();
      }
    },
  );
}
