import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_model.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_search_param.dart';

class RequestSearchUseCase
    extends BaseUseCase<BaseError, RequestSearchParams, List<Request>> {
  final List<Request> requests;

  RequestSearchUseCase(this.requests);

  void updateRequests(List<Request> currentRequests) {
    requests.clear();
    requests.addAll(currentRequests);
  }

  List<Request> getCheckedMarkRequests(Request request, String searchQuery) {
    int index = _filterCheckedItemIndex(requests, request.fulfillmentPartnerId);
    if (index != -1) {
      requests[index] = request;
    }

    final filterRequests = _searchBasedOnParam(searchQuery);
    int filterIndex =
        _filterCheckedItemIndex(filterRequests, request.fulfillmentPartnerId);
    if (filterIndex != -1) {
      filterRequests[filterIndex] = request;
    }
    return List.of(filterRequests);
  }

  @override
  Future<Either<BaseError, List<Request>>> execute(
      {required RequestSearchParams params}) {
    final searchString = params.requestSearchParam.searchQuery;

    final searchResult = _searchBasedOnParam(searchString);
    return Future(() => right(searchResult));
  }

  List<Request> _searchBasedOnParam(String searchString) {
    return searchString.isEmpty
        ? requests
        : requests
            .where((element) =>
                (element.mobileNumber
                        ?.toLowerCase()
                        .contains(searchString.toLowerCase()) ??
                    false) ||
                (element.fulfillmentPartnerName
                        ?.toLowerCase()
                        .contains(searchString.toLowerCase()) ??
                    false))
            .toList();
  }

  int _filterCheckedItemIndex(List<Request> currentRequests, int? id) {
    return currentRequests
        .indexWhere((element) => element.fulfillmentPartnerId == id);
  }
}

class RequestSearchParams extends Params {
  final RequestSearchParam requestSearchParam;

  RequestSearchParams(this.requestSearchParam);
}
