import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/model/stockiest_priority_model.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/domain/use_case/save_distributor_priorities_use_case.dart';
import 'package:pharmarack/view/features/distributor_connection/stockiest_priority/presentation/cubit/states/save_priority_state.dart';

class SavePriorityCubit extends Cubit<SavePriorityState> {
  final SaveDistributorPrioritiesUseCase _saveDistributorPrioritiesUseCase;

  SavePriorityCubit(
    this._saveDistributorPrioritiesUseCase,
  ) : super(SavePriorityInitialState());

  void saveDistributorPriorities(
      int userId, List<StockiestPriorityModel> responses,
      {bool shouldEmitState = true}) async {
    const record = "\$RECORD\$";
    const field = "\$FIELD\$";
    String result = "";

    for (int i = 0; i < responses.length; ++i) {
      if (responses[i].priority != null) {
        result +=
            "${responses[i].storeId}$field${responses[i].displayIndex}$record";
      }
    }

    final response = await _saveDistributorPrioritiesUseCase.execute(
      params: SaveDistributorPrioritiesParams(
        SaveDistributorPrioritiesParam(userId, result, record, field),
      ),
    );

    if (shouldEmitState) {
      response.fold((l) {
        emit(
          FailureSavePriorityState(),
        );
      }, (r) {
        emit(
          SuccessSavePriorityState(PriorityState(r, UniqueKey().toString())),
        );
      });
    }
  }
}
