class OffersModel {
  List<Offers>? offers;

  OffersModel({this.offers});

  OffersModel.fromJson(Map<String, dynamic> json) {
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(Offers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offers {
  String? id;
  String? productName;
  String? companyName;
  String? pTR;
  String? mRP;
  String? productUrl;

  Offers({
    this.id,
    this.productName,
    this.companyName,
    this.pTR,
    this.mRP,
    this.productUrl,
  });

  Offers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    companyName = json['companyName'];
    pTR = json['PTR'];
    mRP = json['MRP'];
    productUrl = json['productUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productName'] = productName;
    data['companyName'] = companyName;
    data['PTR'] = pTR;
    data['MRP'] = mRP;
    data['productUrl'] = productUrl;
    return data;
  }
}
