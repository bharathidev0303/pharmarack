import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/reorder_model.dart';


class ReorderState extends Equatable {
  final ReorderMessage reorderMessage;
  final ReorderModel reorderModel;
  final String uniqueString;

  const ReorderState({
    required this.reorderMessage,
    required this.reorderModel,
    required this.uniqueString,
  });

  factory ReorderState.initial() {
    return ReorderState(
      reorderMessage: ReorderNone(),
      reorderModel: ReorderModel(),
      uniqueString: "",
    );
  }

  ReorderState copyWith({
    ReorderMessage? reorderMessage,
    ReorderModel? reorderModel,
    String? uniqueString,
  }) {
    return ReorderState(
      reorderMessage: reorderMessage ?? this.reorderMessage,
      reorderModel: reorderModel ?? this.reorderModel,
      uniqueString: uniqueString ?? this.uniqueString,
    );
  }

  @override
  List<Object?> get props => [
        reorderModel,
        reorderMessage,
        uniqueString,
      ];
}

class ReorderMessage with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class ReorderNone extends ReorderMessage {}

class ReorderLoading extends ReorderMessage {}

class ReorderSuccess extends ReorderMessage {}

class ReorderFail extends ReorderMessage {
  final String errorMsg;

  ReorderFail(this.errorMsg);

  @override
  List<Object?> get props => [errorMsg];
}
