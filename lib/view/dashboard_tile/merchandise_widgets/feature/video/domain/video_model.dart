class Video {
  final String thumbnail;
  final String videoUrl;
  final String audience;
  final String pageName;
  final int pagePosition;
  final DateTime startDate;
  final DateTime endDate;

  Video({
    required this.thumbnail,
    required this.videoUrl,
    required this.audience,
    required this.pageName,
    required this.pagePosition,
    required this.startDate,
    required this.endDate,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      thumbnail: json['thumbnail'] ?? "",
      videoUrl: json['videoUrl'] ?? "",
      audience: json['audience'] ?? "",
      pageName: json['pageName'] ?? "",
      pagePosition: json['pagePosition'] ?? 0,
      startDate: DateTime.parse(json['startDate'] ?? ""),
      endDate: DateTime.parse(json['endDate'] ?? ""),
    );
  }
}

class VideoModel {
  final String sectionTitle;
  final List<Video> videos;

  VideoModel({
    required this.sectionTitle,
    required this.videos,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> videosJson = json['videos'] ?? [];
    final List<Video> videos =
        videosJson.map((videoJson) => Video.fromJson(videoJson)).toList();

    return VideoModel(
      sectionTitle: json['videoSection']['sectionTitle'] ?? "",
      videos: videos,
    );
  }
}
