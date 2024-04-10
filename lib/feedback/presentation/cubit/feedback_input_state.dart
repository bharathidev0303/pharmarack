import 'package:equatable/equatable.dart';

abstract class FeedbackInputState extends Equatable {
  @override
  List<Object?> get props => [];

  const FeedbackInputState();
}

class FeedbackInputInitState extends FeedbackInputState {}

class FeedbackInputEmptyState extends FeedbackInputState {}

class FeedbackInputNotEmptyState extends FeedbackInputState {}
