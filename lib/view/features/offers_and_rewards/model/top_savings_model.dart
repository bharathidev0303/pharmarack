class TopSavingsModel {
  List<TopSavings>? topSavings;

  TopSavingsModel({this.topSavings});

  TopSavingsModel.fromJson(Map<String, dynamic> json) {
    if (json['topSavings'] != null) {
      topSavings = <TopSavings>[];
      json['topSavings'].forEach((v) {
        topSavings!.add(TopSavings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (topSavings != null) {
      data['topSavings'] = topSavings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TopSavings {
  String? id;
  String? imageUrl;

  TopSavings({this.id, this.imageUrl});

  TopSavings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
