import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/view/dashboard_tile/merchandise_widgets/feature/banner/domain/banner_model.dart';

part 'banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  final BannerModel bannerModel;

  BannerCubit(super.initialState, this.bannerModel);
}
