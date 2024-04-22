
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/feedback/presentation/cubit/feedback_input_state.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

class FeedbackInputCubit extends Cubit<FeedbackInputState> {
  double rating = 0;
  final textEditingController = TextEditingController();
  String hintTxt = 'Tell us more';
  FeedbackInputCubit() : super(FeedbackInputInitState());

  void updateRating(double updatedRating) {
    rating = updatedRating;
  }

  void updateOnFocusForTxtField(bool focus, BuildContext context) {
    if (focus) {
      hintTxt = '';
    } else {
      hintTxt = context.localizedString.feedbackRequestDialogTextFieldText;
    }
  }

  void validateRatingAndRemarks() {
    if (rating == 0 || textEditingController.text.isEmpty) {
      emit(FeedbackInputEmptyState());
    } else {
      emit(FeedbackInputNotEmptyState());
    }
  }
}
