
import 'package:pharmarack/auth/user_auth_manager.dart';

class MatchSavedPasswordUseCase {
  final UserAuthManager _userAuthManager;

  MatchSavedPasswordUseCase(this._userAuthManager);

  Future<bool> matchesWIth(String password) async {
    final savedPassword = await _userAuthManager.getPassword();
    return savedPassword == password;
  }
}
