
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/core/common_utils/device_ifo/device_info.dart';
import 'package:pharmarack/packages/core/common_utils/location_manager/location_info.dart';
import 'package:pharmarack/view/dashboard/order_history/data/model/display_order_detail.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/usecase/reorder_use_case.dart';
import 'package:pharmarack/view/dashboard/order_history/presentation/cubit/reorder_state.dart';

import 'package:uuid/v4.dart';

class ReorderCubit extends Cubit<ReorderState> {
  final ReorderUseCase _reorderUseCase;

  ReorderCubit(super.initialState, this._reorderUseCase);

  void reorder(
    String? encryptedOrderId,
    List<InvoicedItems> orders,
    int? isMapStore,
    Future<String> address,
    Future<DeviceInfo> info,
    Future<LocationInfo> location,
  ) async {
    emit(
      state.copyWith(
        reorderMessage: ReorderLoading(),
        uniqueString: UniqueKey().toString(),
      ),
    );
    final ipAddress = await address;
    final deviceInfo = await info;
    final locationInfo = await location;

    final value = await _reorderUseCase.execute(
        params: orders.map((e) {
      return ReorderParam(
        orderId: encryptedOrderId ?? "",
        orderGuId: const UuidV4().generate(),
        ipAddress: ipAddress,
        version: deviceInfo.version,
        latitude: locationInfo.latitude.toString(),
        longitude: locationInfo.longitude.toString(),
        deviceName: "${deviceInfo.manufacturer} ${deviceInfo.model}",
        deviceId: deviceInfo.deviceId,
        os: deviceInfo.os,
        androidVersion: deviceInfo.version,
        isStoreMapped: isMapStore ?? 1,
      );
    }).toList());

    value.fold((l) {
      emit(
        state.copyWith(
          reorderMessage: ReorderFail(l.error.message),
          uniqueString: UniqueKey().toString(),
        ),
      );
    }, (r) {
      if (r.statusCode == "200") {
        emit(
          state.copyWith(
            reorderMessage: ReorderSuccess(),
            uniqueString: UniqueKey().toString(),
            reorderModel: r,
          ),
        );
      } else {
        emit(
          state.copyWith(
            reorderMessage: ReorderFail(r.message ?? ""),
            uniqueString: UniqueKey().toString(),
          ),
        );
      }
    });
  }

  void clearState() {
    emit(ReorderState.initial());
  }
}
