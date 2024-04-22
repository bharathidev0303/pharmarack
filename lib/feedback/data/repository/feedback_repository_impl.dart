
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/feedback/data/data_source/remote_data_source.dart';
import 'package:pharmarack/feedback/domain/repository/feedback_repository.dart';
import 'package:pharmarack/feedback/domain/usecase/save_feedback_usecase.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';

class FeedbackRepositoryImpl extends FeedbackRepository {
  final FeedbackRemoteDataSource feedbackRemoteDataSource;

  FeedbackRepositoryImpl({required this.feedbackRemoteDataSource});

  @override
  Future<Either<NetworkError, bool>> saveFeedback(
      SaveFeedbackUseCaseParams saveFeedbackUseCaseParams) {
    return feedbackRemoteDataSource.saveFeedback(saveFeedbackUseCaseParams);
  }
}
