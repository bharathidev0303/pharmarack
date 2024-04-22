import 'package:equatable/equatable.dart';

class DistributorConnectionAddTabState extends Equatable {
  final bool isLoading;
  final UserMessage userMessage;

  const DistributorConnectionAddTabState(this.isLoading, this.userMessage);

  factory DistributorConnectionAddTabState.initial() {
    return DistributorConnectionAddTabState(false, None());
  }

  @override
  List<Object?> get props => [isLoading, userMessage];

  DistributorConnectionAddTabState copyWith({
    bool? isLoading,
    UserMessage? userMessage,
  }) {
    return DistributorConnectionAddTabState(
      isLoading ?? this.isLoading,
      userMessage ?? this.userMessage,
    );
  }
}

sealed class UserMessage with EquatableMixin {
  @override
  List<Object> get props => [];
}

class None extends UserMessage {}

class InvalidDistributorName extends UserMessage {}

class InvalidContactNumber extends UserMessage {}

class InvalidMobileNumberFormat extends UserMessage {}

class AddDistributorSuccess extends UserMessage {}

class AddDistributorFailure extends UserMessage {}
