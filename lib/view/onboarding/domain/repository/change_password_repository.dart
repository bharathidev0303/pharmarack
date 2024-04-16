import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/common_response_entity.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/view/onboarding/domain/repository/invalid_new_password_exception.dart';
import 'package:pharmarack/view/onboarding/domain/repository/old_password_no_match_exception.dart';
import 'package:pharmarack/view/onboarding/domain/repository/previeus_password_exception.dart';

import '../../data/api_service/change_password_api_service.dart';

class ChangePasswordRepository {
  static const _oldPwdNoMatch = 'Old password didnt match';
  static const _invalidPassword = 'Password is not valid';
  static const _prew_password =
      'Error: You have already used this password in your last attempts, Please try another';

  final ChangePasswordApiService _changePasswordApiService;

  ChangePasswordRepository(
    this._changePasswordApiService,
  );

  Future changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    var requestMap = {
      "currentPassword": currentPassword,
      "newPassword": newPassword
    };
    final response = await safeApiCall( _changePasswordApiService.changePassword(requestMap));
     response.fold((l) {
       if (l.error.code == 406) {
      if (l.error.message == _oldPwdNoMatch) {
        throw OldPasswordNoMatchException();
      } else if (l.error.message == _invalidPassword) {
        throw InvalidNewPasswordException();
      } else if (l.error.message == _prew_password) {
        throw PreviousPasswordException();
      } else {
        throw Exception(l.error.message);
      }
    } 
      return left(l);
     }, (r) {
      return right(r.data);
    });
    
  }
}
