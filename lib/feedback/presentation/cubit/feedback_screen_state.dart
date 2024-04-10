import 'package:equatable/equatable.dart';

abstract class FeedbackScreenState extends Equatable {
  @override
  List<Object?> get props => [];

  const FeedbackScreenState();
}

class FeedbackScreenInitState extends FeedbackScreenState {}

class FeedbackScreenLoadingState extends FeedbackScreenState {}

class FeedbackScreenErrorState extends FeedbackScreenState {}

class FeedbackScreenDataState extends FeedbackScreenState {}
