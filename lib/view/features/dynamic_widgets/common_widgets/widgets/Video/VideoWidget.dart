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
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 10.0),
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
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
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
                        onTap: () {
                          setState(() {
                            letsPlay = !letsPlay;
                            if (letsPlay) {
                              _controller.play();
                            } else {
                              _controller.pause();
                            }
                          });
                        },
                        child: VideoPlayer(_controller)),
                  )
                : AspectRatio(
                    aspectRatio: 1.8,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          letsPlay = !letsPlay;
                          if (letsPlay) {
                            _controller.play();
                          } else {
                            _controller.pause();
                          }
                        });
                      },
                      child: Container(
                        color: Colors.black,
                        child: IconButton(
                          icon: const Icon(
                            Icons.pause,
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
                    ),
                  ),
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Center(
                      child: letsPlay
                          ? Container()
                          : IconButton(
                              icon: const Icon(
                                Icons.pause,
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
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
