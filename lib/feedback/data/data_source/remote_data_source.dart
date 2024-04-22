
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/feedback/data/api_service/feedback_api_service.dart';
import 'package:pharmarack/feedback/data/entities/feedback_api_request_entity.dart';
import 'package:pharmarack/feedback/domain/usecase/save_feedback_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';

class FeedbackRemoteDataSource {
  final FeedbackApiService feedbackApiService;

  const FeedbackRemoteDataSource({required this.feedbackApiService});

  Future<Either<NetworkError, bool>> saveFeedback(
      SaveFeedbackUseCaseParams saveFeedbackUseCaseParams) async {
    final response = await safeApiCall(feedbackApiService.saveFeedback(
        FeedbackApiRequestEntity(
                type: saveFeedbackUseCaseParams.type,
                feedbackTo: saveFeedbackUseCaseParams.feedbackTo,
                remarks: saveFeedbackUseCaseParams.remarks,
                rating: saveFeedbackUseCaseParams.rating,
                platform: saveFeedbackUseCaseParams.platform,
                appVersion: saveFeedbackUseCaseParams.appVersion,
                storeId: saveFeedbackUseCaseParams.storeId)
            .toJson()));
    return response.fold((l) => left(l), (r) {
      return right(r.data.success ?? false);
    });
  }
}
