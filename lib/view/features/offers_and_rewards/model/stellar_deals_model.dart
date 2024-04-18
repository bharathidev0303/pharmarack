class StellarDealsModel {
  List<StellarDeals>? stellarDeals;

  StellarDealsModel({this.stellarDeals});

  StellarDealsModel.fromJson(Map<String, dynamic> json) {
    if (json['StellarDeals'] != null) {
      stellarDeals = <StellarDeals>[];
      json['StellarDeals'].forEach((v) {
        stellarDeals!.add(StellarDeals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (stellarDeals != null) {
      data['StellarDeals'] = stellarDeals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StellarDeals {
  String? id;
  String? deal;
  String? text;
  String? leftDays;
  String? completed;
  String? isTCVisible;

  StellarDeals(
      {this.id,
      this.deal,
      this.text,
      this.leftDays,
      this.completed,
      this.isTCVisible});

  StellarDeals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deal = json['deal'];
    text = json['text'];
    leftDays = json['leftDays'];
    completed = json['completed'];
    isTCVisible = json['isTCVisible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['deal'] = deal;
    data['text'] = text;
    data['leftDays'] = leftDays;
    data['completed'] = completed;
    data['isTCVisible'] = isTCVisible;
    return data;
  }
}
