import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/login_entity.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/fulfilment_partner/data/endpoints_constants/fulfilment_partner_options.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/approve_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_param.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_search_param.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/approve_reject_mapping_request_use_case.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/request_cubit_use_case.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/request_search_filter_use_case.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/request_state.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/search_cubit.dart';

import '../../di/fulfilment_partner_providers.dart';

/// This class [RequestCubit] is consume by the [RequestPage]
/// where all state will observed by [FulfilmentPartnerPage]
class RequestCubit extends Cubit<RequestCubitState> {
  final RequestCubitUseCase _requestCubitUseCase;
  final RequestSearchUseCase _requestSearchUseCase;
  final ApproveRejectMappingUseCase _approveRejectMappingUseCase;
  final SearchCubit _searchCubit;
  bool progressFlag = false;

  RequestCubit(
    RequestCubitUseCase requestCubitUseCase,
    RequestSearchUseCase requestSearchUseCase,
    ApproveRejectMappingUseCase approveRejectMappingUseCase,
    SearchCubit searchCubit,
  )   : _requestCubitUseCase = requestCubitUseCase,
        _requestSearchUseCase = requestSearchUseCase,
        _approveRejectMappingUseCase = approveRejectMappingUseCase,
        _searchCubit = searchCubit,
        super(RequestCubitInitialState()) {
    getRequestedFulfillmentPartner(
        getIt<String>(instanceName: FulfilmentPartnerOptions.moduleName));
  }

  void getRequestedFulfillmentPartner(String moduleName,
      {bool isLoad = true}) async {
    if (isLoad) {
      await Future.delayed(const Duration(milliseconds: 300));
      emit(RequestCubitLoadingState());
    }

    final response = await _requestCubitUseCase.execute(
      params: RequestParams(
        RequestParam({FulfilmentPartnerOptions.moduleName: moduleName}),
      ),
    );

    response.fold((l) {
      emit(RequestCubitErrorState(
          l.getFriendlyMessage(), _requestSearchUseCase.requests));
    }, (r) {
      if (r.data == null || (r.data?.isEmpty ?? true)) {
        emit(RequestCubitNoDataState());
        return;
      }
      _requestSearchUseCase.updateRequests(r.data!);
      emit(RequestCubitDataState(r));
    });
  }

  void searchRequests() async {
    final response = await _requestSearchUseCase.execute(
      params: RequestSearchParams(
        RequestSearchParam(_searchCubit.state),
      ),
    );

    response.fold((l) {}, (r) {
      emit(RequestSearchState(r));
    });
  }

  void markRequestCheck(Request request) {
    final value = _requestSearchUseCase.getCheckedMarkRequests(
        request, _searchCubit.state);

    emit(RequestCheckedState(value));
  }

  void checkApproveRejectMapping(
      List<Request> requests, bool isMapped, String moduleName) async {
    final filterRequests =
        requests.where((element) => element.isSelected).toList();

    List<Future<Either<BaseError, ApproveRejectMappingModel>>> futures = [];

    emit(
      RejectRequestState(
        ApproveRejectMappingModel(isLoading: true),
        requests,
      ),
    );

    for (var value in filterRequests) {
      final map = {
        FulfilmentPartnerOptions.fulfillmentPartnerIdApi:
            value.fulfillmentPartnerId,
        FulfilmentPartnerOptions.isApprovedApi: (isMapped ? 1 : 0),
        FulfilmentPartnerOptions.id: value.retailerId,
        FulfilmentPartnerOptions.userId: getIt<LoginEntity>().userId,
        FulfilmentPartnerOptions.moduleName: moduleName
      };
      futures.add(_approveRejectMappingUseCase.execute(
        params: ApproveRejectParams(
          RequestParam(map),
        ),
      ));
    }
    var list = await Future.wait(futures);
    if (list.any((element) => element.isRight())) {
      int index = list.indexWhere((element) => element.isRight());
      list[index].fold((l) {}, (r) {
        emit(
          RejectRequestState(
            ApproveRejectMappingModel(
                isLoading: false, responseText: r.responseText),
            requests,
          ),
        );
      });
    } else {
      int index = list.indexWhere((element) => element.isLeft());
      list[index].fold((l) {
        emit(
          RejectRequestState(
            ApproveRejectMappingModel(
                isLoading: false, responseText: l.getFriendlyMessage()),
            requests,
          ),
        );
      }, (r) {});
    }
  }
}
