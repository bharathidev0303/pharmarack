import 'package:flutter/material.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/CommonModule.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/models/VideoWidgetModel.dart';
import 'package:video_player/video_player.dart';

Future<VideoWidgetModel> _loadVideoWidgetData(jsonData) async {
  try {
    return VideoWidgetModel.fromJson(jsonData);
  } catch (error) {
    rethrow;
  }
}

Widget buildVideoWidget(dynamic children) {
  return FutureBuilder(
    future: _loadVideoWidgetData(children),
    builder: (context, AsyncSnapshot<VideoWidgetModel> snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        VideoWidgetModel videoWidgetModel = snapshot.requireData;
        return videoWidgetModel.assetUrl != ""
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 0.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        videoWidgetModel.title != ""
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      videoWidgetModel.title,
                                      style: TextStyle(
                                          color: Color(hexStringToHexInt(
                                              videoWidgetModel.titleColor ??
                                                  "#000000")),
                                          fontWeight: FontWeight.w500,
                                          fontSize: double.parse(
                                              videoWidgetModel.titleSize ??
                                                  "14.0")),
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    VideoPlayerWidget(
                      videoUrl: videoWidgetModel.assetUrl,
                      autoPlay: videoWidgetModel.autoPlay,
                    ),
                  ],
                ))
            : Container();
      } else {
        return Container();
      }
    },
  );
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final bool autoPlay;

  const VideoPlayerWidget(
      {super.key, required this.videoUrl, required this.autoPlay});

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool letsPlay = false;
  bool playIconeHide = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.setLooping(true);
    if (widget.autoPlay) {
      _controller.play();
    } else {
      setState(() {
        letsPlay = false;
      });
      _controller.pause();
    }
    _controller.initialize().then((_) => setState(() {}));
    autoHidePlayButton();
  }

  autoHidePlayButton() async {
    if (!letsPlay) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        playIconeHide = true;
      });
    } else {
      setState(() {
        playIconeHide = false;
      });
    }
  }

  void _onPlayPauseEvenet() {
    if (letsPlay) {
      setState(() {
        letsPlay = false;
      });
      _controller.play();
    } else {
      setState(() {
        letsPlay = true;
      });
      _controller.pause();
    }
    autoHidePlayButton();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: InkWell(
                        onTap: _onPlayPauseEvenet,
                        child: VideoPlayer(_controller)),
                  )
                : AspectRatio(
                    aspectRatio: 1.8,
                    child: InkWell(
                      onTap: _onPlayPauseEvenet,
                      child: playIconeHide
                          ? Container()
                          : Container(
                              color: Colors.black,
                              child: letsPlay
                                  ? IconButton(
                                      icon: const Icon(
                                        Icons.play_arrow_rounded,
                                        size: 50.0,
                                        color:
                                            Color.fromARGB(158, 255, 255, 255),
                                      ),
                                      onPressed: _onPlayPauseEvenet)
                                  : IconButton(
                                      icon: const Icon(
                                        Icons.pause_rounded,
                                        size: 50.0,
                                        color:
                                            Color.fromARGB(158, 255, 255, 255),
                                      ),
                                      onPressed: _onPlayPauseEvenet),
                            ),
                    ),
                  ),
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: playIconeHide
                        ? Container()
                        : Center(
                            child: letsPlay
                                ? IconButton(
                                    icon: const Icon(
                                      Icons.play_arrow_rounded,
                                      size: 50.0,
                                      color: Color.fromARGB(158, 255, 255, 255),
                                    ),
                                    onPressed: _onPlayPauseEvenet,
                                  )
                                : IconButton(
                                    icon: const Icon(
                                      Icons.pause_rounded,
                                      size: 50.0,
                                      color: Color.fromARGB(158, 255, 255, 255),
                                    ),
                                    onPressed: _onPlayPauseEvenet,
                                  ),
                          ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
