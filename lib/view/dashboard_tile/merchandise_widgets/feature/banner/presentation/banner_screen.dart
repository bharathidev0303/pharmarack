import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/di/core_flutter_provider.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/feature/banner/domain/banner_model.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/feature/banner/presentation/cubit/banner_cubit.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/widget/pr_carousel_slider_widget.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  Future<BannerModel> _loadBannerData() async {
    try {
      const String jsonPath = 'assets/mockData/banner.json';
      String jsonString = await rootBundle.loadString(jsonPath);

      Map<String, dynamic> jsonData = json.decode(jsonString);
      return BannerModel.fromJson(jsonData);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadBannerData(),
      builder: (context, AsyncSnapshot<BannerModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          BannerModel bannersModel = snapshot.requireData;

          return BlocProvider<BannerCubit>(
            create: (context) => coreFlutterDI<BannerCubit>(),
            child: PRCarouselSlider(
              images:
                  bannersModel.banners.map((banner) => banner.image).toList(),
              onItemTap: (int index) {},
              buttonText:
                  bannersModel.banners.map((e) => e.buttonText).toList(),
              buttonPressed: (int index) {},
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
