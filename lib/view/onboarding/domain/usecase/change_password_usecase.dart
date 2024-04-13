import 'package:pharmarack/auth/user_auth_manager.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import '../repository/change_password_repository.dart';

class ChangePasswordUseCase {
  final ChangePasswordRepository _repository;
  final RetailerInfoEntity _retailerInfoEntity;
  final UserAuthManager _userAuthManager;

  ChangePasswordUseCase(
    this._repository,
    this._retailerInfoEntity,
    this._userAuthManager,
  );

  Future<void> execute(String oldPassword, String newPassword) async {
    await _repository
        .changePassword(
          currentPassword: oldPassword,
          newPassword: newPassword,
        )
        .then(
          (value) async => await _onSuccess(
            userName: _retailerInfoEntity.username!,
            password: newPassword,
          ),
        )
        .catchError((error) => throw error);
  }

  _onSuccess({required String userName, required String password}) async {
    await _userAuthManager.saveUsernamePassword(
      username: userName,
      password: password,
    );
  }
}
