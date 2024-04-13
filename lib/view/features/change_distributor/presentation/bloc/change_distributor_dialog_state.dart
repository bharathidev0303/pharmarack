import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/features/change_distributor/presentation/bloc/distributor_details.dart';

sealed class ChangeDistributorDialogState with EquatableMixin {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class ChangeDistributorDataState extends ChangeDistributorDialogState {
  final String productName;
  final String? offerName;
  final String? offerValue;
  final DistributorDetails? selectedDistributor;
  final List<DistributorDetails> distributors;

  ChangeDistributorDataState({
    required this.productName,
    required this.offerName,
    required this.offerValue,
    required this.selectedDistributor,
    required this.distributors,
  });

  ChangeDistributorDataState copyWith({
    String? productName,
    String? offerName,
    String? offerValue,
    DistributorDetails? Function()? selectedDistributor,
    List<DistributorDetails>? distributors,
  }) {
    return ChangeDistributorDataState(
      productName: productName ?? this.productName,
      offerName: offerName ?? this.offerName,
      offerValue: offerValue ?? this.offerValue,
      selectedDistributor: selectedDistributor != null
          ? selectedDistributor()
          : this.selectedDistributor,
      distributors: distributors ?? this.distributors,
    );
  }

  @override
  List<Object?> get props => [
        productName,
        offerName,
        offerValue,
        selectedDistributor ?? '',
        distributors,
      ];
}

class ChangeDistributorLoadingState extends ChangeDistributorDialogState {}

class ChangeDistributorErrorState extends ChangeDistributorDialogState {}

class NoDistributorsFoundErrorState extends ChangeDistributorDialogState {
  final String productName;

  NoDistributorsFoundErrorState({
    required this.productName,
  });

  NoDistributorsFoundErrorState copyWith({
    String? productName,
  }) {
    return NoDistributorsFoundErrorState(
      productName: productName ?? this.productName,
    );
  }

  @override
  List<Object?> get props => [
        productName,
      ];
}

class ChangeDistributorSuccessState extends ChangeDistributorDialogState {}
