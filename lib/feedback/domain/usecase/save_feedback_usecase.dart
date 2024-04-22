import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/feedback/domain/repository/feedback_repository.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';

class SaveFeedbackUseCase
    extends BaseUseCase<NetworkError, SaveFeedbackUseCaseParams, bool> {
  final FeedbackRepository feedbackRepository;

  SaveFeedbackUseCase({required this.feedbackRepository});

  @override
  Future<Either<NetworkError, bool>> execute(
      {required SaveFeedbackUseCaseParams params}) {
    return feedbackRepository.saveFeedback(params);
  }
}

class SaveFeedbackUseCaseParams extends Params {
  String type;
  String feedbackTo;
  String remarks;
  String rating;
  String appVersion;
  String platform;
  String? storeId;

  SaveFeedbackUseCaseParams(
      {required this.type,
      required this.feedbackTo,
      required this.remarks,
      required this.rating,
      required this.appVersion,
      required this.platform,
      this.storeId});
}
