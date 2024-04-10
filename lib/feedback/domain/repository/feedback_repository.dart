
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/feedback/domain/usecase/save_feedback_usecase.dart';

abstract class FeedbackRepository {
  Future<Either<NetworkError, bool>> saveFeedback(
      SaveFeedbackUseCaseParams saveFeedbackUseCaseParams);
}
