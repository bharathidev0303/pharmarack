import 'package:equatable/equatable.dart';
import 'package:pharmarack/view/onboarding/domain/model/login_model.dart';


abstract class LoginScreenState extends Equatable {
  @override
  List<Object?> get props => [];

  const LoginScreenState();
}

class LoginScreenInitialState extends LoginScreenState {}

class LoginScreenLoadingState extends LoginScreenState {}

class CheckPasswordDialogState extends LoginScreenState {}

class LoginScreenUsernameNotValidState extends LoginScreenState {}

class LoginScreenPasswordNotValidState extends LoginScreenState {}

class LoginScreenErrorState extends LoginScreenState {
  final String? statusMessage;

  const LoginScreenErrorState({this.statusMessage});

  @override
  List<Object?> get props => [
        statusMessage,
      ];
}

class LoginScreenDataState extends LoginScreenState {
  final LoginModel? loginModel;

  const LoginScreenDataState({this.loginModel});

  @override
  List<Object?> get props => [
        loginModel,
      ];
}
