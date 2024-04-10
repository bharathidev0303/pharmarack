

import 'package:pharmarack/view/onboarding/domain/repository/invalid_new_password_exception.dart';
import 'package:pharmarack/view/onboarding/domain/repository/old_password_no_match_exception.dart';

import '../../data/api_service/change_password_api_service.dart';

class ChangePasswordRepository {
  static const _oldPwdNoMatch = 'Old password didnt match';
  static const _invalidPassword = 'Password is not valid';

  final ChangePasswordApiService _changePasswordApiService;

  ChangePasswordRepository(
    this._changePasswordApiService,
  );

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    var requestMap = {
      "currentPassword": currentPassword,
      "newPassword": newPassword
    };

    final response = await _changePasswordApiService.changePassword(requestMap);

    if (response.success == false) {
      if (response.message == _oldPwdNoMatch) {
        throw OldPasswordNoMatchException();
      } else if (response.message == _invalidPassword) {
        throw InvalidNewPasswordException();
      }
      throw Exception(response.message);
    }
  }
}
