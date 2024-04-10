import 'dart:io';


import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/feedback/domain/usecase/save_feedback_usecase.dart';
import 'package:pharmarack/feedback/presentation/cubit/feedback_input_cubit.dart';
import 'package:pharmarack/feedback/presentation/cubit/feedback_screen_state.dart';

class FeedbackScreenCubit extends Cubit<FeedbackScreenState> {
  final SaveFeedbackUseCase saveFeedbackUseCase;
  final feedbackInputCubit = FeedbackInputCubit();

  FeedbackScreenCubit({required this.saveFeedbackUseCase})
      : super(FeedbackScreenInitState());

  void saveFeedback({
    String? feedbackType,
    double? rating,
    String? storeId,
    String? remarks,
    String? feedbackTo,
  }) async {
    emit(FeedbackScreenLoadingState());
    final response = await saveFeedbackUseCase.execute(
      params: SaveFeedbackUseCaseParams(
        type: feedbackType ?? "Login/Activation",
        feedbackTo: feedbackTo ?? "P",
        remarks: remarks ?? feedbackInputCubit.textEditingController.text,
        rating: rating?.toString() ?? feedbackInputCubit.rating.toString(),
        appVersion: "3.0.0",
        platform: kIsWeb
            ? "web"
            : Platform.isAndroid
                ? "android"
                : "ios",
        storeId: storeId,
      ),
    );

    response.fold((l) => emit(FeedbackScreenErrorState()), (r) {
      if (r == true) {
        emit(FeedbackScreenDataState());
      } else {
        emit(FeedbackScreenErrorState());
      }
    });
  }
}
