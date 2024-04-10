

import 'package:pharmarack/packages/storage_utils/storage.dart';

class CommonLocalDataSource {
  final Storage _storage;
  final Storage _secureStorage;

  CommonLocalDataSource(this._storage, this._secureStorage);

  Future<void> clearStorage() async {
    _storage.clear();
    _secureStorage.clear();
  }
}
