class Banner {
  final String image;
  final String redirectUrl;
  final String buttonText;
  final String buttonRedirectUrl;

  Banner({
    required this.image,
    required this.redirectUrl,
    required this.buttonText,
    required this.buttonRedirectUrl,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      image: json['image'] ?? "",
      redirectUrl: json['redirectUrl'] ?? "",
      buttonText: json['buttonText'] ?? "",
      buttonRedirectUrl: json['buttonRedirectUrl'] ?? "",
    );
  }
}

class BannerModel {
  final List<Banner> banners;

  BannerModel({
    required this.banners,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> bannersJson = json['data']['images'] ?? [];
    final List<Banner> banners =
        bannersJson.map((bannerJson) => Banner.fromJson(bannerJson)).toList();

    return BannerModel(banners: banners);
  }
}
