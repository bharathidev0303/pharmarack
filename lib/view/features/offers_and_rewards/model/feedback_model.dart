class FeedbackModel {
  List<SingleFeedback>? feedback;

  FeedbackModel({this.feedback});

  FeedbackModel.fromJson(Map<String, dynamic> json) {
    if (json['feedback'] != null) {
      feedback = <SingleFeedback>[];
      json['feedback'].forEach((v) {
        feedback!.add(SingleFeedback.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (feedback != null) {
      data['feedback'] = feedback!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SingleFeedback {
  String? id;
  String? question;
  String? ratings;

  SingleFeedback({this.id, this.question, this.ratings});

  SingleFeedback.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    ratings = json['ratings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['ratings'] = ratings;
    return data;
  }
}
