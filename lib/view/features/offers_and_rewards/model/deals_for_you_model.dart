class DealsForYouModel {
  List<DealsForYou>? dealsForYou;

  DealsForYouModel({this.dealsForYou});

  DealsForYouModel.fromJson(Map<String, dynamic> json) {
    if (json['dealsForYou'] != null) {
      dealsForYou = <DealsForYou>[];
      json['dealsForYou'].forEach((v) {
        dealsForYou!.add(DealsForYou.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dealsForYou != null) {
      data['dealsForYou'] = dealsForYou!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DealsForYou {
  String? id;
  String? deal;
  String? text;
  String? productUrl;

  DealsForYou({this.id, this.deal, this.text, this.productUrl});

  DealsForYou.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deal = json['deal'];
    text = json['text'];
    productUrl = json['productUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['deal'] = deal;
    data['text'] = text;
    data['productUrl'] = productUrl;
    return data;
  }
}
