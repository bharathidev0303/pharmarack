import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core_flutter/di/core_flutter_provider.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/feature/video/domain/video_model.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/feature/video/pesentation/cubit/video_cubit.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/widget/pr_carousel_video_widget.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({super.key});

  Future<VideoModel> _loadVideoData() async {
    try {
      const String jsonPath = 'assets/mockData/video_section.json';
      String jsonString = await rootBundle.loadString(jsonPath);

      Map<String, dynamic> jsonData = json.decode(jsonString);
      return VideoModel.fromJson(jsonData);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadVideoData(),
      builder: (context, AsyncSnapshot<VideoModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          VideoModel videoModel = snapshot.requireData;

          return BlocProvider<VideoCubit>(
            create: (context) => coreFlutterDI<VideoCubit>(),
            child: PRVideoCarouselSlider(
              videos: videoModel.videos.map((video) => video).toList(),
              onItemTap: (int index) {},
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
