import 'package:get_it/get_it.dart';
import 'package:pharmarack/feedback/domain/repository/feedback_repository.dart';
import 'package:pharmarack/feedback/domain/usecase/save_feedback_usecase.dart';

import '../presentation/cubit/feedback_screen_cubit.dart';

final feedbackProvider = GetIt.instance;

final saveFeedbackUseCaseProvider =
    feedbackProvider.registerSingleton<SaveFeedbackUseCase>(SaveFeedbackUseCase(
        feedbackRepository: feedbackProvider<FeedbackRepository>()));

void initFeedbackDependency() {
  feedbackProvider.registerFactory<FeedbackScreenCubit>(() =>
      FeedbackScreenCubit(saveFeedbackUseCase: saveFeedbackUseCaseProvider));
}

void unregisterFeedbackDI() {
  if (feedbackProvider.isRegistered<SaveFeedbackUseCase>()) {
    feedbackProvider.unregister<SaveFeedbackUseCase>();
  }
  if (feedbackProvider.isRegistered<FeedbackScreenCubit>()) {
    feedbackProvider.unregister<FeedbackScreenCubit>();
  }
}
