import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/view/features/offers_and_rewards/model/feedback_model.dart';

class FeedbacksGrid extends StatefulWidget {
  const FeedbacksGrid({super.key, required this.json});

  final String json;

  @override
  State<FeedbacksGrid> createState() => FeedbackState();
}

class FeedbackState extends State<FeedbacksGrid> {
  List<SingleFeedback> feedbacks = [];
  @override
  void initState() {
    super.initState();
    loadFeedbacks();
  }

  void loadFeedbacks() async {
    final res = await rootBundle.loadString(widget.json);
    final feedbacksList =
        FeedbackModel.fromJson(jsonDecode(res) as Map<String, dynamic>);
    setState(() {
      feedbacks = feedbacksList.feedback!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return feedbacks.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
            child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: (164 / 90),
                shrinkWrap: true,
                children: feedbacks
                    .map((feedback) => FeedbackItem(feedback))
                    .toList()),
          );
  }
}

class FeedbackItem extends StatelessWidget {
  final SingleFeedback feedback;
  const FeedbackItem(this.feedback, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '${feedback.question}',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryTextColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: RatingBar.builder(
                initialRating: double.parse(feedback.ratings ?? '0'),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 20,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: AppColors.feedbackStar,
                ),
                onRatingUpdate: (rating) {
                  debugPrint('$rating');
                },
              ),
            )
          ]),
    );
  }
}
