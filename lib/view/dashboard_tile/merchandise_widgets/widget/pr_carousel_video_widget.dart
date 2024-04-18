import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dimensions.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/feature/video/domain/video_model.dart';
import 'package:video_player/video_player.dart';

class PRVideoCarouselSlider extends StatefulWidget {
  final Function onItemTap;
  final CarouselController? carouselController;
  final List<Video> videos;

  const PRVideoCarouselSlider({
    super.key,
    required this.onItemTap,
    this.carouselController,
    required this.videos,
  });

  @override
  State<PRVideoCarouselSlider> createState() => _PRCarouselSliderState();
}

class _PRCarouselSliderState extends State<PRVideoCarouselSlider> {
  late CarouselController carouselController;
  late int current = 0;

  @override
  void initState() {
    super.initState();
    carouselController = widget.carouselController ?? CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          options: CarouselOptions(
            autoPlay: false,
            height: Dimensions.carouselVideoHeight,
            viewportFraction: 1.0,
            aspectRatio: 2.0,
            onPageChanged: (index, _) {
              setState(() {
                current = index;
              });
            },
          ),
          itemCount: widget.videos.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return VideoPlayerWidget(videoUrl: widget.videos[index].videoUrl);
          },
        ),
        _buildIndicatorRow(),
      ],
    );
  }

  Widget _buildIndicatorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.videos.length, (index) {
        return GestureDetector(
          onTap: () {
            carouselController.animateToPage(index);
          },
          child: Container(
            width: current == index ? 15.0 : 5.0,
            height: Dimensions.height5,
            margin: const EdgeInsets.only(
                top: Dimensions.margin10, left: Dimensions.margin5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.circularRadius10),
              color: AppColors.pagerIndicatorColor
                  .withOpacity(current == index ? 1 : 0.26),
            ),
          ),
        );
      }),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({super.key, required this.videoUrl});

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool letsPlay = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimensions.circularRadius10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.circularRadius10),
            ),
            child: Stack(
              children: [
                _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
                Center(
                  child: IconButton(
                    icon: Icon(
                      letsPlay ? Icons.play_arrow : Icons.pause,
                      size: 50.0,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        letsPlay = !letsPlay;
                        if (letsPlay) {
                          _controller.play();
                        } else {
                          _controller.pause();
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
