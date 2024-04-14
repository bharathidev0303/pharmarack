import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/profile/domain/model/profile_model.dart';

/// This class [ProfileState] which should be consume by Cubit as it's state
abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];

  const ProfileState();
}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileEmptyState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String errorMessage;

  const ProfileErrorState({required this.errorMessage});
}

class ProfileDataState extends ProfileState {
  final ProfileModel profileModel;

  const ProfileDataState({required this.profileModel});
}
