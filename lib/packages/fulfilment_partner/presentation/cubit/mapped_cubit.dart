import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/model/request/request_search_param.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/mapped_settings_search_use_case.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/mapped_settings_use_case.dart';
import 'package:pharmarack/packages/fulfilment_partner/domain/use_case/request_search_filter_use_case.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/mapped_state.dart';
import 'package:pharmarack/packages/fulfilment_partner/presentation/cubit/search_cubit.dart';

class MappedCubit extends Cubit<MappedSettingState> {
  final MappedSettingsUseCase _mappedSettingsUseCase;
  final MappedSettingsSearchUseCase _mappedSettingsSearchUseCase;
  final SearchCubit _searchCubit;

  MappedCubit(
      MappedSettingsUseCase mappedSettingsUseCase,
      MappedSettingsSearchUseCase mappedSettingsSearchUseCase,
      SearchCubit searchCubit)
      : _mappedSettingsUseCase = mappedSettingsUseCase,
        _mappedSettingsSearchUseCase = mappedSettingsSearchUseCase,
        _searchCubit = searchCubit,
        super(MappedSettingsInitialState());

  void getMappedSettingsRequests() async {
    await Future.delayed(const Duration(milliseconds: 500));
    emit(await Future.value(MappedSettingsLoadingState(
        _mappedSettingsSearchUseCase.mappedSettingsPartners)));

    final response =
        await _mappedSettingsUseCase.execute(params: MappedSettingsParams());

    response.fold((l) async {
      emit(
        MappedSettingsErrorState(
            _mappedSettingsSearchUseCase.mappedSettingsPartners, l),
      );
    }, (r) {
      if (r.mappedPartnerList == null ||
          (r.mappedPartnerList?.isEmpty ?? true)) {
        emit(MappedSettingsNoDataState());
        return;
      }
      _mappedSettingsSearchUseCase
          .updateMappedSettingPartners(r.mappedPartnerList!);
      emit(MappedSettingsSuccessState(r.mappedPartnerList!));
    });
  }

  void searchMappedSettingsRequest() async {
    final searchResults = await _mappedSettingsSearchUseCase.execute(
      params: RequestSearchParams(RequestSearchParam(_searchCubit.state)),
    );
    searchResults.fold((l) {}, (r) {
      emit(MappedSettingsSearchState(r));
    });
  }
}
