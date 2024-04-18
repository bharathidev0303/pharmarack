class PromotionCardModel {
  final String image;
  final String redirectUrl;
  final String buttonText;
  final String buttonPosition;
  final String buttonRedirectUrl;
  final String audience;
  final String pageName;
  final String hashtagText;
  final String cardContentText;
  final String hashtagTextRedirectUrl;

  PromotionCardModel({
    required this.image,
    required this.redirectUrl,
    required this.buttonText,
    required this.buttonPosition,
    required this.buttonRedirectUrl,
    required this.audience,
    required this.pageName,
    required this.hashtagText,
    required this.cardContentText,
    required this.hashtagTextRedirectUrl,
  });

  factory PromotionCardModel.fromJson(Map<String, dynamic> json) {
    return PromotionCardModel(
      image: json['image'] ?? "",
      redirectUrl: json['redirectUrl'] ?? "",
      buttonText: json['buttonText'] ?? "",
      buttonPosition: json['buttonPosition'] ?? "",
      buttonRedirectUrl: json['buttonRedirectUrl'] ?? "",
      audience: json['audience'] ?? "",
      pageName: json['pageName'] ?? "",
      hashtagText: json['hashtagText'] ?? '',
      cardContentText: json['cardContentText'] ?? '',
      hashtagTextRedirectUrl: json['hashtagTextRedirectUrl'] ?? " ",
    );
  }
}

class PromotionCardListModel {
  final List<PromotionCardModel> promotionCards;

  PromotionCardListModel({
    required this.promotionCards,
  });

  factory PromotionCardListModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> promotionCardsJson = json['data']['image'] ?? [];
    final List<PromotionCardModel> promotionCards = promotionCardsJson
        .map((promotionCardJson) =>
            PromotionCardModel.fromJson(promotionCardJson))
        .toList();

    return PromotionCardListModel(promotionCards: promotionCards);
  }
}
