part of 'banner_cubit.dart';

class BannerState extends Equatable {
  final List<BannerModel> dashbaordBannerModel;

  const BannerState(this.dashbaordBannerModel);

  @override
  List<Object?> get props => [];
}

class BannerInitial extends BannerState {
  const BannerInitial(super.dashbaordBannerModel);

  @override
  List<Object?> get props => [];
}

class BannerLoading extends BannerState {
  const BannerLoading(super.dashbaordBannerModel);
}

class BannerLoadeded extends BannerState {
  const BannerLoadeded(super.dashbaordBannerModel);
}
