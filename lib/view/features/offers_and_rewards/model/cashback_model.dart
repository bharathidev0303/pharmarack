class CashbackModel {
  List<Cashbacks>? cashbacks;

  CashbackModel({this.cashbacks});

  CashbackModel.fromJson(Map<String, dynamic> json) {
    if (json['Cashbacks'] != null) {
      cashbacks = <Cashbacks>[];
      json['Cashbacks'].forEach((v) {
        cashbacks!.add(Cashbacks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (cashbacks != null) {
      data['Cashbacks'] = cashbacks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cashbacks {
  String? id;
  String? deal;
  String? text;
  String? leftDays;
  String? completed;

  Cashbacks({this.id, this.deal, this.text, this.leftDays, this.completed});

  Cashbacks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deal = json['deal'];
    text = json['text'];
    leftDays = json['leftDays'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['deal'] = deal;
    data['text'] = text;
    data['leftDays'] = leftDays;
    data['completed'] = completed;
    return data;
  }
}
